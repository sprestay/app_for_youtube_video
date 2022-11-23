import 'dart:convert';

import '../../flutter_flow/flutter_flow_util.dart';

import 'api_manager.dart';

export 'api_manager.dart' show ApiCallResponse;

const _kPrivateApiFunctionName = 'ffPrivateApiCall';

class CitiesCall {
  static Future<ApiCallResponse> call({
    String? input = '',
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'Cities',
      apiUrl: 'https://maps.googleapis.com/maps/api/place/autocomplete/json?',
      callType: ApiCallType.GET,
      headers: {},
      params: {
        'input': input,
        'key': "AIzaSyA78a6Wnx52hGbp-3qHZ7Yr-iMurqAh8lw",
        'language': "ru",
        'components': "country:ru",
        'types': "locality",
      },
      returnBody: true,
      cache: false,
    );
  }
}

class ApiPagingParams {
  int nextPageNumber = 0;
  int numItems = 0;
  dynamic lastResponse;

  ApiPagingParams({
    required this.nextPageNumber,
    required this.numItems,
    required this.lastResponse,
  });

  @override
  String toString() =>
      'PagingParams(nextPageNumber: $nextPageNumber, numItems: $numItems, lastResponse: $lastResponse,)';
}

String _serializeList(List? list) {
  list ??= <String>[];
  try {
    return json.encode(list);
  } catch (_) {
    return '[]';
  }
}
