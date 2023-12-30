import 'package:flutter/material.dart';
import 'package:maid/ui/common/ui_helpers.dart';
import 'package:stacked/stacked.dart';

class Daycard extends StatelessWidget {
  final int days;
  final bool loading;
  final String caption;
  final String btnText;
  final void Function()? onTap;
  final bool btnLoading;
  final bool showBtn;
  final Color? dayTextColor;
  final String btnAlternativeText;
  final bool? isHoliday;

  const Daycard({
    super.key,
    required this.days,
    required this.loading,
    this.onTap,
    required this.btnText,
    required this.caption,
    required this.btnLoading,
    this.showBtn = true,
    this.dayTextColor,
    this.btnAlternativeText = '',
    this.isHoliday = false,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SkeletonLoader(
              loading: loading,
              child: Text(
                caption,
                style: const TextStyle(
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.baseline,
              textBaseline: TextBaseline.alphabetic,
              children: [
                SkeletonLoader(
                  loading: loading,
                  child: Text(
                    '$days',
                    style: TextStyle(
                      fontSize: 64,
                      fontWeight: FontWeight.bold,
                      color: dayTextColor,
                    ),
                  ),
                ),
                horizontalSpaceTiny,
                SkeletonLoader(
                  loading: loading,
                  child: Text(
                    days > 1 ? 'days' : 'day',
                    style: TextStyle(
                      color: dayTextColor,
                    ),
                  ),
                ),
              ],
            ),
            verticalSpaceSmall,
            showBtn
                ? SkeletonLoader(
                    loading: loading,
                    child: Align(
                      alignment: Alignment.center,
                      child: FilledButton(
                        onPressed: btnLoading ? () {} : onTap,
                        style: ButtonStyle(
                          backgroundColor: isHoliday == true
                              ? MaterialStateProperty.all(Colors.red)
                              : null,
                        ),
                        child: btnLoading
                            ? const SizedBox(
                                height: 20,
                                width: 20,
                                child: CircularProgressIndicator(
                                  color: Colors.white,
                                ),
                              )
                            : Text(
                                btnText,
                              ),
                      ),
                    ),
                  )
                : btnAlternativeText != ''
                    ? Align(
                        alignment: Alignment.center,
                        child: Text(
                          btnAlternativeText,
                          style: const TextStyle(
                            color: Colors.green,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      )
                    : const SizedBox(),
          ],
        ),
      ),
    );
  }
}
