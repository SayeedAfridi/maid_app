import 'package:flutter/material.dart';
import 'package:maid/ui/common/ui_helpers.dart';
import 'package:maid/ui/widgets/attended_day_grid.dart';
import 'package:maid/ui/widgets/day_card.dart';
import 'package:maid/utils/formater.dart';
import 'package:stacked/stacked.dart';

import 'home_viewmodel.dart';

class HomeView extends StackedView<HomeViewModel> {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    HomeViewModel viewModel,
    Widget? child,
  ) {
    int attendedDays = viewModel.attendedDays.length;
    int daysUntilPayment = 15 - viewModel.attendedDays.length;

    AppBar appBar = AppBar(
      centerTitle: true,
      title: Column(
        children: [
          SkeletonLoader(
            loading: viewModel.isBusy,
            child: Text(
              viewModel.data?.name.split('-').join(' ').toUpperCase() ??
                  'Current cycle',
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
                  vertical: 10.0,
                ),
                child: Column(
                  children: [
                    Daycard(
                      days: attendedDays,
                      loading: viewModel.isBusy,
                      btnText: 'Add Attendance',
                      caption: 'Attended:',
                      btnLoading: viewModel.isAdding,
                      onTap: viewModel.addAttendance,
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
                          )
                        : const Card(
                            child: Padding(
                              padding: EdgeInsets.all(16.0),
                              child: Column(
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Icon(
                                        Icons.celebration,
                                        size: 72,
                                      )
                                    ],
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Text('Payment done.. 😎'),
                                ],
                              ),
                            ),
                          ),
                    verticalSpaceMedium,
                    SkeletonLoader(
                      loading: viewModel.isBusy,
                      child: const Text('Attended dates'),
                    ),
                    verticalSpaceSmall,
                    AttendedGrid(
                      dates: viewModel.attendedDays,
                      loading: viewModel.isBusy,
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
  HomeViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      HomeViewModel();
}
