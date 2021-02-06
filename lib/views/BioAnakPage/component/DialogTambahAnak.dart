import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:scallingupnutrition/providers/ChildrenProvider.dart';
import 'package:scallingupnutrition/route/RouteTransisition.dart';
import 'package:scallingupnutrition/theme/PaletteColor.dart';
import 'package:scallingupnutrition/theme/SpacingDimens.dart';
import 'package:scallingupnutrition/theme/TypographyStyle.dart';
import 'package:scallingupnutrition/views/BioAnakPage/BioAnakPage.dart';

class DialogTambahAnak extends StatelessWidget {
  final _namaController = new TextEditingController();
  final _ttlController = new TextEditingController();
  final _tinggiController = new TextEditingController();
  final _beratController = new TextEditingController();
  final _anakkeController = new TextEditingController();

  final BuildContext ctx;
  final int idUser;

  DialogTambahAnak({@required this.ctx, @required this.idUser});

  @override
  Widget build(BuildContext context) {
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
                  FlatButton(
                    minWidth: double.infinity,
                    color: PaletteColor.primary,
                    onPressed: () {
                      createChildren();
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
        .createChildren(idUser, _namaController.text, _tinggiController.text,
            _beratController.text, _ttlController.text, _anakkeController.text)
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
