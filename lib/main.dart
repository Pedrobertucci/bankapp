import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:nubankapp/pages/home/widges/splash/splash_page.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle(
        statusBarBrightness: Brightness.dark,
        statusBarColor: Colors.transparent,
        systemNavigationBarColor: Colors.purple[800]),
  );

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Nubank Design',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.purple,
          brightness: Brightness.dark,
        ),
        home: SplashPage());
  }
}
