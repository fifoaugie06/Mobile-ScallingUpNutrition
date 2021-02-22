import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:scallingupnutrition/providers/ChildrenProvider.dart';
import 'package:scallingupnutrition/route/RouteTransisition.dart';
import 'package:scallingupnutrition/theme/PaletteColor.dart';
import 'package:scallingupnutrition/theme/SpacingDimens.dart';
import 'package:scallingupnutrition/theme/TypographyStyle.dart';
import 'package:scallingupnutrition/views/BioAnakPage/BioAnakPage.dart';
import 'package:toast/toast.dart';

class DialogTambahAnak extends StatefulWidget {
  final BuildContext ctx;
  final int idUser;

  DialogTambahAnak({@required this.ctx, @required this.idUser});

  @override
  _DialogTambahAnakState createState() =>
      _DialogTambahAnakState(ctx: ctx, idUser: idUser);
}

class _DialogTambahAnakState extends State<DialogTambahAnak> {
  final _namaController = new TextEditingController();
  final _ttlController = new TextEditingController();
  final _tinggiController = new TextEditingController();
  final _beratController = new TextEditingController();
  final _usiaController = new TextEditingController();
  final _anakkeController = new TextEditingController();
  String dropdownValue = 'pria';

  final BuildContext ctx;
  final int idUser;

  _DialogTambahAnakState({@required this.ctx, @required this.idUser});

  @override
  Widget build(BuildContext context) {
    bool _error = false;

    return AlertDialog(
      backgroundColor: PaletteColor.primarybg,
      contentPadding: EdgeInsets.all(0.0),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(
            SpacingDimens.spacing4,
          ),
        ),
      ),
      elevation: 5,
      content: Builder(
        builder: (context) {
          return SingleChildScrollView(
            child: Container(
              width: MediaQuery.of(context).size.width,
              padding: EdgeInsets.all(
                SpacingDimens.spacing12,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    "Nama",
                    style: TypographyStyle.mini.merge(
                      TextStyle(
                        color: PaletteColor.grey60,
                      ),
                    ),
                  ),
                  TextFormField(
                    controller: _namaController,
                    cursorColor: PaletteColor.primary,
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.only(
                        left: SpacingDimens.spacing16,
                        top: SpacingDimens.spacing8,
                        bottom: SpacingDimens.spacing8,
                      ),
                      hintText: "Masukkan Nama",
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
                  SizedBox(
                    height: SpacingDimens.spacing12,
                  ),
                  Text(
                    "Tempat Tanggal Lahir",
                    style: TypographyStyle.mini.merge(
                      TextStyle(
                        color: PaletteColor.grey60,
                      ),
                    ),
                  ),
                  TextFormField(
                    controller: _ttlController,
                    cursorColor: PaletteColor.primary,
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.only(
                        left: SpacingDimens.spacing16,
                        top: SpacingDimens.spacing8,
                        bottom: SpacingDimens.spacing8,
                      ),
                      hintText: "Tempat Tanggal Lahir",
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
                  SizedBox(
                    height: SpacingDimens.spacing12,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Tinggi Badan",
                              style: TypographyStyle.mini.merge(
                                TextStyle(
                                  color: PaletteColor.grey60,
                                ),
                              ),
                            ),
                            TextFormField(
                              controller: _tinggiController,
                              cursorColor: PaletteColor.primary,
                              keyboardType: TextInputType.number,
                              decoration: InputDecoration(
                                contentPadding: EdgeInsets.only(
                                  left: SpacingDimens.spacing16,
                                  top: SpacingDimens.spacing8,
                                  bottom: SpacingDimens.spacing8,
                                ),
                                hintText: "Tinggi Badan",
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
                        ),
                      ),
                      SizedBox(
                        width: SpacingDimens.spacing16,
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Berat Badan",
                              style: TypographyStyle.mini.merge(
                                TextStyle(
                                  color: PaletteColor.grey60,
                                ),
                              ),
                            ),
                            TextFormField(
                              controller: _beratController,
                              cursorColor: PaletteColor.primary,
                              keyboardType: TextInputType.number,
                              decoration: InputDecoration(
                                contentPadding: EdgeInsets.only(
                                  left: SpacingDimens.spacing16,
                                  top: SpacingDimens.spacing8,
                                  bottom: SpacingDimens.spacing8,
                                ),
                                hintText: "Berat Badan",
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
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: SpacingDimens.spacing12,
                  ),
                  Text(
                    "Jenis Kelamin",
                    style: TypographyStyle.mini.merge(
                      TextStyle(
                        color: PaletteColor.grey60,
                      ),
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    child: DropdownButton(
                      value: dropdownValue,
                      onChanged: (String newValue) {
                        setState(() {
                          dropdownValue = newValue;
                        });
                      },
                      items: <String>['pria', 'wanita']
                          .map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                    ),
                  ),
                  SizedBox(
                    height: SpacingDimens.spacing12,
                  ),
                  Text(
                    "Usia (Bulan)",
                    style: TypographyStyle.mini.merge(
                      TextStyle(
                        color: PaletteColor.grey60,
                      ),
                    ),
                  ),
                  TextFormField(
                    controller: _usiaController,
                    cursorColor: PaletteColor.primary,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.only(
                        left: SpacingDimens.spacing16,
                        top: SpacingDimens.spacing8,
                        bottom: SpacingDimens.spacing8,
                      ),
                      hintText: "Usia",
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
                  SizedBox(
                    height: SpacingDimens.spacing12,
                  ),
                  Text(
                    "Anak Ke-",
                    style: TypographyStyle.mini.merge(
                      TextStyle(
                        color: PaletteColor.grey60,
                      ),
                    ),
                  ),
                  TextFormField(
                    controller: _anakkeController,
                    cursorColor: PaletteColor.primary,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.only(
                        left: SpacingDimens.spacing16,
                        top: SpacingDimens.spacing8,
                        bottom: SpacingDimens.spacing8,
                      ),
                      hintText: "Anak Ke",
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
                  SizedBox(
                    height: SpacingDimens.spacing12,
                  ),
                  Visibility(
                    visible: _error,
                    child: Text(
                      "*Pastikan Semua telah Terisi",
                      style: TypographyStyle.mini.merge(
                        TextStyle(
                          color: PaletteColor.red,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: SpacingDimens.spacing8,
                  ),
                  FlatButton(
                    minWidth: double.infinity,
                    color: PaletteColor.primary,
                    onPressed: () {
                      print(_error.toString());
                      if (_namaController.text == "" ||
                          _tinggiController.text == "" ||
                          _beratController.text == "" ||
                          _ttlController.text == "" ||
                          _anakkeController.text == "" ||
                          _usiaController.text == "") {
                        Toast.show("Pastikan telah terisi semuanya", ctx,
                            duration: Toast.LENGTH_SHORT,
                            gravity: Toast.BOTTOM);
                      } else {
                        Navigator.of(context).pop();
                        createChildren();
                      }
                    },
                    child: Text(
                      'OK',
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
        },
      ),
    );
  }

  void createChildren() {
    final postState = Provider.of<ChildrenProvider>(ctx, listen: false);

    postState
        .createChildren(
            idUser,
            _namaController.text,
            _tinggiController.text,
            _beratController.text,
            _ttlController.text,
            _usiaController.text,
            dropdownValue,
            _anakkeController.text)
        .then((value) {
      if (value == 200) {
        Navigator.of(ctx).pushReplacement(
          routeTransition(
            BioAnakPage(
              idUser: idUser,
            ),
          ),
        );
      }
    });
  }
}
