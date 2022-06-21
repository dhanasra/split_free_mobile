
/*
AuthViewModel Class for Auth related screens
Singleton Class
 */
import 'package:flutter/cupertino.dart';
import 'package:split_free/utils/enum_utils.dart';

import '../../../app/app.dart';

class AuthViewModel {
  /*
  Singleton instance create
   */
  static late AuthViewModel _instance;
  factory AuthViewModel(App app) {
    _instance = AuthViewModel._internal();
    return _instance;
  }
  AuthViewModel._internal() {
    _init();
  }

  /*
  Controllers & Fields for Auth Screens
   */
  late TextEditingController emailController;
  late TextEditingController passwordController;
  late TextEditingController phoneNumberController;
  late TextEditingController emailPhoneNumberController;
  late TextEditingController otpController;
  late TextEditingController newPasswordController;
  late TextEditingController confirmPasswordController;
  late TextEditingController fullNameController;
  late TextEditingController languageController;
  late List<Map<String,String>> supportedLocales;

  /*
  Init method
   */
  void _init(){
    emailController = TextEditingController(text: "");
    passwordController = TextEditingController(text: "");
    phoneNumberController = TextEditingController(text: "");
    emailPhoneNumberController = TextEditingController(text: "");
    otpController = TextEditingController(text: "");
    newPasswordController = TextEditingController(text: "");
    confirmPasswordController = TextEditingController(text: "");
    fullNameController = TextEditingController(text: "");
    languageController = TextEditingController(text: "");
    supportedLocales = [
      {
        "locale":"en",
        "label":"English",
        "converted_label":"English"
      },
      {
        "locale":"ta",
        "label":"Tamil",
        "converted_label":"தமிழ்"
      },
      {
        "locale":"ma",
        "label":"Malayalam",
        "converted_label":"മലയാളം"
      },
      {
        "locale":"te",
        "label":"Telugu",
        "converted_label":"తెలుగు"
      },
      {
        "locale":"ka",
        "label":"Kannada",
        "converted_label":"ಕನ್ನಡ"
      },
    ];
  }

  SUPPORTED_LOCALE getLocale(){
    switch(languageController.text){
      case "ta": return SUPPORTED_LOCALE.TA;
      case "en": return SUPPORTED_LOCALE.EN;
      case "ka": return SUPPORTED_LOCALE.KA;
      case "te": return SUPPORTED_LOCALE.TE;
      case "ma": return SUPPORTED_LOCALE.MA;
    }
    return SUPPORTED_LOCALE.EN;
  }

}