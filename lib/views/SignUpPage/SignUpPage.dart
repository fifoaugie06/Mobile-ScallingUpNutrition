import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:scallingupnutrition/component/Dialog/DialogFailed.dart';
import 'package:scallingupnutrition/component/Dialog/DialogSuccess.dart';
import 'package:scallingupnutrition/component/Indicator/IndicatorLoad.dart';
import 'package:scallingupnutrition/config/GlobalKeySharedPref.dart';
import 'package:scallingupnutrition/providers/LoginProvider.dart';
import 'package:scallingupnutrition/providers/RegisterProvider.dart';
import 'package:scallingupnutrition/route/RouteTransisition.dart';
import 'package:scallingupnutrition/theme/PaletteColor.dart';
import 'package:scallingupnutrition/theme/SpacingDimens.dart';
import 'package:scallingupnutrition/theme/TypographyStyle.dart';
import 'package:scallingupnutrition/views/DashboardPage/DashboardPage.dart';
import 'package:scallingupnutrition/views/LoginPage/LoginPage.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'component/MainForms.dart';

class SignUpPage extends StatefulWidget {
  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final TextEditingController _usernameFilter = new TextEditingController();
  final TextEditingController _emailFilter = new TextEditingController();
  final TextEditingController _passwordFilter = new TextEditingController();
  final TextEditingController _confirmationPasswordFilter =
      new TextEditingController();
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
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'SIGN ',
                            style: TypographyStyle.heading1.merge(
                              TextStyle(
                                color: PaletteColor.primary,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          Text(
                            'UP',
                            style: TypographyStyle.heading1.merge(
                              TextStyle(
                                color: PaletteColor.grey,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),
                      MainForms(
                        usernameFilter: _usernameFilter,
                        emailFilter: _emailFilter,
                        passwordFilter: _passwordFilter,
                        confirmationPasswordFilter: _confirmationPasswordFilter,
                      ),
                      Container(
                        padding: EdgeInsets.only(
                          top: SpacingDimens.spacing16,
                        ),
                        child: GestureDetector(
                          onTap: () {
                            Navigator.of(context).pushReplacement(
                              routeTransition(
                                LoginPage(),
                              ),
                            );
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Text(
                                "Already have an account ? ",
                                style: TypographyStyle.caption2.merge(
                                  TextStyle(
                                    color: PaletteColor.text,
                                  ),
                                ),
                              ),
                              Text(
                                "Log In",
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
                              if (_passwordFilter.text ==
                                  _confirmationPasswordFilter.text) {
                                onPressedFunction(context);
                              }
                            },
                            child: Text(
                              "Sign Up",
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

  void onPressedFunction(BuildContext ctx) {
    setState(() {
      _load = true;
    });

    final registerState = Provider.of<RegisterProvider>(context, listen: false);

    registerState
        .register(_usernameFilter.text, _emailFilter.text, _passwordFilter.text)
        .then((value) {
      if (value == 200) {
        showDialog(
          context: context,
          builder: (context) {
            return DialogSuccess(
              ctx: ctx,
              content: registerState.responseRegister.message,
            );
          },
        );
      } else if (value == 400) {
        showDialog(
          context: context,
          builder: (context) {
            return DialogFailed(
              content: registerState.responseRegister.message,
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
