import 'package:flutter/material.dart';
import 'package:maid/ui/common/ui_helpers.dart';
import 'package:maid/ui/widgets/attended_day_grid.dart';
import 'package:maid/ui/widgets/day_card.dart';
import 'package:maid/utils/formater.dart';
import 'package:stacked/stacked.dart';

import 'active_cycle_viewmodel.dart';

class ActiveCycleView extends StackedView<ActiveCycleViewModel> {
  const ActiveCycleView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    ActiveCycleViewModel viewModel,
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
              viewModel.data?.name ?? 'Current cycle',
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
                            btnLoading: viewModel.isAdding,
                            onTap: viewModel.addAttendance,
                            showBtn: attendedDays < viewModel.totalCycleDays,
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
                            btnLoading: viewModel.isAddingHoliday,
                            onTap: viewModel.addHoliday,
                            showBtn: attendedDays < viewModel.totalCycleDays,
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
                            btnLoading: viewModel.isPaying,
                            onTap: viewModel.makePayment,
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
  ActiveCycleViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      ActiveCycleViewModel();
}
