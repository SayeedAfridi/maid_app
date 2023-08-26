import 'package:flutter/material.dart';
import 'package:maid/models/application_models.dart';
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
                  itemCount: viewModel.cycles.length,
                  itemBuilder: (BuildContext ctx, int index) {
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
