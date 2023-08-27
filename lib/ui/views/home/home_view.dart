import 'package:flutter/material.dart';
import 'package:maid/ui/views/active_cycle/active_cycle_view.dart';
import 'package:maid/ui/views/cycles/cycles_view.dart';
import 'package:maid/ui/widgets/dock_navigation_bar.dart';
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
    return Scaffold(
      extendBody: true,
      body: Stack(children: [
        Pages(
          pageController: viewModel.pageController,
          onPageChanged: viewModel.setIndex,
        ),
        // getViewFromIndex(viewModel.currentIndex),
        Positioned(
          bottom: 50,
          left: 0,
          right: 0,
          child: DockNavigationBar(
            currentIndex: viewModel.currentIndex,
            onTap: viewModel.changePage,
          ),
        ),
      ]),
    );
  }

  Widget getViewFromIndex(int index) {
    switch (index) {
      case 0:
        return const ActiveCycleView();
      case 1:
        return const CyclesView();
      default:
        return const ActiveCycleView();
    }
  }

  @override
  HomeViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      HomeViewModel();
}

class Pages extends StatelessWidget {
  const Pages({
    super.key,
    required this.pageController,
    this.onPageChanged,
  });

  final PageController pageController;
  final void Function(int)? onPageChanged;

  @override
  Widget build(BuildContext context) {
    return PageView(
      controller: pageController,
      onPageChanged: onPageChanged,
      children: const [
        ActiveCycleView(),
        CyclesView(),
      ],
    );
  }
}
