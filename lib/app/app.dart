import 'package:maid/services/firebase.service.dart';
import 'package:maid/ui/bottom_sheets/notice/notice_sheet.dart';
import 'package:maid/ui/dialogs/info_alert/info_alert_dialog.dart';
import 'package:maid/ui/views/home/home_view.dart';
import 'package:maid/ui/views/startup/startup_view.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked/stacked_annotations.dart';
import 'package:stacked_services/stacked_services.dart';
// @stacked-import

@StackedApp(
  routes: [
    CustomRoute(page: HomeView),
    CustomRoute(
      page: StartupView,
      transitionsBuilder: TransitionsBuilders.fadeIn,
    ),
    // @stacked-route
  ],
  dependencies: [
    LazySingleton(classType: BottomSheetService),
    LazySingleton(classType: DialogService),
    LazySingleton(classType: NavigationService),
    Singleton(classType: FirebaseService),
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
