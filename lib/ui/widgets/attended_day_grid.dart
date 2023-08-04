import 'package:flutter/material.dart';
import 'package:maid/ui/widgets/attended_day_card.dart';
import 'package:stacked/stacked.dart';

class AttendedGrid extends StatelessWidget {
  final List<DateTime> dates;
  final bool loading;

  const AttendedGrid({super.key, required this.dates, required this.loading});

  @override
  Widget build(BuildContext context) {
    if (loading) {
      return GridView.count(
        crossAxisCount: 4,
        mainAxisSpacing: 10,
        crossAxisSpacing: 10,
        shrinkWrap: true,
        primary: false,
        padding: const EdgeInsets.only(top: 4.0),
        children: List.filled(
            8,
            SkeletonLoader(
              loading: true,
              child: AttendedDayCard(
                date: DateTime.now(),
              ),
            )),
      );
    }
    return GridView.builder(
      shrinkWrap: true,
      primary: false,
      padding: const EdgeInsets.only(top: 4.0),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 4,
        mainAxisSpacing: 10,
        crossAxisSpacing: 10,
      ),
      itemCount: dates.length,
      itemBuilder: (context, index) => AttendedDayCard(
        date: dates[index],
      ),
    );
  }
}
