import 'package:animations/animations.dart';
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
      body: PageTransitionSwitcher(
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
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Theme.of(context).primaryColor,
        currentIndex: viewModel.currentIndex,
        onTap: viewModel.setIndex,
        items: const [
          BottomNavigationBarItem(
            label: 'Active Cycle',
            icon: Icon(Icons.art_track),
          ),
          BottomNavigationBarItem(
            label: 'Cycles',
            icon: Icon(Icons.list),
          ),
        ],
      ),
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
