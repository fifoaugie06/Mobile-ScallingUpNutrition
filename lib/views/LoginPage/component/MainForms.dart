import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:scallingupnutrition/theme/PaletteColor.dart';
import 'package:scallingupnutrition/theme/SpacingDimens.dart';
import 'package:scallingupnutrition/theme/TypographyStyle.dart';

class MainForms extends StatefulWidget {
  final TextEditingController usernameFilter;
  final TextEditingController passwordFilter;

  MainForms({@required this.usernameFilter, @required this.passwordFilter});

  @override
  _MainFormsState createState() => _MainFormsState();
}

class _MainFormsState extends State<MainForms> {
  bool _isHidePassword = true;

  void _togglePasswordVisibility() {
    setState(() {
      _isHidePassword = !_isHidePassword;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        top: SpacingDimens.spacing52,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            alignment: Alignment.bottomLeft,
            child: Text(
              "Username",
              style: TypographyStyle.mini.merge(
                TextStyle(
                  color: PaletteColor.grey60,
                ),
              ),
            ),
          ),
          TextFormField(
            controller: widget.usernameFilter,
            cursorColor: PaletteColor.primary,
            decoration: InputDecoration(
              contentPadding: EdgeInsets.only(
                left: SpacingDimens.spacing16,
                top: SpacingDimens.spacing8,
                bottom: SpacingDimens.spacing8,
              ),
              hintText: "Enter Username",
              hintStyle: TypographyStyle.paragraph.merge(
                TextStyle(
                  color: PaletteColor.grey60,
                ),
              ),
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(
                  color: PaletteColor.primary,
                ),
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: SpacingDimens.spacing36),
            alignment: Alignment.bottomLeft,
            child: Text(
              "Password",
              style: TypographyStyle.mini.merge(
                TextStyle(
                  color: PaletteColor.grey60,
                ),
              ),
            ),
          ),
          TextFormField(
            obscureText: _isHidePassword,
            controller: widget.passwordFilter,
            cursorColor: PaletteColor.primary,
            keyboardType: TextInputType.visiblePassword,
            style: TypographyStyle.button1,
            decoration: InputDecoration(
              contentPadding: EdgeInsets.only(
                left: SpacingDimens.spacing16,
                top: SpacingDimens.spacing12,
                bottom: SpacingDimens.spacing8,
              ),
              hintText: "Enter Password",
              hintStyle: TypographyStyle.paragraph.merge(
                TextStyle(
                  color: PaletteColor.grey60,
                ),
              ),
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(
                  color: PaletteColor.primary,
                ),
              ),
              suffixIcon: GestureDetector(
                onTap: _togglePasswordVisibility,
                child: Icon(
                  _isHidePassword ? Icons.visibility_off : Icons.visibility,
                  color: _isHidePassword
                      ? PaletteColor.grey60
                      : PaletteColor.primary,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
