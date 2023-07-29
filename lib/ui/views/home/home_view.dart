import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:maid/ui/common/app_colors.dart';
import 'package:maid/ui/common/ui_helpers.dart';

import 'home_viewmodel.dart';

class HomeView extends StackedView<HomeViewModel> {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    HomeViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25.0),
          child: Center(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                viewModel.isBusy
                    ? CircularProgressIndicator(
                        color: Theme.of(context).colorScheme.onBackground,
                        strokeWidth: 6,
                      )
                    : viewModel.data == null
                        ? const Text("No cycle created")
                        : Text(
                            viewModel.data?.name ?? 'name',
                          ),
              ],
            ),
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
