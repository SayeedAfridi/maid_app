import 'package:intl/intl.dart';

String formatDate(DateTime? date) {
  if (date == null) return '';
  final format = DateFormat.yMMMd('en_US');
  return format.format(date);
}
