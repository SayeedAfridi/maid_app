import 'package:flutter/material.dart';
import 'package:maid/constants/date.constant.dart';

class AttendedDayCard extends StatelessWidget {
  final DateTime date;
  const AttendedDayCard({super.key, required this.date});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(6),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                date.day.toString(),
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                ksMonthAbbr[date.month - 1],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
