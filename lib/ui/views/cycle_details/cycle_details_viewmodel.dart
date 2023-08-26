import 'package:maid/app/app.locator.dart';
import 'package:maid/models/application_models.dart';
import 'package:maid/services/store.service.dart';
import 'package:stacked/stacked.dart';

class CycleDetailsViewModel extends FutureViewModel<Cycle?> {
  final _store = locator<StoreService>();
  final String cycleId;

  CycleDetailsViewModel({required this.cycleId});
  bool _isPaid = false;
  DateTime? _paidAt;

  int _totalCycleDays = 15;

  List<DateTime> _attendedDays = List.empty();

  bool get isPaid => _isPaid;
  DateTime? get paidAt => _paidAt;
  List<DateTime> get attendedDays => _attendedDays;
  int get totalCycleDays => _totalCycleDays;

  @override
  Future<Cycle?> futureToRun() async {
    final cycle = await _store.getCycle(cycleId);
    if (cycle == null) return null;
    _attendedDays = List.from(cycle.dates);
    _isPaid = cycle.isPaid;
    _paidAt = cycle.paidAt;
    _totalCycleDays = cycle.totalCycleDays;
    notifyListeners();
    return cycle;
  }
}
