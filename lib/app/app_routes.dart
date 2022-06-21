import 'package:flutter/material.dart';
import 'package:split_free/views/auth/login_screen.dart';
import 'package:split_free/views/auth/signup_screen.dart';
import 'package:split_free/views/auth/user_info_screen.dart';
import 'package:split_free/views/groups/group_detail_screen.dart';
import 'package:split_free/views/welcome_screen.dart';

/*
This class contains all routes inside the app.
 */
class AppRoutes {

  //Authentication pages
  static const String APP_SPLASH = '/splash';
  static const String APP_WELCOME = '/welcome';
  static const String APP_SIGN_IN = '/sign_in';
  static const String APP_SIGN_UP = '/sign_up';
  static const String APP_PASWORD = '/password';
  static const String APP_OTP = '/otp';
  static const String APP_FORGET_PASSWORD = '/forget_password';
  static const String APP_RESET_PASSWORD = '/reset_password';
  static const String APP_USER_INFO = '/user_info';
  static const String APP_BUSINESS_INFO = '/business_info';
  static const String APP_AUTH_SUCCESS = '/auth_success';
  static const String APP_AUTH_FAILURE = '/auth_failure';

  //Home pages
  static const String APP_HOME = '/home';

  //Group Pages
  static const String APP_GROUPS = '/groups';
  static const String APP_GROUP_ADD = '/group_add';
  static const String APP_GROUP_DETAILS = '/group_details';
  static const String APP_GROUP_EDIT = '/group_edit';
  static const String APP_GROUP_HISTORY = '/group_history';

  /*
  Get routes of the app
   */
  Route getRoutes(RouteSettings routeSettings) {
    switch(routeSettings.name) {
      case APP_GROUP_DETAILS:
        {
          return MaterialPageRoute(
              settings: routeSettings,
              builder: (BuildContext context) => const GroupDetailScreen(),
              fullscreenDialog: true
          );
        }
      case APP_SIGN_IN:
        {
          return MaterialPageRoute(
              settings: routeSettings,
              builder: (BuildContext context) => const LoginScreen(),
              fullscreenDialog: true
          );
        }
      case APP_USER_INFO:
        {
          return MaterialPageRoute(
              settings: routeSettings,
              builder: (BuildContext context) => const UserInfo(),
              fullscreenDialog: true
          );
        }
      case APP_SIGN_UP:
        {
          return MaterialPageRoute(
              settings: routeSettings,
              builder: (BuildContext context) => const SignupScreen(),
              fullscreenDialog: true
          );
        }
      case APP_WELCOME:
        {
          return MaterialPageRoute(
              settings: routeSettings,
              builder: (BuildContext context) => const WelcomeScreen(),
              fullscreenDialog: true
          );
        }
      default:
        {
          return MaterialPageRoute(
              settings: routeSettings,
              builder: (BuildContext context) => Container(),
              fullscreenDialog: true
          );
        }
    }
  }

  /*
  Get widget that the route is return.
   */
  getWidget(BuildContext context, String appRouteName) {
    switch(appRouteName) {
      case APP_GROUP_DETAILS:
        {
          return const GroupDetailScreen();
        }
      case APP_USER_INFO:
        {
          return const UserInfo();
        }
      case APP_SIGN_IN:
        {
          return const LoginScreen();
        }
      case APP_SIGN_UP:
        {
          return const SignupScreen();
        }
      case APP_WELCOME:
        {
          return const WelcomeScreen();
        }
      default:
        {
          return Container();
        }
    }
  }

}