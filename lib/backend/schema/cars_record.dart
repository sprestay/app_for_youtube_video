import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'cars_record.g.dart';

abstract class CarsRecord implements Built<CarsRecord, CarsRecordBuilder> {
  static Serializer<CarsRecord> get serializer => _$carsRecordSerializer;

  String? get mark;

  BuiltList<String>? get models;

  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference? get ffRef;
  DocumentReference get reference => ffRef!;

  static void _initializeBuilder(CarsRecordBuilder builder) => builder
    ..mark = ''
    ..models = ListBuilder();

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('cars');

  static Stream<CarsRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static Future<CarsRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  CarsRecord._();
  factory CarsRecord([void Function(CarsRecordBuilder) updates]) = _$CarsRecord;

  static CarsRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference})!;
}

Map<String, dynamic> createCarsRecordData({
  String? mark,
}) {
  final firestoreData = serializers.toFirestore(
    CarsRecord.serializer,
    CarsRecord(
      (c) => c
        ..mark = mark
        ..models = null,
    ),
  );

  return firestoreData;
}
