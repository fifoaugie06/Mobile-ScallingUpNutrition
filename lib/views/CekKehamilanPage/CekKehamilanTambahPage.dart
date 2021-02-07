import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:scallingupnutrition/providers/PregnancyProvider.dart';
import 'package:scallingupnutrition/route/RouteTransisition.dart';
import 'package:scallingupnutrition/theme/PaletteColor.dart';
import 'package:scallingupnutrition/theme/SpacingDimens.dart';
import 'package:scallingupnutrition/theme/TypographyStyle.dart';
import 'package:scallingupnutrition/views/CekKehamilanPage/CekKehamilanPage.dart';
import 'package:toast/toast.dart';

class CekKehamilanTambahPage extends StatelessWidget {
  final int idUser;
  final BuildContext ctx;

  CekKehamilanTambahPage({@required this.idUser, @required this.ctx});

  final _namaController = new TextEditingController();
  final _keluhanController = new TextEditingController();
  final _usiaController = new TextEditingController();
  final _beratController = new TextEditingController();
  final _tdController = new TextEditingController();
  final _lilaController = new TextEditingController();
  final _fundusController = new TextEditingController();
  final _janinController = new TextEditingController();
  final _imunisasiController = new TextEditingController();
  final _darahController = new TextEditingController();
  final _labController = new TextEditingController();
  final _analisaController = new TextEditingController();
  final _laksanaController = new TextEditingController();
  final _konselingController = new TextEditingController();

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
            contentForms("Imunisasi", "Masukkan Jenis Imunisasi",
                _imunisasiController, false),
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
            contentForms(
                "Analisa", "Masukkan Analisa", _analisaController, false),
            SizedBox(
              height: SpacingDimens.spacing16,
            ),
            contentForms("Tata Laksana", "Masukkan Tata Laksana",
                _laksanaController, false),
            SizedBox(
              height: SpacingDimens.spacing16,
            ),
            contentForms(
                "Konseling", "Masukkan Konseling", _konselingController, false),
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
                    _imunisasiController.text == "" ||
                    _darahController.text == "" ||
                    _labController.text == "" ||
                    _analisaController.text == "" ||
                    _laksanaController.text == "" ||
                    _konselingController.text == "") {
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
      imunisasi: _imunisasiController.text,
      tablet: _darahController.text,
      lab: _labController.text,
      analisa: _analisaController.text,
      tatalaksana: _laksanaController.text,
      konseling: _konselingController.text,
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
}
