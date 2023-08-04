import 'package:flutter/material.dart';
import 'package:maid/app/app.bottomsheets.dart';
import 'package:maid/app/app.dialogs.dart';
import 'package:maid/app/app.locator.dart';
import 'package:maid/models/application_models.dart';
import 'package:maid/services/store.service.dart';
import 'package:maid/ui/common/app_strings.dart';
import 'package:maid/utils/formater.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class HomeViewModel extends FutureViewModel<Cycle?> {
  final _dialogService = locator<DialogService>();
  final _bottomSheetService = locator<BottomSheetService>();
  final _store = locator<StoreService>();
  final _snackbar = locator<SnackbarService>();

  bool _isAdding = false;
  bool _isPaid = false;
  DateTime? _paidAt;
  bool _isPaying = false;

  List<DateTime> _attendedDays = List.empty();

  String get counterLabel => 'Counter is: $_counter';

  int _counter = 0;

  bool get isAdding => _isAdding;
  bool get isPaid => _isPaid;
  DateTime? get paidAt => _paidAt;
  List<DateTime> get attendedDays => _attendedDays;
  bool get isPaying => _isPaying;

  void incrementCounter() {
    _counter++;
    rebuildUi();
  }

  void showDialog() {
    _dialogService.showCustomDialog(
      variant: DialogType.infoAlert,
      title: 'Stacked Rocks!',
      description: 'Give stacked $_counter stars on Github',
    );
  }

  void showBottomSheet() {
    _bottomSheetService.showCustomSheet(
      variant: BottomSheetType.notice,
      title: ksHomeBottomSheetTitle,
      description: ksHomeBottomSheetDescription,
    );
  }

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
    _attendedDays.add(DateTime.now());
    await _store.addAttendance(_attendedDays, null);
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
    notifyListeners();
  }

  Future<void> makePayment() async {
    _isPaying = true;
    notifyListeners();
    await _store.makePayment();
    _isPaid = true;
    _paidAt = DateTime.now();
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
    notifyListeners();
  }

  @override
  Future<Cycle?> futureToRun() async {
    await Future.delayed(Duration(seconds: 2));
    final cycle = await _store.getCurrentCycle();
    if (cycle == null) return null;
    _attendedDays = List.from(cycle.dates);
    _isPaid = cycle.isPaid;
    _paidAt = cycle.paidAt;
    notifyListeners();
    return cycle;
  }
}
