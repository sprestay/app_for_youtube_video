// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'trip_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<TripRecord> _$tripRecordSerializer = new _$TripRecordSerializer();

class _$TripRecordSerializer implements StructuredSerializer<TripRecord> {
  @override
  final Iterable<Type> types = const [TripRecord, _$TripRecord];
  @override
  final String wireName = 'TripRecord';

  @override
  Iterable<Object?> serialize(Serializers serializers, TripRecord object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.from;
    if (value != null) {
      result
        ..add('FROM')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.to;
    if (value != null) {
      result
        ..add('TO')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.when;
    if (value != null) {
      result
        ..add('When')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(DateTime)));
    }
    value = object.driver;
    if (value != null) {
      result
        ..add('driver')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                DocumentReference, const [const FullType.nullable(Object)])));
    }
    value = object.passengers;
    if (value != null) {
      result
        ..add('passengers')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(BuiltList, const [
              const FullType(
                  DocumentReference, const [const FullType.nullable(Object)])
            ])));
    }
    value = object.ffRef;
    if (value != null) {
      result
        ..add('Document__Reference__Field')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                DocumentReference, const [const FullType.nullable(Object)])));
    }
    return result;
  }

  @override
  TripRecord deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new TripRecordBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'FROM':
          result.from = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'TO':
          result.to = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'When':
          result.when = serializers.deserialize(value,
              specifiedType: const FullType(DateTime)) as DateTime?;
          break;
        case 'driver':
          result.driver = serializers.deserialize(value,
              specifiedType: const FullType(DocumentReference, const [
                const FullType.nullable(Object)
              ])) as DocumentReference<Object?>?;
          break;
        case 'passengers':
          result.passengers.replace(serializers.deserialize(value,
              specifiedType: const FullType(BuiltList, const [
                const FullType(
                    DocumentReference, const [const FullType.nullable(Object)])
              ]))! as BuiltList<Object?>);
          break;
        case 'Document__Reference__Field':
          result.ffRef = serializers.deserialize(value,
              specifiedType: const FullType(DocumentReference, const [
                const FullType.nullable(Object)
              ])) as DocumentReference<Object?>?;
          break;
      }
    }

    return result.build();
  }
}

class _$TripRecord extends TripRecord {
  @override
  final String? from;
  @override
  final String? to;
  @override
  final DateTime? when;
  @override
  final DocumentReference<Object?>? driver;
  @override
  final BuiltList<DocumentReference<Object?>>? passengers;
  @override
  final DocumentReference<Object?>? ffRef;

  factory _$TripRecord([void Function(TripRecordBuilder)? updates]) =>
      (new TripRecordBuilder()..update(updates))._build();

  _$TripRecord._(
      {this.from, this.to, this.when, this.driver, this.passengers, this.ffRef})
      : super._();

  @override
  TripRecord rebuild(void Function(TripRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  TripRecordBuilder toBuilder() => new TripRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is TripRecord &&
        from == other.from &&
        to == other.to &&
        when == other.when &&
        driver == other.driver &&
        passengers == other.passengers &&
        ffRef == other.ffRef;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc($jc($jc($jc(0, from.hashCode), to.hashCode), when.hashCode),
                driver.hashCode),
            passengers.hashCode),
        ffRef.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'TripRecord')
          ..add('from', from)
          ..add('to', to)
          ..add('when', when)
          ..add('driver', driver)
          ..add('passengers', passengers)
          ..add('ffRef', ffRef))
        .toString();
  }
}

class TripRecordBuilder implements Builder<TripRecord, TripRecordBuilder> {
  _$TripRecord? _$v;

  String? _from;
  String? get from => _$this._from;
  set from(String? from) => _$this._from = from;

  String? _to;
  String? get to => _$this._to;
  set to(String? to) => _$this._to = to;

  DateTime? _when;
  DateTime? get when => _$this._when;
  set when(DateTime? when) => _$this._when = when;

  DocumentReference<Object?>? _driver;
  DocumentReference<Object?>? get driver => _$this._driver;
  set driver(DocumentReference<Object?>? driver) => _$this._driver = driver;

  ListBuilder<DocumentReference<Object?>>? _passengers;
  ListBuilder<DocumentReference<Object?>> get passengers =>
      _$this._passengers ??= new ListBuilder<DocumentReference<Object?>>();
  set passengers(ListBuilder<DocumentReference<Object?>>? passengers) =>
      _$this._passengers = passengers;

  DocumentReference<Object?>? _ffRef;
  DocumentReference<Object?>? get ffRef => _$this._ffRef;
  set ffRef(DocumentReference<Object?>? ffRef) => _$this._ffRef = ffRef;

  TripRecordBuilder() {
    TripRecord._initializeBuilder(this);
  }

  TripRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _from = $v.from;
      _to = $v.to;
      _when = $v.when;
      _driver = $v.driver;
      _passengers = $v.passengers?.toBuilder();
      _ffRef = $v.ffRef;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(TripRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$TripRecord;
  }

  @override
  void update(void Function(TripRecordBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  TripRecord build() => _build();

  _$TripRecord _build() {
    _$TripRecord _$result;
    try {
      _$result = _$v ??
          new _$TripRecord._(
              from: from,
              to: to,
              when: when,
              driver: driver,
              passengers: _passengers?.build(),
              ffRef: ffRef);
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'passengers';
        _passengers?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'TripRecord', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
