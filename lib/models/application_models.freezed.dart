// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'application_models.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

CurrentCycle _$CurrentCycleFromJson(Map<String, dynamic> json) {
  return _CurrentCycle.fromJson(json);
}

/// @nodoc
mixin _$CurrentCycle {
  int get currentValue => throw _privateConstructorUsedError;
  int get nextValue => throw _privateConstructorUsedError;
  String get currentCycleName => throw _privateConstructorUsedError;
  String get nextCycleName => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CurrentCycleCopyWith<CurrentCycle> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CurrentCycleCopyWith<$Res> {
  factory $CurrentCycleCopyWith(
          CurrentCycle value, $Res Function(CurrentCycle) then) =
      _$CurrentCycleCopyWithImpl<$Res, CurrentCycle>;
  @useResult
  $Res call(
      {int currentValue,
      int nextValue,
      String currentCycleName,
      String nextCycleName});
}

/// @nodoc
class _$CurrentCycleCopyWithImpl<$Res, $Val extends CurrentCycle>
    implements $CurrentCycleCopyWith<$Res> {
  _$CurrentCycleCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? currentValue = null,
    Object? nextValue = null,
    Object? currentCycleName = null,
    Object? nextCycleName = null,
  }) {
    return _then(_value.copyWith(
      currentValue: null == currentValue
          ? _value.currentValue
          : currentValue // ignore: cast_nullable_to_non_nullable
              as int,
      nextValue: null == nextValue
          ? _value.nextValue
          : nextValue // ignore: cast_nullable_to_non_nullable
              as int,
      currentCycleName: null == currentCycleName
          ? _value.currentCycleName
          : currentCycleName // ignore: cast_nullable_to_non_nullable
              as String,
      nextCycleName: null == nextCycleName
          ? _value.nextCycleName
          : nextCycleName // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_CurrentCycleCopyWith<$Res>
    implements $CurrentCycleCopyWith<$Res> {
  factory _$$_CurrentCycleCopyWith(
          _$_CurrentCycle value, $Res Function(_$_CurrentCycle) then) =
      __$$_CurrentCycleCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int currentValue,
      int nextValue,
      String currentCycleName,
      String nextCycleName});
}

/// @nodoc
class __$$_CurrentCycleCopyWithImpl<$Res>
    extends _$CurrentCycleCopyWithImpl<$Res, _$_CurrentCycle>
    implements _$$_CurrentCycleCopyWith<$Res> {
  __$$_CurrentCycleCopyWithImpl(
      _$_CurrentCycle _value, $Res Function(_$_CurrentCycle) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? currentValue = null,
    Object? nextValue = null,
    Object? currentCycleName = null,
    Object? nextCycleName = null,
  }) {
    return _then(_$_CurrentCycle(
      currentValue: null == currentValue
          ? _value.currentValue
          : currentValue // ignore: cast_nullable_to_non_nullable
              as int,
      nextValue: null == nextValue
          ? _value.nextValue
          : nextValue // ignore: cast_nullable_to_non_nullable
              as int,
      currentCycleName: null == currentCycleName
          ? _value.currentCycleName
          : currentCycleName // ignore: cast_nullable_to_non_nullable
              as String,
      nextCycleName: null == nextCycleName
          ? _value.nextCycleName
          : nextCycleName // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_CurrentCycle implements _CurrentCycle {
  const _$_CurrentCycle(
      {required this.currentValue,
      required this.nextValue,
      required this.currentCycleName,
      required this.nextCycleName});

  factory _$_CurrentCycle.fromJson(Map<String, dynamic> json) =>
      _$$_CurrentCycleFromJson(json);

  @override
  final int currentValue;
  @override
  final int nextValue;
  @override
  final String currentCycleName;
  @override
  final String nextCycleName;

  @override
  String toString() {
    return 'CurrentCycle(currentValue: $currentValue, nextValue: $nextValue, currentCycleName: $currentCycleName, nextCycleName: $nextCycleName)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_CurrentCycle &&
            (identical(other.currentValue, currentValue) ||
                other.currentValue == currentValue) &&
            (identical(other.nextValue, nextValue) ||
                other.nextValue == nextValue) &&
            (identical(other.currentCycleName, currentCycleName) ||
                other.currentCycleName == currentCycleName) &&
            (identical(other.nextCycleName, nextCycleName) ||
                other.nextCycleName == nextCycleName));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, currentValue, nextValue, currentCycleName, nextCycleName);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_CurrentCycleCopyWith<_$_CurrentCycle> get copyWith =>
      __$$_CurrentCycleCopyWithImpl<_$_CurrentCycle>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_CurrentCycleToJson(
      this,
    );
  }
}

abstract class _CurrentCycle implements CurrentCycle {
  const factory _CurrentCycle(
      {required final int currentValue,
      required final int nextValue,
      required final String currentCycleName,
      required final String nextCycleName}) = _$_CurrentCycle;

  factory _CurrentCycle.fromJson(Map<String, dynamic> json) =
      _$_CurrentCycle.fromJson;

  @override
  int get currentValue;
  @override
  int get nextValue;
  @override
  String get currentCycleName;
  @override
  String get nextCycleName;
  @override
  @JsonKey(ignore: true)
  _$$_CurrentCycleCopyWith<_$_CurrentCycle> get copyWith =>
      throw _privateConstructorUsedError;
}

Cycle _$CycleFromJson(Map<String, dynamic> json) {
  return _Cycle.fromJson(json);
}

/// @nodoc
mixin _$Cycle {
  String get id => throw _privateConstructorUsedError;
  @TimestampConverter()
  DateTime get createdAt => throw _privateConstructorUsedError;
  @TimestampConverter()
  DateTime? get completedAt => throw _privateConstructorUsedError;
  String get name =>
      throw _privateConstructorUsedError; // @JsonKey(name: 'paidAt', fromJson: _fromJson, toJson: _toJson)
  bool get isPaid => throw _privateConstructorUsedError;
  bool get isCompleted =>
      throw _privateConstructorUsedError; // @JsonKey(name: 'dates', fromJson: _fromListJson, toJson: _toListJson)
  @ListTimestampConverter()
  List<DateTime> get dates => throw _privateConstructorUsedError;
  @ListTimestampConverter()
  List<DateTime> get holidays => throw _privateConstructorUsedError;
  @TimestampConverter()
  DateTime? get paidAt => throw _privateConstructorUsedError;
  int get totalCycleDays => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CycleCopyWith<Cycle> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CycleCopyWith<$Res> {
  factory $CycleCopyWith(Cycle value, $Res Function(Cycle) then) =
      _$CycleCopyWithImpl<$Res, Cycle>;
  @useResult
  $Res call(
      {String id,
      @TimestampConverter() DateTime createdAt,
      @TimestampConverter() DateTime? completedAt,
      String name,
      bool isPaid,
      bool isCompleted,
      @ListTimestampConverter() List<DateTime> dates,
      @ListTimestampConverter() List<DateTime> holidays,
      @TimestampConverter() DateTime? paidAt,
      int totalCycleDays});
}

/// @nodoc
class _$CycleCopyWithImpl<$Res, $Val extends Cycle>
    implements $CycleCopyWith<$Res> {
  _$CycleCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? createdAt = null,
    Object? completedAt = freezed,
    Object? name = null,
    Object? isPaid = null,
    Object? isCompleted = null,
    Object? dates = null,
    Object? holidays = null,
    Object? paidAt = freezed,
    Object? totalCycleDays = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      completedAt: freezed == completedAt
          ? _value.completedAt
          : completedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      isPaid: null == isPaid
          ? _value.isPaid
          : isPaid // ignore: cast_nullable_to_non_nullable
              as bool,
      isCompleted: null == isCompleted
          ? _value.isCompleted
          : isCompleted // ignore: cast_nullable_to_non_nullable
              as bool,
      dates: null == dates
          ? _value.dates
          : dates // ignore: cast_nullable_to_non_nullable
              as List<DateTime>,
      holidays: null == holidays
          ? _value.holidays
          : holidays // ignore: cast_nullable_to_non_nullable
              as List<DateTime>,
      paidAt: freezed == paidAt
          ? _value.paidAt
          : paidAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      totalCycleDays: null == totalCycleDays
          ? _value.totalCycleDays
          : totalCycleDays // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_CycleCopyWith<$Res> implements $CycleCopyWith<$Res> {
  factory _$$_CycleCopyWith(_$_Cycle value, $Res Function(_$_Cycle) then) =
      __$$_CycleCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      @TimestampConverter() DateTime createdAt,
      @TimestampConverter() DateTime? completedAt,
      String name,
      bool isPaid,
      bool isCompleted,
      @ListTimestampConverter() List<DateTime> dates,
      @ListTimestampConverter() List<DateTime> holidays,
      @TimestampConverter() DateTime? paidAt,
      int totalCycleDays});
}

/// @nodoc
class __$$_CycleCopyWithImpl<$Res> extends _$CycleCopyWithImpl<$Res, _$_Cycle>
    implements _$$_CycleCopyWith<$Res> {
  __$$_CycleCopyWithImpl(_$_Cycle _value, $Res Function(_$_Cycle) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? createdAt = null,
    Object? completedAt = freezed,
    Object? name = null,
    Object? isPaid = null,
    Object? isCompleted = null,
    Object? dates = null,
    Object? holidays = null,
    Object? paidAt = freezed,
    Object? totalCycleDays = null,
  }) {
    return _then(_$_Cycle(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      completedAt: freezed == completedAt
          ? _value.completedAt
          : completedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      isPaid: null == isPaid
          ? _value.isPaid
          : isPaid // ignore: cast_nullable_to_non_nullable
              as bool,
      isCompleted: null == isCompleted
          ? _value.isCompleted
          : isCompleted // ignore: cast_nullable_to_non_nullable
              as bool,
      dates: null == dates
          ? _value._dates
          : dates // ignore: cast_nullable_to_non_nullable
              as List<DateTime>,
      holidays: null == holidays
          ? _value._holidays
          : holidays // ignore: cast_nullable_to_non_nullable
              as List<DateTime>,
      paidAt: freezed == paidAt
          ? _value.paidAt
          : paidAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      totalCycleDays: null == totalCycleDays
          ? _value.totalCycleDays
          : totalCycleDays // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Cycle implements _Cycle {
  const _$_Cycle(
      {required this.id,
      @TimestampConverter() required this.createdAt,
      @TimestampConverter() this.completedAt,
      required this.name,
      required this.isPaid,
      required this.isCompleted,
      @ListTimestampConverter() required final List<DateTime> dates,
      @ListTimestampConverter() required final List<DateTime> holidays,
      @TimestampConverter() this.paidAt,
      required this.totalCycleDays})
      : _dates = dates,
        _holidays = holidays;

  factory _$_Cycle.fromJson(Map<String, dynamic> json) =>
      _$$_CycleFromJson(json);

  @override
  final String id;
  @override
  @TimestampConverter()
  final DateTime createdAt;
  @override
  @TimestampConverter()
  final DateTime? completedAt;
  @override
  final String name;
// @JsonKey(name: 'paidAt', fromJson: _fromJson, toJson: _toJson)
  @override
  final bool isPaid;
  @override
  final bool isCompleted;
// @JsonKey(name: 'dates', fromJson: _fromListJson, toJson: _toListJson)
  final List<DateTime> _dates;
// @JsonKey(name: 'dates', fromJson: _fromListJson, toJson: _toListJson)
  @override
  @ListTimestampConverter()
  List<DateTime> get dates {
    if (_dates is EqualUnmodifiableListView) return _dates;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_dates);
  }

  final List<DateTime> _holidays;
  @override
  @ListTimestampConverter()
  List<DateTime> get holidays {
    if (_holidays is EqualUnmodifiableListView) return _holidays;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_holidays);
  }

  @override
  @TimestampConverter()
  final DateTime? paidAt;
  @override
  final int totalCycleDays;

  @override
  String toString() {
    return 'Cycle(id: $id, createdAt: $createdAt, completedAt: $completedAt, name: $name, isPaid: $isPaid, isCompleted: $isCompleted, dates: $dates, holidays: $holidays, paidAt: $paidAt, totalCycleDays: $totalCycleDays)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Cycle &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.completedAt, completedAt) ||
                other.completedAt == completedAt) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.isPaid, isPaid) || other.isPaid == isPaid) &&
            (identical(other.isCompleted, isCompleted) ||
                other.isCompleted == isCompleted) &&
            const DeepCollectionEquality().equals(other._dates, _dates) &&
            const DeepCollectionEquality().equals(other._holidays, _holidays) &&
            (identical(other.paidAt, paidAt) || other.paidAt == paidAt) &&
            (identical(other.totalCycleDays, totalCycleDays) ||
                other.totalCycleDays == totalCycleDays));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      createdAt,
      completedAt,
      name,
      isPaid,
      isCompleted,
      const DeepCollectionEquality().hash(_dates),
      const DeepCollectionEquality().hash(_holidays),
      paidAt,
      totalCycleDays);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_CycleCopyWith<_$_Cycle> get copyWith =>
      __$$_CycleCopyWithImpl<_$_Cycle>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_CycleToJson(
      this,
    );
  }
}

abstract class _Cycle implements Cycle {
  const factory _Cycle(
      {required final String id,
      @TimestampConverter() required final DateTime createdAt,
      @TimestampConverter() final DateTime? completedAt,
      required final String name,
      required final bool isPaid,
      required final bool isCompleted,
      @ListTimestampConverter() required final List<DateTime> dates,
      @ListTimestampConverter() required final List<DateTime> holidays,
      @TimestampConverter() final DateTime? paidAt,
      required final int totalCycleDays}) = _$_Cycle;

  factory _Cycle.fromJson(Map<String, dynamic> json) = _$_Cycle.fromJson;

  @override
  String get id;
  @override
  @TimestampConverter()
  DateTime get createdAt;
  @override
  @TimestampConverter()
  DateTime? get completedAt;
  @override
  String get name;
  @override // @JsonKey(name: 'paidAt', fromJson: _fromJson, toJson: _toJson)
  bool get isPaid;
  @override
  bool get isCompleted;
  @override // @JsonKey(name: 'dates', fromJson: _fromListJson, toJson: _toListJson)
  @ListTimestampConverter()
  List<DateTime> get dates;
  @override
  @ListTimestampConverter()
  List<DateTime> get holidays;
  @override
  @TimestampConverter()
  DateTime? get paidAt;
  @override
  int get totalCycleDays;
  @override
  @JsonKey(ignore: true)
  _$$_CycleCopyWith<_$_Cycle> get copyWith =>
      throw _privateConstructorUsedError;
}
