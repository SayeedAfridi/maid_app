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
      createdAt:
          const TimestampConverter().fromJson(json['createdAt'] as Timestamp),
      paidAt: const TimestampConverter().fromJson(json['paidAt'] as Timestamp),
      isPaid: json['isPaid'] as bool,
      dates: const ListTimestampConverter()
          .fromJson(json['dates'] as List<Timestamp>),
    );

Map<String, dynamic> _$$_CycleToJson(_$_Cycle instance) => <String, dynamic>{
      'createdAt': const TimestampConverter().toJson(instance.createdAt),
      'paidAt': const TimestampConverter().toJson(instance.paidAt),
      'isPaid': instance.isPaid,
      'dates': const ListTimestampConverter().toJson(instance.dates),
    };
