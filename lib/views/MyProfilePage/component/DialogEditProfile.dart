import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:scallingupnutrition/providers/UserProvider.dart';
import 'package:scallingupnutrition/route/RouteTransisition.dart';
import 'package:scallingupnutrition/theme/PaletteColor.dart';
import 'package:scallingupnutrition/theme/SpacingDimens.dart';
import 'package:scallingupnutrition/theme/TypographyStyle.dart';
import 'package:scallingupnutrition/views/DashboardPage/DashboardPage.dart';

class DialogEditProfile extends StatelessWidget {
  final int idUser;
  final BuildContext ctx;

  DialogEditProfile({@required this.idUser, @required this.ctx});

  final _namaController = new TextEditingController();
  final _tinggiController = new TextEditingController();
  final _beratController = new TextEditingController();
  final _ttlController = new TextEditingController();
  final _alamatController = new TextEditingController();
  final _pekerjaanController = new TextEditingController();
  final _pendidikanController = new TextEditingController();
  final _agamaController = new TextEditingController();
  final _sukuController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Consumer<UserProvider>(
      builder: (context, dataUser, _) {
        var data = dataUser.responseUser.data;

        _namaController.text = data.fullname;
        _tinggiController.text = data.tb == null ? "" : data.tb.toString();
        _beratController.text = data.bb == null ? "" : data.bb.toString();
        _ttlController.text = data.ttl;
        _alamatController.text = data.address;
        _pekerjaanController.text = data.pekerjaan;
        _pendidikanController.text = data.pendidikan;
        _agamaController.text = data.agama;
        _sukuController.text = data.suku;

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
                        "Nama Lengkap",
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
                          hintText: "Masukkan Nama Lengkap",
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
                            width: SpacingDimens.spacing8,
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
                      Row(
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Pekerjaan",
                                  style: TypographyStyle.mini.merge(
                                    TextStyle(
                                      color: PaletteColor.grey60,
                                    ),
                                  ),
                                ),
                                TextFormField(
                                  controller: _pekerjaanController,
                                  cursorColor: PaletteColor.primary,
                                  decoration: InputDecoration(
                                    contentPadding: EdgeInsets.only(
                                      left: SpacingDimens.spacing16,
                                      top: SpacingDimens.spacing8,
                                      bottom: SpacingDimens.spacing8,
                                    ),
                                    hintText: "Pekerjaan",
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
                            width: SpacingDimens.spacing8,
                          ),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Pendidikan",
                                  style: TypographyStyle.mini.merge(
                                    TextStyle(
                                      color: PaletteColor.grey60,
                                    ),
                                  ),
                                ),
                                TextFormField(
                                  controller: _pendidikanController,
                                  cursorColor: PaletteColor.primary,
                                  decoration: InputDecoration(
                                    contentPadding: EdgeInsets.only(
                                      left: SpacingDimens.spacing16,
                                      top: SpacingDimens.spacing8,
                                      bottom: SpacingDimens.spacing8,
                                    ),
                                    hintText: "Pendidikan",
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
                      Row(
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Agama",
                                  style: TypographyStyle.mini.merge(
                                    TextStyle(
                                      color: PaletteColor.grey60,
                                    ),
                                  ),
                                ),
                                TextFormField(
                                  controller: _agamaController,
                                  cursorColor: PaletteColor.primary,
                                  decoration: InputDecoration(
                                    contentPadding: EdgeInsets.only(
                                      left: SpacingDimens.spacing16,
                                      top: SpacingDimens.spacing8,
                                      bottom: SpacingDimens.spacing8,
                                    ),
                                    hintText: "Agama",
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
                            width: SpacingDimens.spacing8,
                          ),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Suku",
                                  style: TypographyStyle.mini.merge(
                                    TextStyle(
                                      color: PaletteColor.grey60,
                                    ),
                                  ),
                                ),
                                TextFormField(
                                  controller: _sukuController,
                                  cursorColor: PaletteColor.primary,
                                  decoration: InputDecoration(
                                    contentPadding: EdgeInsets.only(
                                      left: SpacingDimens.spacing16,
                                      top: SpacingDimens.spacing8,
                                      bottom: SpacingDimens.spacing8,
                                    ),
                                    hintText: "Suku",
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
                          hintText: "Masukkan TTL",
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
                        "Alamat Lengkap",
                        style: TypographyStyle.mini.merge(
                          TextStyle(
                            color: PaletteColor.grey60,
                          ),
                        ),
                      ),
                      TextFormField(
                        controller: _alamatController,
                        cursorColor: PaletteColor.primary,
                        keyboardType: TextInputType.multiline,
                        minLines: 3,
                        maxLines: 5,
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.only(
                            left: SpacingDimens.spacing16,
                            top: SpacingDimens.spacing8,
                            bottom: SpacingDimens.spacing8,
                          ),
                          hintText: "Masukkan Alamat Lengkap",
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
                        height: SpacingDimens.spacing16,
                      ),
                      FlatButton(
                        minWidth: double.infinity,
                        color: PaletteColor.primary,
                        onPressed: () {
                          editProfile();
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
      },
    );
  }

  void editProfile() {
    final updateUser = Provider.of<UserProvider>(ctx, listen: false);

    updateUser
        .updateUser(
            idUser,
            _namaController.text,
            _tinggiController.text,
            _beratController.text,
            _ttlController.text,
            _alamatController.text,
            _pekerjaanController.text,
            _pendidikanController.text,
            _agamaController.text,
            _sukuController.text)
        .then((value) {
      if (value == 200) {
        Navigator.of(ctx).pushReplacement(
          routeTransition(
            DashboardPage(
              idUser: idUser,
            ),
          ),
        );
      }
    });
  }
}
