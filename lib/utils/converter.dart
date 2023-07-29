import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class TimestampConverter implements JsonConverter<DateTime, Timestamp> {
  const TimestampConverter();

  @override
  DateTime fromJson(Timestamp timestamp) {
    return timestamp.toDate();
  }

  @override
  Timestamp toJson(DateTime date) => Timestamp.fromDate(date);
}

class ListTimestampConverter
    implements JsonConverter<List<DateTime>, List<dynamic>> {
  const ListTimestampConverter();

  @override
  List<DateTime> fromJson(List<dynamic> timestamps) {
    return (timestamps).map((e) => (e as Timestamp).toDate()).toList();
  }

  @override
  List<Timestamp> toJson(List<DateTime> dates) =>
      dates.map((e) => Timestamp.fromDate(e)).toList();
}
