import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:maid/ui/common/ui_helpers.dart';
import 'package:maid/ui/widgets/attended_day_grid.dart';
import 'package:maid/ui/widgets/day_card.dart';
import 'package:maid/utils/formater.dart';

import 'cycle_details_viewmodel.dart';

class CycleDetailsView extends StackedView<CycleDetailsViewModel> {
  final String cycleId;

  const CycleDetailsView({Key? key, required this.cycleId}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    CycleDetailsViewModel viewModel,
    Widget? child,
  ) {
    int attendedDays = viewModel.attendedDays.length;
    int holidays = viewModel.holidays.length;
    int daysUntilPayment =
        viewModel.totalCycleDays - viewModel.attendedDays.length;

    AppBar appBar = AppBar(
      centerTitle: true,
      title: Column(
        children: [
          SkeletonLoader(
            loading: viewModel.isBusy,
            child: Text(
              viewModel.data?.name ?? 'Cycle Details',
            ),
          ),
          const SizedBox(
            height: 2,
          ),
          Text(
            formatDate(DateTime.now()),
            style: const TextStyle(
              fontSize: 10,
            ),
          ),
        ],
      ),
    );

    return Scaffold(
      appBar: appBar,
      body: SafeArea(
        child: RefreshIndicator(
          onRefresh: viewModel.futureToRun,
          child: ListView.builder(
            itemBuilder: (ctx, idx) => Center(
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16.0,
                  vertical: 14.0,
                ),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: screenWidth(context) / 2.5,
                          child: Daycard(
                            days: attendedDays,
                            loading: viewModel.isBusy,
                            btnText: 'Add',
                            caption: 'Attended:',
                            btnLoading: false,
                            onTap: () {},
                            showBtn: false,
                            btnAlternativeText: 'Cyle completed',
                          ),
                        ),
                        SizedBox(
                          width: screenWidth(context) / 2.5,
                          child: Daycard(
                            days: holidays,
                            loading: viewModel.isBusy,
                            btnText: 'Add',
                            caption: 'Holidays:',
                            btnLoading: false,
                            onTap: () {},
                            showBtn: false,
                            btnAlternativeText: 'Cyle completed',
                            dayTextColor: Colors.red,
                            isHoliday: true,
                          ),
                        ),
                      ],
                    ),
                    verticalSpaceSmall,
                    !viewModel.isPaid
                        ? Daycard(
                            days: daysUntilPayment,
                            loading: viewModel.isBusy,
                            btnText: 'Pay now',
                            caption: 'Pay in:',
                            btnLoading: false,
                            onTap: () {},
                            dayTextColor:
                                daysUntilPayment <= 5 ? Colors.red : null,
                          )
                        : Card(
                            child: Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: Column(
                                children: [
                                  const Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Icon(
                                        Icons.celebration,
                                        size: 72,
                                      )
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    'Payment done.. 😎 ..on ${formatDate(viewModel.paidAt)}',
                                  ),
                                ],
                              ),
                            ),
                          ),
                    verticalSpaceMedium,
                    SkeletonLoader(
                      loading: viewModel.isBusy,
                      child: const Text(
                        'Attended dates',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    verticalSpaceSmall,
                    AttendedGrid(
                      dates: viewModel.attendedDays,
                      loading: viewModel.isBusy,
                    ),
                    holidays > 0
                        ? Column(
                            children: [
                              verticalSpaceMedium,
                              SkeletonLoader(
                                loading: viewModel.isBusy,
                                child: const Text(
                                  'Holidays',
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                              verticalSpaceSmall,
                              AttendedGrid(
                                dates: viewModel.holidays,
                                loading: viewModel.isBusy,
                                isHoliday: true,
                              ),
                            ],
                          )
                        : const SizedBox(),
                  ],
                ),
              ),
            ),
            itemCount: 1,
          ),
        ),
      ),
    );
  }

  @override
  CycleDetailsViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      CycleDetailsViewModel(cycleId: cycleId);
}
