// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cars_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<CarsRecord> _$carsRecordSerializer = new _$CarsRecordSerializer();

class _$CarsRecordSerializer implements StructuredSerializer<CarsRecord> {
  @override
  final Iterable<Type> types = const [CarsRecord, _$CarsRecord];
  @override
  final String wireName = 'CarsRecord';

  @override
  Iterable<Object?> serialize(Serializers serializers, CarsRecord object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.mark;
    if (value != null) {
      result
        ..add('mark')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.models;
    if (value != null) {
      result
        ..add('models')
        ..add(serializers.serialize(value,
            specifiedType:
                const FullType(BuiltList, const [const FullType(String)])));
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
  CarsRecord deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new CarsRecordBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'mark':
          result.mark = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'models':
          result.models.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(String)]))!
              as BuiltList<Object?>);
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

class _$CarsRecord extends CarsRecord {
  @override
  final String? mark;
  @override
  final BuiltList<String>? models;
  @override
  final DocumentReference<Object?>? ffRef;

  factory _$CarsRecord([void Function(CarsRecordBuilder)? updates]) =>
      (new CarsRecordBuilder()..update(updates))._build();

  _$CarsRecord._({this.mark, this.models, this.ffRef}) : super._();

  @override
  CarsRecord rebuild(void Function(CarsRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  CarsRecordBuilder toBuilder() => new CarsRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is CarsRecord &&
        mark == other.mark &&
        models == other.models &&
        ffRef == other.ffRef;
  }

  @override
  int get hashCode {
    return $jf(
        $jc($jc($jc(0, mark.hashCode), models.hashCode), ffRef.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'CarsRecord')
          ..add('mark', mark)
          ..add('models', models)
          ..add('ffRef', ffRef))
        .toString();
  }
}

class CarsRecordBuilder implements Builder<CarsRecord, CarsRecordBuilder> {
  _$CarsRecord? _$v;

  String? _mark;
  String? get mark => _$this._mark;
  set mark(String? mark) => _$this._mark = mark;

  ListBuilder<String>? _models;
  ListBuilder<String> get models =>
      _$this._models ??= new ListBuilder<String>();
  set models(ListBuilder<String>? models) => _$this._models = models;

  DocumentReference<Object?>? _ffRef;
  DocumentReference<Object?>? get ffRef => _$this._ffRef;
  set ffRef(DocumentReference<Object?>? ffRef) => _$this._ffRef = ffRef;

  CarsRecordBuilder() {
    CarsRecord._initializeBuilder(this);
  }

  CarsRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _mark = $v.mark;
      _models = $v.models?.toBuilder();
      _ffRef = $v.ffRef;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(CarsRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$CarsRecord;
  }

  @override
  void update(void Function(CarsRecordBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  CarsRecord build() => _build();

  _$CarsRecord _build() {
    _$CarsRecord _$result;
    try {
      _$result = _$v ??
          new _$CarsRecord._(
              mark: mark, models: _models?.build(), ffRef: ffRef);
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'models';
        _models?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'CarsRecord', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
