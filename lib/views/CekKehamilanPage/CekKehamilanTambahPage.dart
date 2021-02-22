import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:scallingupnutrition/providers/PregnancyProvider.dart';
import 'package:scallingupnutrition/route/RouteTransisition.dart';
import 'package:scallingupnutrition/theme/PaletteColor.dart';
import 'package:scallingupnutrition/theme/SpacingDimens.dart';
import 'package:scallingupnutrition/theme/TypographyStyle.dart';
import 'package:scallingupnutrition/views/CekKehamilanPage/CekKehamilanPage.dart';
import 'package:toast/toast.dart';

class CekKehamilanTambahPage extends StatefulWidget {
  final int idUser;
  final BuildContext ctx;

  CekKehamilanTambahPage({@required this.idUser, @required this.ctx});

  @override
  _CekKehamilanTambahPageState createState() =>
      _CekKehamilanTambahPageState(ctx: ctx, idUser: idUser);
}

class _CekKehamilanTambahPageState extends State<CekKehamilanTambahPage> {
  final int idUser;
  final BuildContext ctx;

  _CekKehamilanTambahPageState({@required this.idUser, @required this.ctx});

  final _namaController = new TextEditingController();
  final _keluhanController = new TextEditingController();
  final _usiaController = new TextEditingController();
  final _beratController = new TextEditingController();
  final _tdController = new TextEditingController();
  final _lilaController = new TextEditingController();
  final _fundusController = new TextEditingController();
  final _janinController = new TextEditingController();
  final _darahController = new TextEditingController();
  final _labController = new TextEditingController();
  int _radioValue1 = -1;
  int _radioValue2 = -1;
  int _radioValue3 = -1;
  int _radioValue4 = -1;
  int _radioValue5 = -1;
  int _radioValue6 = -1;
  int _radioValue7 = -1;
  int _radioValue8 = -1;

  void _handleRadioValueChange1(int value) {
    setState(() {
      _radioValue1 = value;
    });
  }

  void _handleRadioValueChange2(int value) {
    setState(() {
      _radioValue2 = value;
    });
  }

  void _handleRadioValueChange3(int value) {
    setState(() {
      _radioValue3 = value;
    });
  }

  void _handleRadioValueChange4(int value) {
    setState(() {
      _radioValue4 = value;
    });
  }

  void _handleRadioValueChange5(int value) {
    setState(() {
      _radioValue5 = value;
    });
  }

  void _handleRadioValueChange6(int value) {
    setState(() {
      _radioValue6 = value;
    });
  }

  void _handleRadioValueChange7(int value) {
    setState(() {
      _radioValue7 = value;
    });
  }

  void _handleRadioValueChange8(int value) {
    setState(() {
      _radioValue8 = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: PaletteColor.primarybg,
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
          'Tambah Cek Kehamilan',
          style: TypographyStyle.subtitle1.merge(
            TextStyle(
              color: PaletteColor.primarybg,
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(
          SpacingDimens.spacing24,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            contentForms("Nama", "Masukkan Nama", _namaController, false),
            SizedBox(
              height: SpacingDimens.spacing16,
            ),
            contentForms(
                "Keluhan", "Masukkan Keluhan", _keluhanController, false),
            SizedBox(
              height: SpacingDimens.spacing16,
            ),
            Row(
              children: [
                Expanded(
                  child:
                      contentForms("U.K (mg)", "Usia", _usiaController, true),
                ),
                SizedBox(
                  width: SpacingDimens.spacing8,
                ),
                Expanded(
                  child: contentForms(
                      "Berat Badan (kg)", "Berat", _beratController, true),
                ),
                SizedBox(
                  width: SpacingDimens.spacing8,
                ),
                Expanded(
                  child: contentForms("TD (mmhg)", "TD", _tdController, false),
                ),
              ],
            ),
            SizedBox(
              height: SpacingDimens.spacing16,
            ),
            Row(
              children: [
                Expanded(
                  child:
                      contentForms("Lila (cm)", "Lila", _lilaController, true),
                ),
                SizedBox(
                  width: SpacingDimens.spacing8,
                ),
                Expanded(
                  child: contentForms(
                      "Tinggi Fundus", "Fundus", _fundusController, true),
                ),
                SizedBox(
                  width: SpacingDimens.spacing8,
                ),
                Expanded(
                  child: contentForms(
                      "Letak Janin", "Janin", _janinController, true),
                ),
              ],
            ),
            SizedBox(
              height: SpacingDimens.spacing16,
            ),
            SizedBox(
              height: SpacingDimens.spacing16,
            ),
            contentForms("Tablet Tambah Darah", "Masukkan Tablet Tambah Darah",
                _darahController, false),
            SizedBox(
              height: SpacingDimens.spacing16,
            ),
            contentForms(
                "Laboratorium", "Masukkan Laboratorium", _labController, false),
            SizedBox(
              height: SpacingDimens.spacing16,
            ),
            SizedBox(
              height: SpacingDimens.spacing16,
            ),
            SizedBox(
              height: SpacingDimens.spacing16,
            ),
            contentQuestion(
              'Apakah Ibu sudah pernah memeriksa kehamilan ke Bidan atau Puskesmas?',
            ),
            contentQuestion2(
              'Apakah Ibu sudah melakukan pemeriksaan darah laboratorium?',
            ),
            contentQuestion3(
              'Apakah Ibu sudah mengkonsumsi Tablet tambah darah dan asam folat?',
            ),
            contentQuestion4(
              'Apakah Ibu ada mengkonsumsi makanan bergizi?',
            ),
            contentQuestion5(
              'Apakah Ibu merokok atau terpapar asap rokok?',
            ),
            contentQuestion6(
              'Apakah Ibu sudah pernah mengikuti kelas ibu hamil di wilayah tempat tinggal?',
            ),
            contentQuestion7(
              'Apakah Ibu sudah memiliki JKN/BPJS?',
            ),
            contentQuestion8(
              'Rencana tempat Melahirkan?',
            ),
            SizedBox(
              height: SpacingDimens.spacing32,
            ),
            FlatButton(
              minWidth: double.infinity,
              height: 45,
              color: PaletteColor.primary,
              onPressed: () {
                if (_namaController.text == "" ||
                    _keluhanController.text == "" ||
                    _usiaController.text == "" ||
                    _beratController.text == "" ||
                    _tdController.text == "" ||
                    _lilaController.text == "" ||
                    _fundusController.text == "" ||
                    _janinController.text == "" ||
                    _darahController.text == "" ||
                    _labController.text == "") {
                  Toast.show("Pastikan telah terisi semuanya", context,
                      duration: Toast.LENGTH_SHORT, gravity: Toast.BOTTOM);
                } else {
                  createPregnancy(context);
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
          ],
        ),
      ),
    );
  }

  Widget contentForms(
    String title,
    String hint,
    TextEditingController controller,
    bool isNumeric,
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
          keyboardType: isNumeric ? TextInputType.number : TextInputType.text,
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

  void createPregnancy(BuildContext context) {
    Provider.of<PregnancyProvider>(context, listen: false)
        .createPregnancy(
      id: idUser,
      pemeriksa: _namaController.text,
      keluhan: _keluhanController.text,
      usiakehamilan: _usiaController.text,
      beratbadan: _beratController.text,
      tekanan: _tdController.text,
      lila: _lilaController.text,
      fundus: _fundusController.text,
      janin: _janinController.text,
      tablet: _darahController.text,
      lab: _labController.text,
    )
        .then((value) {
      if (value == 200) {
        Navigator.of(context).pop();
        Navigator.of(ctx).pushReplacement(
          routeTransition(
            CekKehamilanPage(
              idUser: idUser,
            ),
          ),
        );
      }
    });
  }

  contentQuestion(String question) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          question,
          style: TypographyStyle.paragraph,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Radio(
              value: 0,
              groupValue: _radioValue1,
              onChanged: _handleRadioValueChange1,
            ),
            Text(
              'Sudah',
              style: TypographyStyle.subtitle2.merge(
                TextStyle(
                  color: PaletteColor.grey60,
                ),
              ),
            ),
            Radio(
              value: 1,
              groupValue: _radioValue1,
              onChanged: _handleRadioValueChange1,
            ),
            Text(
              'Belum',
              style: TypographyStyle.subtitle2.merge(
                TextStyle(
                  color: PaletteColor.grey60,
                ),
              ),
            ),
          ],
        ),
        SizedBox(
          height: SpacingDimens.spacing16,
        ),
      ],
    );
  }
  contentQuestion2(String question) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          question,
          style: TypographyStyle.paragraph,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Radio(
              value: 0,
              groupValue: _radioValue2,
              onChanged: _handleRadioValueChange2,
            ),
            Text(
              'Sudah',
              style: TypographyStyle.subtitle2.merge(
                TextStyle(
                  color: PaletteColor.grey60,
                ),
              ),
            ),
            Radio(
              value: 1,
              groupValue: _radioValue2,
              onChanged: _handleRadioValueChange2,
            ),
            Text(
              'Belum',
              style: TypographyStyle.subtitle2.merge(
                TextStyle(
                  color: PaletteColor.grey60,
                ),
              ),
            ),
          ],
        ),
        SizedBox(
          height: SpacingDimens.spacing16,
        ),
      ],
    );
  }
  contentQuestion3(String question) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          question,
          style: TypographyStyle.paragraph,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Radio(
              value: 0,
              groupValue: _radioValue3,
              onChanged: _handleRadioValueChange3,
            ),
            Text(
              'Sudah',
              style: TypographyStyle.subtitle2.merge(
                TextStyle(
                  color: PaletteColor.grey60,
                ),
              ),
            ),
            Radio(
              value: 1,
              groupValue: _radioValue3,
              onChanged: _handleRadioValueChange3,
            ),
            Text(
              'Belum',
              style: TypographyStyle.subtitle2.merge(
                TextStyle(
                  color: PaletteColor.grey60,
                ),
              ),
            ),
          ],
        ),
        SizedBox(
          height: SpacingDimens.spacing16,
        ),
      ],
    );
  }
  contentQuestion4(String question) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          question,
          style: TypographyStyle.paragraph,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Radio(
              value: 0,
              groupValue: _radioValue4,
              onChanged: _handleRadioValueChange4,
            ),
            Text(
              'Sudah',
              style: TypographyStyle.subtitle2.merge(
                TextStyle(
                  color: PaletteColor.grey60,
                ),
              ),
            ),
            Radio(
              value: 1,
              groupValue: _radioValue4,
              onChanged: _handleRadioValueChange4,
            ),
            Text(
              'Belum',
              style: TypographyStyle.subtitle2.merge(
                TextStyle(
                  color: PaletteColor.grey60,
                ),
              ),
            ),
          ],
        ),
        SizedBox(
          height: SpacingDimens.spacing16,
        ),
      ],
    );
  }
  contentQuestion5(String question) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          question,
          style: TypographyStyle.paragraph,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Radio(
              value: 0,
              groupValue: _radioValue5,
              onChanged: _handleRadioValueChange5,
            ),
            Text(
              'Sudah',
              style: TypographyStyle.subtitle2.merge(
                TextStyle(
                  color: PaletteColor.grey60,
                ),
              ),
            ),
            Radio(
              value: 1,
              groupValue: _radioValue5,
              onChanged: _handleRadioValueChange5,
            ),
            Text(
              'Belum',
              style: TypographyStyle.subtitle2.merge(
                TextStyle(
                  color: PaletteColor.grey60,
                ),
              ),
            ),
          ],
        ),
        SizedBox(
          height: SpacingDimens.spacing16,
        ),
      ],
    );
  }
  contentQuestion6(String question) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          question,
          style: TypographyStyle.paragraph,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Radio(
              value: 0,
              groupValue: _radioValue6,
              onChanged: _handleRadioValueChange6,
            ),
            Text(
              'Sudah',
              style: TypographyStyle.subtitle2.merge(
                TextStyle(
                  color: PaletteColor.grey60,
                ),
              ),
            ),
            Radio(
              value: 1,
              groupValue: _radioValue6,
              onChanged: _handleRadioValueChange6,
            ),
            Text(
              'Belum',
              style: TypographyStyle.subtitle2.merge(
                TextStyle(
                  color: PaletteColor.grey60,
                ),
              ),
            ),
          ],
        ),
        SizedBox(
          height: SpacingDimens.spacing16,
        ),
      ],
    );
  }
  contentQuestion7(String question) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          question,
          style: TypographyStyle.paragraph,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Radio(
              value: 0,
              groupValue: _radioValue7,
              onChanged: _handleRadioValueChange7,
            ),
            Text(
              'Sudah',
              style: TypographyStyle.subtitle2.merge(
                TextStyle(
                  color: PaletteColor.grey60,
                ),
              ),
            ),
            Radio(
              value: 1,
              groupValue: _radioValue7,
              onChanged: _handleRadioValueChange7,
            ),
            Text(
              'Belum',
              style: TypographyStyle.subtitle2.merge(
                TextStyle(
                  color: PaletteColor.grey60,
                ),
              ),
            ),
          ],
        ),
        SizedBox(
          height: SpacingDimens.spacing16,
        ),
      ],
    );
  }
  contentQuestion8(String question) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          question,
          style: TypographyStyle.paragraph,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Radio(
              value: 0,
              groupValue: _radioValue8,
              onChanged: _handleRadioValueChange8,
            ),
            Text(
              'RS',
              style: TypographyStyle.subtitle2.merge(
                TextStyle(
                  color: PaletteColor.grey60,
                ),
              ),
            ),
            Radio(
              value: 1,
              groupValue: _radioValue8,
              onChanged: _handleRadioValueChange8,
            ),
            Text(
              'Bidan',
              style: TypographyStyle.subtitle2.merge(
                TextStyle(
                  color: PaletteColor.grey60,
                ),
              ),
            ),
            Radio(
              value: 2,
              groupValue: _radioValue8,
              onChanged: _handleRadioValueChange8,
            ),
            Text(
              'Puskesmas',
              style: TypographyStyle.subtitle2.merge(
                TextStyle(
                  color: PaletteColor.grey60,
                ),
              ),
            ),
          ],
        ),
        SizedBox(
          height: SpacingDimens.spacing16,
        ),
      ],
    );
  }
}
