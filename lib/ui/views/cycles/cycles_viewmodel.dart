import 'package:maid/app/app.locator.dart';
import 'package:maid/app/app.router.dart';
import 'package:maid/models/application_models.dart';
import 'package:maid/services/store.service.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class CyclesViewModel extends FutureViewModel<List<Cycle>> {
  final _store = locator<StoreService>();
  final _navigation = locator<NavigationService>();

  List<Cycle> _cycles = [];

  List<Cycle> get cycles => _cycles;

  void navigateToDetails(String cycleId) {
    _navigation.navigateToCycleDetailsView(cycleId: cycleId);
  }

  @override
  Future<List<Cycle>> futureToRun() async {
    List<Cycle> cs = await _store.getCycles();
    _cycles = List.from(cs);
    notifyListeners();
    return cs;
  }
}
