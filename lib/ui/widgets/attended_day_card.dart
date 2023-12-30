import 'package:flutter/material.dart';
import 'package:maid/constants/date.constant.dart';

class AttendedDayCard extends StatelessWidget {
  final DateTime date;
  final bool? isHoliday;

  const AttendedDayCard({
    super.key,
    required this.date,
    this.isHoliday,
  });

  @override
  Widget build(BuildContext context) {
    bool holiday = isHoliday == true;
    return Card(
      color: holiday ? Colors.red.shade500 : null,
      child: Padding(
        padding: const EdgeInsets.all(6),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                date.day.toString(),
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: holiday ? Colors.white : null,
                ),
              ),
              Text(
                ksMonthAbbr[date.month - 1],
                style: TextStyle(color: holiday ? Colors.white : null),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
