import 'package:flutter/material.dart';
import 'package:maid/models/application_models.dart';
import 'package:maid/ui/common/ui_helpers.dart';
import 'package:maid/utils/formater.dart';
import 'package:stacked/stacked.dart';

import 'cycles_viewmodel.dart';

class CyclesView extends StackedView<CyclesViewModel> {
  const CyclesView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    CyclesViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Column(
          children: [
            SkeletonLoader(
              loading: viewModel.isBusy,
              child: const Text(
                'Cycles',
              ),
            ),
            const SizedBox(
              height: 2,
            ),
            const Text(
              'All completed cycles',
              style: TextStyle(
                fontSize: 10,
              ),
            ),
          ],
        ),
      ),
      body: SafeArea(
        child: viewModel.isBusy
            ? ListView()
            : RefreshIndicator(
                onRefresh: viewModel.futureToRun,
                child: ListView.builder(
                  itemCount:
                      viewModel.cycles.isEmpty ? 1 : viewModel.cycles.length,
                  itemBuilder: (BuildContext ctx, int index) {
                    if (viewModel.cycles.isEmpty) {
                      return Center(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            const SizedBox(
                              height: 150,
                            ),
                            Image.asset(
                              'assets/images/not-found.png',
                              height: 200,
                            ),
                            verticalSpaceSmall,
                            const Text(
                              'No completed cycle found',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      );
                    }
                    Cycle cycle = viewModel.cycles[index];
                    return GestureDetector(
                      onTap: () {
                        viewModel.navigateToDetails(cycle.id);
                      },
                      child: ListTile(
                        leading: const Icon(Icons.cyclone),
                        title: Text(cycle.name),
                        subtitle: Text(
                          'From ${formatDate(cycle.createdAt)} to ${formatDate(cycle.completedAt)}',
                          style: const TextStyle(
                            fontSize: 10,
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
      ),
    );
  }

  @override
  CyclesViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      CyclesViewModel();
}
