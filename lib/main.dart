import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:scallingupnutrition/providers/ChildrenProvider.dart';
import 'package:scallingupnutrition/providers/EducationCategoryProvider.dart';
import 'package:scallingupnutrition/providers/EducationProvider.dart';
import 'package:scallingupnutrition/providers/ImmunizationProvider.dart';
import 'package:scallingupnutrition/providers/LoginProvider.dart';
import 'package:scallingupnutrition/providers/PregnancyProvider.dart';
import 'package:scallingupnutrition/providers/RegisterProvider.dart';
import 'package:scallingupnutrition/providers/UserProvider.dart';
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
        ChangeNotifierProvider(
          create: (_) => RegisterProvider(),
        ),
        ChangeNotifierProvider(
          create: (_) => EducationProvider(),
        ),
        ChangeNotifierProvider(
          create: (_) => EducationCategoryProvider(),
        ),
        ChangeNotifierProvider(
          create: (_) => UserProvider(),
        ),
        ChangeNotifierProvider(
          create: (_) => ChildrenProvider(),
        ),
        ChangeNotifierProvider(
          create: (_) => ImmunizationProvider(),
        ),
        ChangeNotifierProvider(
          create: (_) => PregnancyProvider(),
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
