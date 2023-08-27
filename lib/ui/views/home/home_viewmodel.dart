import 'package:flutter/widgets.dart';
import 'package:stacked/stacked.dart';

class HomeViewModel extends IndexTrackingViewModel {
  final PageController _pageController = PageController(initialPage: 0);

  PageController get pageController => _pageController;

  Future<void> changePage(int index) async {
    await _pageController.animateToPage(
      index,
      duration: const Duration(milliseconds: 300),
      curve: Curves.decelerate,
    );
    setIndex(index);
  }
}
