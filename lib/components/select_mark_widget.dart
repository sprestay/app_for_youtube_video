import '../backend/backend.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

class SelectMarkWidget extends StatefulWidget {
  const SelectMarkWidget({Key? key}) : super(key: key);

  @override
  _SelectMarkWidgetState createState() => _SelectMarkWidgetState();
}

class _SelectMarkWidgetState extends State<SelectMarkWidget> {
  PagingController<DocumentSnapshot?, CarsRecord>? _pagingController;
  Query? _pagingQuery;
  List<StreamSubscription?> _streamSubscriptions = [];

  @override
  void dispose() {
    _streamSubscriptions.forEach((s) => s?.cancel());
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.fromSTEB(2, 0, 0, 0),
      child: Container(
        width: double.infinity,
        height: 250,
        decoration: BoxDecoration(
          color: FlutterFlowTheme.of(context).secondaryBackground,
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(0),
            bottomRight: Radius.circular(0),
            topLeft: Radius.circular(10),
            topRight: Radius.circular(10),
          ),
        ),
        child: Padding(
          padding: EdgeInsetsDirectional.fromSTEB(25, 10, 25, 0),
          child: PagedListView<DocumentSnapshot<Object?>?, CarsRecord>(
            pagingController: () {
              final Query<Object?> Function(Query<Object?>) queryBuilder =
                  (carsRecord) => carsRecord;
              if (_pagingController != null) {
                final query = queryBuilder(CarsRecord.collection);
                if (query != _pagingQuery) {
                  // The query has changed
                  _pagingQuery = query;
                  _streamSubscriptions.forEach((s) => s?.cancel());
                  _streamSubscriptions.clear();
                  _pagingController!.refresh();
                }
                return _pagingController!;
              }

              _pagingController = PagingController(firstPageKey: null);
              _pagingQuery = queryBuilder(CarsRecord.collection);
              _pagingController!.addPageRequestListener((nextPageMarker) {
                queryCarsRecordPage(
                  queryBuilder: (carsRecord) => carsRecord,
                  nextPageMarker: nextPageMarker,
                  pageSize: 25,
                  isStream: true,
                ).then((page) {
                  _pagingController!.appendPage(
                    page.data,
                    page.nextPageMarker,
                  );
                  final streamSubscription = page.dataStream?.listen((data) {
                    final itemIndexes = _pagingController!.itemList!
                        .asMap()
                        .map((k, v) => MapEntry(v.reference.id, k));
                    data.forEach((item) {
                      final index = itemIndexes[item.reference.id];
                      final items = _pagingController!.itemList!;
                      if (index != null) {
                        items.replaceRange(index, index + 1, [item]);
                        _pagingController!.itemList = {
                          for (var item in items) item.reference: item
                        }.values.toList();
                      }
                    });
                    setState(() {});
                  });
                  _streamSubscriptions.add(streamSubscription);
                });
              });
              return _pagingController!;
            }(),
            padding: EdgeInsets.zero,
            scrollDirection: Axis.vertical,
            builderDelegate: PagedChildBuilderDelegate<CarsRecord>(
              // Customize what your widget looks like when it's loading the first page.
              firstPageProgressIndicatorBuilder: (_) => Center(
                child: SizedBox(
                  width: 50,
                  height: 50,
                  child: CircularProgressIndicator(
                    color: FlutterFlowTheme.of(context).primaryColor,
                  ),
                ),
              ),

              itemBuilder: (context, _, listViewIndex) {
                final listViewCarsRecord =
                    _pagingController!.itemList![listViewIndex];
                return InkWell(
                  onTap: () async {
                    setState(() =>
                        FFAppState().selectedMark = listViewCarsRecord.mark!);
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(
                          FFAppState().selectedMark,
                          style: TextStyle(
                            color: FlutterFlowTheme.of(context).primaryText,
                          ),
                        ),
                        duration: Duration(milliseconds: 4000),
                        backgroundColor: Color(0x00000000),
                      ),
                    );
                    Navigator.pop(context);
                  },
                  child: ListTile(
                    title: Text(
                      listViewCarsRecord.mark!,
                      style: FlutterFlowTheme.of(context).title3,
                    ),
                    trailing: Icon(
                      Icons.arrow_forward_ios,
                      color: Color(0xFF303030),
                      size: 20,
                    ),
                    tileColor: Color(0xFFF5F5F5),
                    dense: false,
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
