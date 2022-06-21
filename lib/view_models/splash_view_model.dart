import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:split_free/app/app_routes.dart';

import '../app/app.dart';

/*
SplashViewModel Class for Splash Screen
Singleton Class
 */
class SplashViewModel {

  /*
  Singleton instance create
   */
  static late SplashViewModel _instance;
  factory SplashViewModel(BuildContext context) {
    _instance = SplashViewModel._internal(context);
    return _instance;
  }
  SplashViewModel._internal(BuildContext context) {
    _init(context);
  }
  /*
  Init method
   */
  void _init(BuildContext context){

    /*
    Set System chrome to set Preferred screen orientation is portrait Up
   */
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);


    Timer(const Duration(seconds: 3), (){
      App().setNavigation(context, AppRoutes.APP_WELCOME);
    });
  }

}