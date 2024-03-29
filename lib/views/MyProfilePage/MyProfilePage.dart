import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:scallingupnutrition/component/Indicator/IndicatorLoad.dart';
import 'package:scallingupnutrition/providers/UserProvider.dart';
import 'package:scallingupnutrition/theme/PaletteColor.dart';
import 'package:scallingupnutrition/theme/SpacingDimens.dart';
import 'package:scallingupnutrition/theme/TypographyStyle.dart';
import 'package:scallingupnutrition/views/MyProfilePage/component/DialogEditProfile.dart';

class MyProfilePage extends StatelessWidget {
  final int idUser;

  MyProfilePage({@required this.idUser});

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
        actions: [
          IconButton(
            icon: Icon(
              Icons.edit,
              color: PaletteColor.primarybg,
              size: 20,
            ),
            onPressed: () {
              showDialog(
                context: context,
                builder: (context) {
                  return DialogEditProfile(
                    idUser: idUser,
                    ctx: context,
                  );
                },
              );
            },
          )
        ],
        title: Text(
          'Akun Saya',
          style: TypographyStyle.subtitle1.merge(
            TextStyle(
              color: PaletteColor.primarybg,
            ),
          ),
        ),
      ),
      body: RefreshIndicator(
        color: PaletteColor.primary,
        onRefresh: () =>
            Provider.of<UserProvider>(context, listen: false).getUser(idUser),
        child: FutureBuilder(
          future: Future.wait([
            Provider.of<UserProvider>(context, listen: false).getUser(idUser),
          ]),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return indicatorLoad();
            }
            return Consumer<UserProvider>(
              builder: (context, dataUser, _) {
                var user = dataUser.responseUser.data;
                return SingleChildScrollView(
                  physics: BouncingScrollPhysics(),
                  child: Container(
                    margin: EdgeInsets.symmetric(
                        horizontal: SpacingDimens.spacing24),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        contentProfile(
                          "Username",
                          user.username,
                        ),
                        contentProfile(
                          "Nama Lengkap",
                          user.fullname == null ? "-" : user.fullname,
                        ),
                        Row(
                          children: [
                            contentProfile(
                              "Tinggi Badan",
                              user.tb == null
                                  ? "-"
                                  : user.tb.toString() + " Cm",
                            ),
                            SizedBox(
                              width: SpacingDimens.spacing32,
                            ),
                            contentProfile(
                              "Berat Badan",
                              user.bb == null
                                  ? "-"
                                  : user.bb.toString() + " Kg",
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            contentProfile(
                              "Pekerjaan",
                              user.pekerjaan ?? '-',
                            ),
                            SizedBox(
                              width: SpacingDimens.spacing32,
                            ),
                            contentProfile(
                              "Pendidikan",
                              user.pendidikan ?? '-',
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            contentProfile(
                              "Agama",
                              user.agama ?? '-',
                            ),
                            SizedBox(
                              width: SpacingDimens.spacing32,
                            ),
                            contentProfile(
                              "Suku",
                              user.suku ?? '-',
                            ),
                          ],
                        ),
                        contentProfile(
                          "Tempat Tanggal Lahir",
                          user.ttl == null ? "-" : user.ttl.toString(),
                        ),
                        contentProfile(
                          "Alamat Email",
                          user.email,
                        ),
                        contentProfile(
                          "Alamat Lengkap",
                          user.address == null ? "-" : user.address,
                        ),
                      ],
                    ),
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }

  Widget contentProfile(String title, String value) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: SpacingDimens.spacing24,
        ),
        Text(
          title,
          style: TypographyStyle.subtitle2.merge(
            TextStyle(
              color: PaletteColor.primary,
            ),
          ),
        ),
        SizedBox(
          height: SpacingDimens.spacing12,
        ),
        Text(
          value,
          style: TypographyStyle.subtitle2.merge(
            TextStyle(
              color: PaletteColor.grey80,
            ),
          ),
        ),
      ],
    );
  }
}
