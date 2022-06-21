
/*
AuthViewModel Class for Auth related screens
Singleton Class
 */

import '../../../app/app.dart';

class HomeViewModel {

  /*
  Singleton instance create
   */
  static late HomeViewModel _instance;
  factory HomeViewModel(App app) {
    _instance = HomeViewModel._internal();
    return _instance;
  }
  HomeViewModel._internal() {
    _init();
  }

  /*
  current index of the tab in Home Screen
   */
  static int currentIndex = 0;

  /*
  Init method
   */
  void _init(){

  }

}