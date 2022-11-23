import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'trip_record.g.dart';

abstract class TripRecord implements Built<TripRecord, TripRecordBuilder> {
  static Serializer<TripRecord> get serializer => _$tripRecordSerializer;

  @BuiltValueField(wireName: 'FROM')
  String? get from;

  @BuiltValueField(wireName: 'TO')
  String? get to;

  @BuiltValueField(wireName: 'When')
  DateTime? get when;

  DocumentReference? get driver;

  BuiltList<DocumentReference>? get passengers;

  DocumentReference? get car;

  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference? get ffRef;
  DocumentReference get reference => ffRef!;

  static void _initializeBuilder(TripRecordBuilder builder) => builder
    ..from = ''
    ..to = ''
    ..passengers = ListBuilder();

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('trip');

  static Stream<TripRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static Future<TripRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  TripRecord._();
  factory TripRecord([void Function(TripRecordBuilder) updates]) = _$TripRecord;

  static TripRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference})!;
}

Map<String, dynamic> createTripRecordData({
  String? from,
  String? to,
  DateTime? when,
  DocumentReference? driver,
  DocumentReference? car,
}) {
  final firestoreData = serializers.toFirestore(
    TripRecord.serializer,
    TripRecord(
      (t) => t
        ..from = from
        ..to = to
        ..when = when
        ..driver = driver
        ..passengers = null
        ..car = car,
    ),
  );

  return firestoreData;
}
