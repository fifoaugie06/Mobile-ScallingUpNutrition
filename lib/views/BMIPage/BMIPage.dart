import 'package:flutter/material.dart';
import 'package:scallingupnutrition/theme/PaletteColor.dart';
import 'package:scallingupnutrition/theme/SpacingDimens.dart';
import 'package:scallingupnutrition/theme/TypographyStyle.dart';
import 'package:toast/toast.dart';

class BMIPage extends StatefulWidget {
  @override
  _BMIPageState createState() => _BMIPageState();
}

class _BMIPageState extends State<BMIPage> {
  var _beratController = new TextEditingController();
  var _tinggiController = new TextEditingController();
  double _result;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: PaletteColor.primary,
        leading: IconButton(
          onPressed: () => Navigator.of(context).pop(),
          icon: Icon(
            Icons.arrow_back,
            color: PaletteColor.primarybg,
          ),
        ),
        title: Text(
          'BMI',
          style: TypographyStyle.subtitle1.merge(
            TextStyle(
              color: PaletteColor.primarybg,
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(SpacingDimens.spacing24),
          child: Column(
            children: [
              contentForms('Berat Badan', '55 kg', _beratController),
              SizedBox(
                height: SpacingDimens.spacing24,
              ),
              contentForms('Tinggi Badan', '1.7 m', _tinggiController),
              SizedBox(
                height: SpacingDimens.spacing48,
              ),
              FlatButton(
                minWidth: double.infinity,
                height: 45,
                color: PaletteColor.primary,
                onPressed: () {
                  if (_beratController.text == "" ||
                      _tinggiController.text == "") {
                    Toast.show("Pastikan telah terisi semuanya", context,
                        duration: Toast.LENGTH_SHORT, gravity: Toast.BOTTOM);
                  } else {
                    setState(() {
                      _result = double.parse(_beratController.text) /
                          (double.parse(_tinggiController.text) *
                              double.parse(_tinggiController.text));
                    });
                  }
                },
                child: Text(
                  'Submit',
                  style: TypographyStyle.button2.merge(
                    TextStyle(
                      color: PaletteColor.primarybg,
                    ),
                  ),
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                height: 45,
                padding: EdgeInsets.symmetric(
                  horizontal: SpacingDimens.spacing16,
                ),
                margin: EdgeInsets.symmetric(
                  vertical: SpacingDimens.spacing12,
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4.0),
                  color: PaletteColor.grey40,
                ),
                child: Center(
                  child: Text(
                    classification(_result),
                    style: TypographyStyle.subtitle2.merge(
                      TextStyle(
                        color: PaletteColor.text,
                      ),
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget contentForms(
    String title,
    String hint,
    TextEditingController controller,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TypographyStyle.mini.merge(
            TextStyle(
              color: PaletteColor.grey60,
            ),
          ),
        ),
        TextFormField(
          controller: controller,
          cursorColor: PaletteColor.primary,
          keyboardType: TextInputType.number,
          decoration: InputDecoration(
            contentPadding: EdgeInsets.only(
              left: SpacingDimens.spacing16,
              top: SpacingDimens.spacing8,
              bottom: SpacingDimens.spacing8,
            ),
            hintText: hint,
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
      ],
    );
  }

  String classification(double result) {
    if(_result != null){
      if (_result < 18.5) {
        return "Berat Badan Kurang";
      } else if (_result >= 18.5 && _result < 23) {
        return "Berat Badan Normal";
      } else if (_result >= 23 && _result < 30) {
        return "Berat Badan Lebih (Cenderung Obesitas)";
      } else {
        return "Obesitas";
      }
    }else{
      return "";
    }
  }
}
