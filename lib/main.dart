import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:scallingupnutrition/providers/LoginProvider.dart';
import 'package:scallingupnutrition/views/SplashScreenPage/SplashScreenPage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => LoginProvider(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          body: SplashScreenPage(),
        ),
      ),
    );
  }
}
