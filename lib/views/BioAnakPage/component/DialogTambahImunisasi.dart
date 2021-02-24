import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:scallingupnutrition/model/Children.dart';
import 'package:scallingupnutrition/providers/ChildrenProvider.dart';
import 'package:scallingupnutrition/providers/ImmunizationProvider.dart';
import 'package:scallingupnutrition/route/RouteTransisition.dart';
import 'package:scallingupnutrition/theme/PaletteColor.dart';
import 'package:scallingupnutrition/theme/SpacingDimens.dart';
import 'package:scallingupnutrition/theme/TypographyStyle.dart';
import 'package:scallingupnutrition/views/BioAnakPage/BioAnakDetailPage.dart';
import 'package:scallingupnutrition/views/BioAnakPage/BioAnakPage.dart';
import 'package:toast/toast.dart';

class DialogTambahImunisasi extends StatefulWidget {
  final BuildContext ctx;
  final int idUser;
  final int idImunisasi;
  final Datum datum;

  DialogTambahImunisasi(
      {@required this.ctx, @required this.idUser, @required this.idImunisasi, @required this.datum});

  @override
  _DialogTambahImunisasiState createState() => _DialogTambahImunisasiState(
      ctx: ctx, idUser: idUser, idImunisasi: idImunisasi);
}

class _DialogTambahImunisasiState extends State<DialogTambahImunisasi> {
  final _tanggalController = new TextEditingController();

  final BuildContext ctx;
  final int idUser;
  final int idImunisasi;

  _DialogTambahImunisasiState(
      {@required this.ctx, @required this.idUser, @required this.idImunisasi});

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
                    "Masukkan Tanggal Imunisasi",
                    style: TypographyStyle.mini.merge(
                      TextStyle(
                        color: PaletteColor.grey60,
                      ),
                    ),
                  ),
                  TextFormField(
                    controller: _tanggalController,
                    cursorColor: PaletteColor.primary,
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.only(
                        left: SpacingDimens.spacing16,
                        top: SpacingDimens.spacing8,
                        bottom: SpacingDimens.spacing8,
                      ),
                      hintText: "ex : 03 Oktober 2020",
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
                  SizedBox(
                    height: SpacingDimens.spacing12,
                  ),
                  FlatButton(
                    minWidth: double.infinity,
                    color: PaletteColor.primary,
                    onPressed: () {
                      if (_tanggalController.text == "") {
                        Toast.show("Pastikan telah terisi semuanya", ctx,
                            duration: Toast.LENGTH_SHORT,
                            gravity: Toast.BOTTOM);
                      } else {
                        Navigator.of(context).pop();
                        createImmunization();
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

  void createImmunization() {
    final postState = Provider.of<ImmunizationProvider>(ctx, listen: false);

    postState
        .createImmunization(
            user_id: idUser,
            immunization_schedule_id: idImunisasi,
            tanggal: _tanggalController.text)
        .then((value) {
      if (value == 200) {
        Navigator.of(ctx).pushReplacement(
          routeTransition(
            BioAnakDetailPage(
              idUser: idUser,
              data: widget.datum,
            ),
          ),
        );
      }
    });
  }
}
