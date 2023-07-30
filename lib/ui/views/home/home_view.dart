import 'package:flutter/material.dart';
import 'package:maid/ui/common/ui_helpers.dart';
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
              child: SizedBox(
                height:
                    screenHeight(context) - appBar.preferredSize.height - 100,
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text('Attended this cycle'),
                    verticalSpaceTiny,
                    SkeletonLoader(
                      loading: viewModel.isBusy,
                      child: Text(
                        '$attendedDays',
                        style: const TextStyle(
                          fontSize: 64,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    verticalSpaceTiny,
                    Text(attendedDays > 1 ? 'Days' : 'Day'),
                    verticalSpaceLarge,
                    FilledButton(
                      onPressed: viewModel.addAttendance,
                      child: viewModel.isAdding
                          ? const SizedBox(
                              height: 20,
                              width: 20,
                              child: CircularProgressIndicator(
                                color: Colors.white,
                              ),
                            )
                          : const Text(
                              'Add Attendance',
                            ),
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
