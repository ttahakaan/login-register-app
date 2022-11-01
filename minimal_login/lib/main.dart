import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:minimal_login/auth/main_page.dart';
import 'package:minimal_login/product/theme_data.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  // WidgetsFlutterBinding().ensureFrameCallbacksRegistered();
  WidgetsFlutterBinding.ensureInitialized();
  await ThemeColorData().createSharedPefObject();
  await Firebase.initializeApp();
  runApp(ChangeNotifierProvider<ThemeColorData>(
      create: (BuildContext context) => ThemeColorData(),
      child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    Provider.of<ThemeColorData>(context, listen: false)
        .loadThemeFromSharedPref();
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: Provider.of<ThemeColorData>(context, listen: true).themeColor,
      home: const MainPage(),
    );
  }
}
