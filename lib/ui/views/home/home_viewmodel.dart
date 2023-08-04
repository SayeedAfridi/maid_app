import 'package:flutter/material.dart';
import 'package:maid/app/app.locator.dart';
import 'package:maid/models/application_models.dart';
import 'package:maid/services/store.service.dart';
import 'package:maid/utils/formater.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class HomeViewModel extends FutureViewModel<Cycle?> {
  final _store = locator<StoreService>();
  final _snackbar = locator<SnackbarService>();

  bool _isAdding = false;
  bool _isPaid = false;
  DateTime? _paidAt;
  bool _isPaying = false;

  int _totalCycleDays = 15;

  List<DateTime> _attendedDays = List.empty();

  bool get isAdding => _isAdding;
  bool get isPaid => _isPaid;
  DateTime? get paidAt => _paidAt;
  List<DateTime> get attendedDays => _attendedDays;
  bool get isPaying => _isPaying;
  int get totalCycleDays => _totalCycleDays;

  Future<void> addAttendance() async {
    _isAdding = true;
    notifyListeners();
    for (var i = _attendedDays.length - 1; i >= 0; i--) {
      if (formatDate(_attendedDays[i]) == formatDate(DateTime.now())) {
        _snackbar.registerSnackbarConfig(
          SnackbarConfig(
            snackPosition: SnackPosition.BOTTOM,
            backgroundColor: Colors.black45,
            borderRadius: 8,
          ),
        );
        _snackbar.showSnackbar(
          title: 'Already attended',
          message: 'Not needed now',
          mainButtonTitle: 'Close',
          onMainButtonTapped: _snackbar.closeSnackbar,
          duration: const Duration(seconds: 3),
        );
        _isAdding = false;
        return;
      }
    }
    List<DateTime> days = List.from(_attendedDays);
    days.add(DateTime.now());
    await _store.addAttendance(days);
    _isAdding = false;
    _snackbar.registerSnackbarConfig(
      SnackbarConfig(
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.black45,
        borderRadius: 8,
      ),
    );
    _snackbar.showSnackbar(
      title: 'Successful',
      message: 'Attendance given',
      mainButtonTitle: 'Close',
      onMainButtonTapped: _snackbar.closeSnackbar,
      duration: const Duration(seconds: 3),
    );
    _attendedDays = days;
    notifyListeners();
  }

  Future<void> makePayment() async {
    _isPaying = true;
    notifyListeners();
    await _store.makePayment();
    _isPaying = false;
    _snackbar.registerSnackbarConfig(
      SnackbarConfig(
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.green.withOpacity(0.8),
        borderRadius: 8,
      ),
    );
    _snackbar.showSnackbar(
      title: 'Successful',
      message: 'Pyment done',
      mainButtonTitle: 'Close',
      onMainButtonTapped: _snackbar.closeSnackbar,
      duration: const Duration(seconds: 3),
    );
    _isPaid = true;
    _paidAt = DateTime.now();
    notifyListeners();
  }

  @override
  Future<Cycle?> futureToRun() async {
    final cycle = await _store.getCurrentCycle();
    if (cycle == null) return null;
    _attendedDays = List.from(cycle.dates);
    _isPaid = cycle.isPaid;
    _paidAt = cycle.paidAt;
    _totalCycleDays = cycle.totalCycleDays;
    notifyListeners();
    return cycle;
  }
}
