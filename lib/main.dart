import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'app/app.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  await Firebase.initializeApp();
  /*
  Start App
   */
  runApp(
    EasyLocalization(
        supportedLocales: const [Locale('en'), Locale('ta')],
        path: 'assets/language',
        fallbackLocale: const Locale('en'),
        child:  App()
    ),
  );
}
