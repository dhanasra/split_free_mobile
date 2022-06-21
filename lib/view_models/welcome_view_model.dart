import '../app/app.dart';

/*
WelcomeViewModel Class for Welcome Screen
Singleton Class
 */
class WelcomeViewModel {

  /*
  Singleton instance create
   */
  static late WelcomeViewModel _instance;
  factory WelcomeViewModel(App app) {
    _instance = WelcomeViewModel._internal();
    return _instance;
  }
  WelcomeViewModel._internal() {
    _init();
  }

  /*
  Carousal Container data
   */
  List<List<String>> carouselContainerData = [
    ["launch1.gif","launch_title_1","launch_desc_1"],
    ["launch2.gif","launch_title_2","launch_desc_2"],
    ["launch3.gif","launch_title_3","launch_desc_3"],
  ];

  /*
  Init method
   */
  void _init(){

  }


}