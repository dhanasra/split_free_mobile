import 'dart:io';

import 'package:components/components.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:page_transition/page_transition.dart';
import '../views/welcome_screen.dart';
import 'app_routes.dart';

/*
App is the starting point class.
It is a singleton class.
 */
class App extends StatelessWidget {

  /*
  Create an instance of app
   */
  static const App _instance = App._internal();
  const App._internal();
  factory App() {
    return _instance;
  }

  @override
  Widget build(BuildContext context) {
    return getMaterialApp(widget: const WelcomeScreen(), title: 'Launch', buildContext: context);
  }

  /*
  Get All routes from AppRoutes
   */
  AppRoutes getAppRoutes() {
    return AppRoutes();
  }

  /*
  Returns a Material App Widget. Root node of App.
    */
  Widget getMaterialApp({required Widget widget, required String title, required BuildContext buildContext}) {
    return MaterialApp(
          title: title,
          debugShowCheckedModeBanner: false,
          home: widget,
          theme: AppStyle.lightTheme(buildContext),
          localizationsDelegates: buildContext.localizationDelegates,
          supportedLocales: buildContext.supportedLocales,
          locale: buildContext.locale,
          onGenerateRoute: getAppRoutes().getRoutes,
        );
  }

  /*
  To navigate to the screen with app route name.
    */
  Future<dynamic> setNavigation(BuildContext context, String appRouteName) async {
    Future.delayed(const Duration(milliseconds: 10), () async {
      final info = await Navigator.push(
          context,
          PageTransition(
              child: getAppRoutes().getWidget(context, appRouteName),
              type: PageTransitionType.fade,
              settings: RouteSettings(name: appRouteName),
              duration: const Duration(microseconds: 0))
      );
      return info;
    });
  }

  /*
  To back to the previous screen.
    */
  void setBackNavigation(BuildContext context) {
    Navigator.pop(context, "true");
  }

  /*
  To close the app.
    */
  void closeApp() {
    if (Platform.isAndroid) {
      SystemNavigator.pop();
    } else {
      exit(0);
    }
  }
}
