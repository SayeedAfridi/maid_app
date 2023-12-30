// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'application_models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_CurrentCycle _$$_CurrentCycleFromJson(Map<String, dynamic> json) =>
    _$_CurrentCycle(
      currentValue: json['currentValue'] as int,
      nextValue: json['nextValue'] as int,
      currentCycleName: json['currentCycleName'] as String,
      nextCycleName: json['nextCycleName'] as String,
    );

Map<String, dynamic> _$$_CurrentCycleToJson(_$_CurrentCycle instance) =>
    <String, dynamic>{
      'currentValue': instance.currentValue,
      'nextValue': instance.nextValue,
      'currentCycleName': instance.currentCycleName,
      'nextCycleName': instance.nextCycleName,
    };

_$_Cycle _$$_CycleFromJson(Map<String, dynamic> json) => _$_Cycle(
      id: json['id'] as String,
      createdAt:
          const TimestampConverter().fromJson(json['createdAt'] as Timestamp),
      completedAt: _$JsonConverterFromJson<Timestamp, DateTime>(
          json['completedAt'], const TimestampConverter().fromJson),
      name: json['name'] as String,
      isPaid: json['isPaid'] as bool,
      isCompleted: json['isCompleted'] as bool,
      dates: const ListTimestampConverter().fromJson(json['dates'] as List),
      holidays:
          const ListTimestampConverter().fromJson(json['holidays'] as List),
      paidAt: _$JsonConverterFromJson<Timestamp, DateTime>(
          json['paidAt'], const TimestampConverter().fromJson),
      totalCycleDays: json['totalCycleDays'] as int,
    );

Map<String, dynamic> _$$_CycleToJson(_$_Cycle instance) => <String, dynamic>{
      'id': instance.id,
      'createdAt': const TimestampConverter().toJson(instance.createdAt),
      'completedAt': _$JsonConverterToJson<Timestamp, DateTime>(
          instance.completedAt, const TimestampConverter().toJson),
      'name': instance.name,
      'isPaid': instance.isPaid,
      'isCompleted': instance.isCompleted,
      'dates': const ListTimestampConverter().toJson(instance.dates),
      'holidays': const ListTimestampConverter().toJson(instance.holidays),
      'paidAt': _$JsonConverterToJson<Timestamp, DateTime>(
          instance.paidAt, const TimestampConverter().toJson),
      'totalCycleDays': instance.totalCycleDays,
    };

Value? _$JsonConverterFromJson<Json, Value>(
  Object? json,
  Value? Function(Json json) fromJson,
) =>
    json == null ? null : fromJson(json as Json);

Json? _$JsonConverterToJson<Json, Value>(
  Value? value,
  Json? Function(Value value) toJson,
) =>
    value == null ? null : toJson(value);
