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

  const Daycard({
    super.key,
    required this.days,
    required this.loading,
    this.onTap,
    required this.btnText,
    required this.caption,
    required this.btnLoading,
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
              child: Text(caption),
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
                    style: const TextStyle(
                      fontSize: 64,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                horizontalSpaceTiny,
                SkeletonLoader(
                  loading: loading,
                  child: Text(
                    days > 1 ? 'days' : 'day',
                  ),
                ),
              ],
            ),
            verticalSpaceSmall,
            SkeletonLoader(
              loading: loading,
              child: Align(
                alignment: Alignment.center,
                child: FilledButton(
                  onPressed: btnLoading ? () {} : onTap,
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
            ),
          ],
        ),
      ),
    );
  }
}
