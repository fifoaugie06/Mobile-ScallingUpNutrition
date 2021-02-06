import 'package:flutter/material.dart';
import 'package:scallingupnutrition/route/RouteTransisition.dart';
import 'package:scallingupnutrition/theme/PaletteColor.dart';
import 'package:scallingupnutrition/theme/SpacingDimens.dart';
import 'package:scallingupnutrition/theme/TypographyStyle.dart';
import 'package:scallingupnutrition/views/EducationPage/EducationPage.dart';
import 'package:scallingupnutrition/views/LoginPage/LoginPage.dart';
import 'package:scallingupnutrition/views/MyProfilePage/MyProfilePage.dart';
import 'package:shared_preferences/shared_preferences.dart';

class NavDrawer extends StatelessWidget {
  final BuildContext ctx;
  final int idUser;

  NavDrawer({@required this.ctx, @required this.idUser});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          GestureDetector(
            onTap: () {
              Navigator.of(context).push(
                routeTransition(
                  MyProfilePage(
                    idUser: idUser,
                  ),
                ),
              );
            },
            child: Container(
              height: 200,
              child: Stack(
                children: <Widget>[
                  Container(
                    decoration: new BoxDecoration(
                      image: DecorationImage(
                          image: new AssetImage('assets/images/akunsaya.png'),
                          fit: BoxFit.cover),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(16),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'AKUN SAYA',
                          style: TypographyStyle.heading1.merge(
                            TextStyle(
                              color: PaletteColor.primarybg,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                            right: SpacingDimens.spacing24,
                          ),
                          child: Text(
                            'Kelola Akun Scalling Up Nutrition pribadi milik anda',
                            style: TypographyStyle.subtitle2.merge(
                              TextStyle(
                                color: PaletteColor.primarybg,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.of(context).push(
                routeTransition(
                  EducationPage(),
                ),
              );
            },
            child: Container(
              height: 200,
              child: Stack(
                children: <Widget>[
                  Container(
                    decoration: new BoxDecoration(
                      image: DecorationImage(
                          image: new AssetImage('assets/images/edukasi.png'),
                          fit: BoxFit.cover),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(16),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'EDUKASI',
                          style: TypographyStyle.heading1.merge(
                            TextStyle(
                              color: PaletteColor.primarybg,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                            right: SpacingDimens.spacing24,
                          ),
                          child: Text(
                            'Dapatkan update terbaru mengenai Informasi Edukasi Kesehatan',
                            style: TypographyStyle.subtitle2.merge(
                              TextStyle(
                                color: PaletteColor.primarybg,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          GestureDetector(
            onTap: () {},
            child: Container(
              height: 200,
              child: Stack(
                children: <Widget>[
                  Container(
                    decoration: new BoxDecoration(
                      image: DecorationImage(
                          image:
                              new AssetImage('assets/images/cekkehamilan.png'),
                          fit: BoxFit.cover),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(16),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'CEK KEHAMILAN',
                          style: TypographyStyle.heading1.merge(
                            TextStyle(
                              color: PaletteColor.primarybg,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                            right: SpacingDimens.spacing24,
                          ),
                          child: Text(
                            'Catat dan dokumentasikan sekarang juga kehamilan anda',
                            style: TypographyStyle.subtitle2.merge(
                              TextStyle(
                                color: PaletteColor.primarybg,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          GestureDetector(
            onTap: () {},
            child: Container(
              height: 200,
              child: Stack(
                children: <Widget>[
                  Container(
                    decoration: new BoxDecoration(
                      image: DecorationImage(
                          image: new AssetImage('assets/images/cekbayi.png'),
                          fit: BoxFit.cover),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(16),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'CEK BAYI',
                          style: TypographyStyle.heading1.merge(
                            TextStyle(
                              color: PaletteColor.primarybg,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                            right: SpacingDimens.spacing24,
                          ),
                          child: Text(
                            'Catat dan dokumentasikan sekarang juga anak - anak anda',
                            style: TypographyStyle.subtitle2.merge(
                              TextStyle(
                                color: PaletteColor.primarybg,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Container(
            color: PaletteColor.red,
            child: ListTile(
              title: Center(
                child: Text(
                  'LOGOUT',
                  style: TypographyStyle.subtitle2.merge(
                    TextStyle(
                      color: PaletteColor.primarybg,
                    ),
                  ),
                ),
              ),
              onTap: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: new Text("Confirmation"),
                      content:
                          new Text("Are you sure you want to logout now ?"),
                      actions: <Widget>[
                        new FlatButton(
                          child: new Text(
                            "CANCEL",
                            style: TextStyle(color: Color(0xFFFF4C58)),
                          ),
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                        ),
                        new FlatButton(
                          child: new Text("YES"),
                          onPressed: () {
                            Navigator.of(context).pop();
                            logOut();
                          },
                        ),
                      ],
                    );
                  },
                );
              },
            ),
          ),
//          SizedBox(
//            height: 100,
//          ),
//          Text(
//            'Copyright \u00a9 2020\n Prodita - Smart Nursing',
//            style: TextStyle(
//                color: Color(0xFF707070), letterSpacing: 1.5, height: 1.5),
//            textAlign: TextAlign.center,
//          ),
//          SizedBox(
//            height: 16,
//          ),
        ],
      ),
    );
  }

  void logOut() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.clear();
    Navigator.of(ctx).pushReplacement(
      routeTransition(
        LoginPage(),
      ),
    );
  }
}
