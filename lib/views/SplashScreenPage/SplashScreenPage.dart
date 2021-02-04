import 'dart:async';

import 'package:flutter/material.dart';
import 'package:scallingupnutrition/component/Indicator/IndicatorLoad.dart';
import 'package:scallingupnutrition/config/GlobalKeySharedPref.dart';
import 'package:scallingupnutrition/theme/PaletteColor.dart';
import 'package:scallingupnutrition/theme/SpacingDimens.dart';
import 'package:scallingupnutrition/theme/TypographyStyle.dart';
import 'package:scallingupnutrition/views/DashboardPage/DashboardPage.dart';
import 'package:scallingupnutrition/views/LoginPage/LoginPage.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreenPage extends StatefulWidget {
  @override
  _SplashScreenState createState() => new _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreenPage> {
  startTime() async {
    var _duration = new Duration(seconds: 3);
    return Timer(_duration, navigationPage);
  }

  navigationPage() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool isHasLogined =
        prefs.getBool(GlobalKeySharedPref.keyPrefIsLogin) ?? false;
    String username = prefs.getString(GlobalKeySharedPref.keyPrefUsername);
    String userid = prefs.getString(GlobalKeySharedPref.keyPrefUserId);
    print(username);
    print(userid);
    print(isHasLogined);

    if (isHasLogined) {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (context) => DashboardPage(
            idUser: int.parse(
              userid,
            ),
          ),
        ),
      );
    } else {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (context) => LoginPage(),
        ),
      );
    }

    return isHasLogined;
  }

  @override
  void initState() {
    super.initState();
    startTime();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: PaletteColor.primarybg,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Column(
            children: [
              Container(
                alignment: Alignment.center,
                child: Image.asset(
                  "assets/images/sunlogo.png",
                  height: 100,
                ),
              ),
              SizedBox(
                height: SpacingDimens.spacing8,
              ),
              Text(
                'SCALLING UP',
                style: TypographyStyle.subtitle2,
              ),
              Text(
                'NUTRITION',
                style: TypographyStyle.subtitle1.merge(
                  TextStyle(
                    color: PaletteColor.primary,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
          indicatorLoad(),
        ],
      ),
    );
  }
}
