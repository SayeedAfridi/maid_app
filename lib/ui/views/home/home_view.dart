import 'package:animations/animations.dart';
import 'package:dot_navigation_bar/dot_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:maid/ui/views/active_cycle/active_cycle_view.dart';
import 'package:maid/ui/views/cycles/cycles_view.dart';
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
        PageTransitionSwitcher(
          duration: const Duration(
            milliseconds: 800,
          ),
          reverse: viewModel.reverse,
          transitionBuilder: (child, primaryAnimation, secondaryAnimation) {
            return SharedAxisTransition(
              animation: primaryAnimation,
              secondaryAnimation: secondaryAnimation,
              transitionType: SharedAxisTransitionType.horizontal,
              child: child,
            );
          },
          child: getViewFromIndex(viewModel.currentIndex),
        ),
        Positioned(
          bottom: 20,
          left: 0,
          right: 0,
          child: Wrap(
            children: [
              DotNavigationBar(
                currentIndex: viewModel.currentIndex,
                onTap: viewModel.setIndex,
                backgroundColor: Theme.of(context).cardColor,
                items: [
                  DotNavigationBarItem(
                    icon: const Icon(Icons.today),
                    selectedColor: Colors.amber,
                  ),
                  DotNavigationBarItem(
                    icon: const Icon(Icons.view_list),
                    selectedColor: Colors.deepOrangeAccent,
                  ),
                ],
              )
            ],
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
