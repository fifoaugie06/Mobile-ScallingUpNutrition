import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:scallingupnutrition/component/Dialog/DialogFailed.dart';
import 'package:scallingupnutrition/component/Indicator/IndicatorLoad.dart';
import 'package:scallingupnutrition/config/GlobalKeySharedPref.dart';
import 'package:scallingupnutrition/providers/LoginProvider.dart';
import 'package:scallingupnutrition/route/RouteTransisition.dart';
import 'package:scallingupnutrition/theme/PaletteColor.dart';
import 'package:scallingupnutrition/theme/SpacingDimens.dart';
import 'package:scallingupnutrition/theme/TypographyStyle.dart';
import 'package:scallingupnutrition/views/DashboardPage/DashboardPage.dart';
import 'package:scallingupnutrition/views/SignUpPage/SignUpPage.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'component/MainForms.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _usernameFilter = new TextEditingController();
  final TextEditingController _passwordFilter = new TextEditingController();
  bool _load = false;

  @override
  Widget build(BuildContext context) {
    Widget loadingIndicator = _load
        ? Container(
            color: Colors.black26,
            width: double.infinity,
            height: double.infinity,
            child: indicatorLoad(),
          )
        : Container();

    return Scaffold(
      backgroundColor: PaletteColor.primarybg,
      body: Stack(
        children: [
          SafeArea(
            child: Center(
              child: SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.all(SpacingDimens.spacing24),
                  child: Column(
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
                      MainForms(
                        usernameFilter: _usernameFilter,
                        passwordFilter: _passwordFilter,
                      ),
                      Container(
                        padding: EdgeInsets.only(
                          top: SpacingDimens.spacing16,
                        ),
                        child: GestureDetector(
                          onTap: () {
                            Navigator.of(context).pushReplacement(
                              routeTransition(
                                SignUpPage(),
                              ),
                            );
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Text(
                                "Don't have an account ? ",
                                style: TypographyStyle.caption2.merge(
                                  TextStyle(
                                    color: PaletteColor.text,
                                  ),
                                ),
                              ),
                              Text(
                                "Sign Up",
                                style: TypographyStyle.caption2.merge(
                                  TextStyle(
                                    color: PaletteColor.primary,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(
                          top: SpacingDimens.spacing64,
                        ),
                        child: SizedBox(
                          width: MediaQuery.of(context).size.width,
                          child: FlatButton(
                            color: PaletteColor.primary,
                            splashColor: PaletteColor.primary80,
                            height: 48,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(3.0),
                              side: BorderSide(
                                color: PaletteColor.red,
                              ),
                            ),
                            onPressed: () {
                              onPressedFunction();
                            },
                            child: Text(
                              "Login",
                              style: TypographyStyle.button1.merge(
                                TextStyle(
                                  color: PaletteColor.primarybg,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          new Align(
            child: loadingIndicator,
            alignment: FractionalOffset.center,
          ),
        ],
      ),
    );
  }

  addPrefToSF(String username, String userid) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool(GlobalKeySharedPref.keyPrefIsLogin, true);
    prefs.setString(GlobalKeySharedPref.keyPrefUsername, username);
    prefs.setString(GlobalKeySharedPref.keyPrefUserId, userid);
  }

  void onPressedFunction() {
    setState(() {
      _load = true;
    });

    final authState = Provider.of<LoginProvider>(context, listen: false);

    authState.auth(_usernameFilter.text, _passwordFilter.text).then((value) {
      if (value == 200) {
        addPrefToSF(
            _usernameFilter.text, authState.responseLogin.data.id.toString());
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(
            builder: (context) => DashboardPage(
              idUser: authState.responseLogin.data.id,
            ),
          ),
        );
      } else if (value == 400) {
        showDialog(
          context: context,
          builder: (context) {
            return DialogFailed(
              content: "Username or Password is Wrong",
            );
          },
        );
      }

      setState(() {
        _load = false;
      });
    });
  }
}
