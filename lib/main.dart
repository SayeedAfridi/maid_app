import 'package:flutter/material.dart';
import 'package:maid/app/app.bottomsheets.dart';
import 'package:maid/app/app.dialogs.dart';
import 'package:maid/app/app.locator.dart';
import 'package:maid/app/app.router.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';

Future<void> main() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  await setupLocator();
  setupDialogUi();
  setupBottomSheetUi();
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: Routes.startupView,
      darkTheme: ThemeData.dark(),
      theme: ThemeData.light(),
      onGenerateRoute: StackedRouter().onGenerateRoute,
      themeMode: ThemeMode.system,
      navigatorKey: StackedService.navigatorKey,
      navigatorObservers: [
        StackedService.routeObserver,
      ],
    );
  }
}
