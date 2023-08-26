import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:maid/utils/converter.dart';

// required: associates our `main.dart` with the code generated by Freezed
part 'application_models.freezed.dart';
// optional: Since our Person class is serializable, we must add this line.
// But if Person was not serializable, we could skip it.
part 'application_models.g.dart';

@freezed
class CurrentCycle with _$CurrentCycle {
  const factory CurrentCycle({
    required int currentValue,
    required int nextValue,
    required String currentCycleName,
    required String nextCycleName,
  }) = _CurrentCycle;

  factory CurrentCycle.fromJson(Map<String, Object?> json) =>
      _$CurrentCycleFromJson(json);
}

@freezed
class Cycle with _$Cycle {
  const factory Cycle({
    required String id,
    @TimestampConverter() required DateTime createdAt,
    @TimestampConverter() DateTime? completedAt,
    required String name,
    // @JsonKey(name: 'paidAt', fromJson: _fromJson, toJson: _toJson)
    required bool isPaid,
    required bool isCompleted,
    // @JsonKey(name: 'dates', fromJson: _fromListJson, toJson: _toListJson)
    @ListTimestampConverter() required List<DateTime> dates,
    @TimestampConverter() DateTime? paidAt,
    required int totalCycleDays,
  }) = _Cycle;

  factory Cycle.fromJson(Map<String, Object?> json) => _$CycleFromJson(json);
}
