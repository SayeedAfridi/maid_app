import 'package:maid/services/firebase.service.dart';
import 'package:maid/services/store.service.dart';
import 'package:maid/ui/bottom_sheets/notice/notice_sheet.dart';
import 'package:maid/ui/dialogs/info_alert/info_alert_dialog.dart';
import 'package:maid/ui/views/home/home_view.dart';
import 'package:maid/ui/views/startup/startup_view.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked/stacked_annotations.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:maid/ui/views/active_cycle/active_cycle_view.dart';
import 'package:maid/ui/views/cycle_details/cycle_details_view.dart';
import 'package:maid/ui/views/cycles/cycles_view.dart';
// @stacked-import

@StackedApp(
  routes: [
    CustomRoute(page: HomeView),
    CustomRoute(
      page: StartupView,
      transitionsBuilder: TransitionsBuilders.fadeIn,
    ),
    MaterialRoute(page: ActiveCycleView),
    MaterialRoute(page: CycleDetailsView),
    MaterialRoute(page: CyclesView),
// @stacked-route
  ],
  dependencies: [
    LazySingleton(classType: BottomSheetService),
    LazySingleton(classType: SnackbarService),
    LazySingleton(classType: DialogService),
    LazySingleton(classType: NavigationService),
    Singleton(classType: FirebaseService),
    LazySingleton(classType: StoreService),
    // @stacked-service
  ],
  bottomsheets: [
    StackedBottomsheet(classType: NoticeSheet),
    // @stacked-bottom-sheet
  ],
  dialogs: [
    StackedDialog(classType: InfoAlertDialog),
    // @stacked-dialog
  ],
)
class App {}
