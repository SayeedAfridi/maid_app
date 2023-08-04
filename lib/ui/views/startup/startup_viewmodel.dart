import 'package:maid/services/firebase.service.dart';
import 'package:maid/services/store.service.dart';
import 'package:stacked/stacked.dart';
import 'package:maid/app/app.locator.dart';
import 'package:maid/app/app.router.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';

class StartupViewModel extends BaseViewModel {
  final _navigationService = locator<NavigationService>();
  final _firebase = locator<FirebaseService>();
  final _store = locator<StoreService>();
  // Place anything here that needs to happen before we get into the application
  Future runStartupLogic() async {
    FlutterNativeSplash.remove();

    await _firebase.init();
    await _store.init();

    await Future.delayed(const Duration(seconds: 1));

    _navigationService.replaceWithHomeView(
      null,
      true,
      null,
      TransitionsBuilders.fadeIn,
    );
  }
}
