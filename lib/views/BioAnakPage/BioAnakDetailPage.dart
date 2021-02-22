import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:scallingupnutrition/component/Indicator/IndicatorLoad.dart';
import 'package:scallingupnutrition/model/Children.dart';
import 'package:scallingupnutrition/providers/ChildrenProvider.dart';
import 'package:scallingupnutrition/providers/ImmunizationProvider.dart';
import 'package:scallingupnutrition/theme/PaletteColor.dart';
import 'package:scallingupnutrition/theme/SpacingDimens.dart';
import 'package:scallingupnutrition/theme/TypographyStyle.dart';
import 'package:scallingupnutrition/views/BioAnakPage/component/BioAnakTile.dart';
import 'package:scallingupnutrition/views/BioAnakPage/component/DialogTambahAnak.dart';
import 'package:scallingupnutrition/views/BioAnakPage/component/ImmunizationTile.dart';

class BioAnakDetailPage extends StatelessWidget {
  final Datum data;

  BioAnakDetailPage({@required this.data});

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
          'Detail Biodata',
          style: TypographyStyle.subtitle1.merge(
            TextStyle(
              color: PaletteColor.primarybg,
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(
            SpacingDimens.spacing16,
          ),
          child: FutureBuilder(
            future: Future.wait([
              Provider.of<ImmunizationProvider>(context, listen: false)
                  .getImmunization()
            ]),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return indicatorLoad();
              }
              return Consumer<ImmunizationProvider>(
                builder: (context, dataImmunization, _) {
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      contentBio("Nama Anak", data.nama),
                      contentBio("Tempat Tanggal Lahir", data.ttl),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          contentBio("Tinggi Badan", data.tb.toString()),
                          contentBio("Berat Badan", data.bb.toString()),
                          contentBio("Anak Ke-", data.anakke.toString()),
                        ],
                      ),
                      Row(
                        children: [
                          contentBio("Usia", data.umur.toString() + " Bulan"),
                          SizedBox(
                            width: SpacingDimens.spacing36,
                          ),
                          contentBio("Jenis Kelamin", data.jeniskelamin),
                        ],
                      ),
                      contentBio(
                          "Stunting",
                          calculateStunting(data.umur, data.jeniskelamin,
                              double.parse(data.bb))),
                      SizedBox(
                        height: SpacingDimens.spacing12,
                      ),
                      Text(
                        "Jadwal Imunisasi Anak",
                        style: TypographyStyle.subtitle1.merge(
                          TextStyle(
                            color: PaletteColor.primary,
                            fontSize: 16,
                          ),
                        ),
                      ),
                      ListView.builder(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemCount:
                            dataImmunization.responseImmunization.data.length,
                        itemBuilder: (context, index) {
                          return Container(
                            margin: EdgeInsets.only(
                              top: SpacingDimens.spacing12,
                            ),
                            child: ImmunizationTile(
                              title: "xx",
                              description: "yy",
                            ),
                          );
                        },
                      ),
                    ],
                  );
                },
              );
            },
          ),
        ),
      ),
    );
  }

  Widget contentBio(String title, String value) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TypographyStyle.subtitle2.merge(
            TextStyle(
              color: PaletteColor.primary,
              fontSize: 12,
            ),
          ),
        ),
        SizedBox(
          height: SpacingDimens.spacing8,
        ),
        Text(
          value,
          style: TypographyStyle.subtitle1.merge(
            TextStyle(
              color: PaletteColor.grey60,
              fontSize: 14,
            ),
          ),
        ),
        SizedBox(
          height: SpacingDimens.spacing16,
        ),
      ],
    );
  }

  String calculateStunting(int umur, String jeniskelamin, double berat) {
    double zScore;
    if (jeniskelamin == 'pria') {
      if (umur == 0) {
        zScore = (berat - 3.3) / (3.3 - 2.9);
        return classificationStunting(zScore);
      } else if (umur == 1) {
        zScore = (berat - 4.5) / (4.5 - 3.9);
        return classificationStunting(zScore);
      } else if (umur == 2) {
        zScore = (berat - 5.6) / (5.6 - 4.9);
        return classificationStunting(zScore);
      } else if (umur == 3) {
        zScore = (berat - 6.4) / (6.4 - 5.7);
        return classificationStunting(zScore);
      } else if (umur == 4) {
        zScore = (berat - 7.0) / (7.0 - 6.2);
        return classificationStunting(zScore);
      } else if (umur == 5) {
        zScore = (berat - 7.5) / (7.5 - 6.7);
        return classificationStunting(zScore);
      } else if (umur == 6) {
        zScore = (berat - 7.9) / (7.9 - 7.1);
        return classificationStunting(zScore);
      } else if (umur == 7) {
        zScore = (berat - 8.3) / (8.3 - 7.4);
        return classificationStunting(zScore);
      } else if (umur == 8) {
        zScore = (berat - 8.6) / (8.6 - 7.7);
        return classificationStunting(zScore);
      } else if (umur == 9) {
        zScore = (berat - 8.9) / (8.9 - 8.0);
        return classificationStunting(zScore);
      } else if (umur == 10) {
        zScore = (berat - 9.2) / (9.2 - 8.2);
        return classificationStunting(zScore);
      } else if (umur == 11) {
        zScore = (berat - 9.4) / (9.4 - 8.4);
        return classificationStunting(zScore);
      } else if (umur == 12) {
        zScore = (berat - 9.6) / (9.6 - 8.6);
        return classificationStunting(zScore);
      } else if (umur == 13) {
        zScore = (berat - 9.9) / (9.9 - 8.8);
        return classificationStunting(zScore);
      } else if (umur == 14) {
        zScore = (berat - 10.1) / (10.1 - 9.0);
        return classificationStunting(zScore);
      } else if (umur == 15) {
        zScore = (berat - 10.3) / (10.3 - 9.2);
        return classificationStunting(zScore);
      } else if (umur == 16) {
        zScore = (berat - 10.5) / (10.5 - 9.4);
        return classificationStunting(zScore);
      } else if (umur == 17) {
        zScore = (berat - 10.7) / (10.7 - 9.6);
        return classificationStunting(zScore);
      } else if (umur == 18) {
        zScore = (berat - 10.9) / (10.9 - 9.8);
        return classificationStunting(zScore);
      } else if (umur == 19) {
        zScore = (berat - 11.1) / (11.1 - 10.0);
        return classificationStunting(zScore);
      } else if (umur == 20) {
        zScore = (berat - 11.3) / (11.3 - 10.1);
        return classificationStunting(zScore);
      } else if (umur == 21) {
        zScore = (berat - 11.5) / (11.5 - 10.3);
        return classificationStunting(zScore);
      } else if (umur == 22) {
        zScore = (berat - 11.8) / (11.8 - 10.5);
        return classificationStunting(zScore);
      } else if (umur == 23) {
        zScore = (berat - 12.0) / (12.0 - 10.7);
        return classificationStunting(zScore);
      } else if (umur == 24) {
        zScore = (berat - 12.2) / (12.2 - 10.8);
        return classificationStunting(zScore);
      } else if (umur == 25) {
        zScore = (berat - 12.4) / (12.4 - 11.0);
        return classificationStunting(zScore);
      } else if (umur == 26) {
        zScore = (berat - 12.5) / (12.5 - 11.2);
        return classificationStunting(zScore);
      } else if (umur == 27) {
        zScore = (berat - 12.7) / (12.7 - 11.3);
        return classificationStunting(zScore);
      } else if (umur == 28) {
        zScore = (berat - 12.9) / (12.9 - 11.5);
        return classificationStunting(zScore);
      } else if (umur == 29) {
        zScore = (berat - 13.1) / (13.1 - 11.7);
        return classificationStunting(zScore);
      } else if (umur == 30) {
        zScore = (berat - 13.3) / (13.3 - 11.8);
        return classificationStunting(zScore);
      } else if (umur == 31) {
        zScore = (berat - 13.5) / (13.5 - 12.0);
        return classificationStunting(zScore);
      } else if (umur == 32) {
        zScore = (berat - 13.7) / (13.7 - 12.1);
        return classificationStunting(zScore);
      } else if (umur == 33) {
        zScore = (berat - 13.8) / (13.8 - 12.3);
        return classificationStunting(zScore);
      } else if (umur == 34) {
        zScore = (berat - 14.0) / (14.0 - 12.4);
        return classificationStunting(zScore);
      } else if (umur == 35) {
        zScore = (berat - 14.2) / (14.2 - 12.6);
        return classificationStunting(zScore);
      } else if (umur == 36) {
        zScore = (berat - 14.3) / (14.3 - 12.7);
        return classificationStunting(zScore);
      } else if (umur == 37) {
        zScore = (berat - 14.5) / (14.5 - 12.9);
        return classificationStunting(zScore);
      } else if (umur == 38) {
        zScore = (berat - 14.7) / (14.7 - 13.0);
        return classificationStunting(zScore);
      } else if (umur == 39) {
        zScore = (berat - 14.8) / (14.8 - 13.1);
        return classificationStunting(zScore);
      } else if (umur == 40) {
        zScore = (berat - 15.0) / (15.0 - 13.3);
        return classificationStunting(zScore);
      } else if (umur == 41) {
        zScore = (berat - 15.2) / (15.2 - 13.4);
        return classificationStunting(zScore);
      } else if (umur == 42) {
        zScore = (berat - 15.3) / (15.3 - 13.6);
        return classificationStunting(zScore);
      } else if (umur == 43) {
        zScore = (berat - 15.5) / (15.5 - 13.7);
        return classificationStunting(zScore);
      } else if (umur == 44) {
        zScore = (berat - 15.7) / (15.7 - 13.8);
        return classificationStunting(zScore);
      } else if (umur == 45) {
        zScore = (berat - 15.8) / (15.8 - 14.0);
        return classificationStunting(zScore);
      } else if (umur == 46) {
        zScore = (berat - 16.0) / (16.0 - 14.1);
        return classificationStunting(zScore);
      } else if (umur == 47) {
        zScore = (berat - 16.2) / (16.2 - 14.3);
        return classificationStunting(zScore);
      } else if (umur == 48) {
        zScore = (berat - 16.3) / (16.3 - 14.4);
        return classificationStunting(zScore);
      } else if (umur == 49) {
        zScore = (berat - 16.5) / (16.5 - 14.5);
        return classificationStunting(zScore);
      } else if (umur == 50) {
        zScore = (berat - 16.7) / (16.7 - 14.7);
        return classificationStunting(zScore);
      } else if (umur == 51) {
        zScore = (berat - 16.8) / (16.8 - 14.8);
        return classificationStunting(zScore);
      } else if (umur == 52) {
        zScore = (berat - 17.0) / (17.0 - 15.0);
        return classificationStunting(zScore);
      } else if (umur == 53) {
        zScore = (berat - 17.2) / (17.2 - 15.1);
        return classificationStunting(zScore);
      } else if (umur == 54) {
        zScore = (berat - 17.3) / (17.3 - 15.2);
        return classificationStunting(zScore);
      } else if (umur == 55) {
        zScore = (berat - 17.5) / (17.5 - 15.4);
        return classificationStunting(zScore);
      } else if (umur == 56) {
        zScore = (berat - 17.7) / (17.7 - 15.5);
        return classificationStunting(zScore);
      } else if (umur == 57) {
        zScore = (berat - 17.8) / (17.8 - 15.6);
        return classificationStunting(zScore);
      } else if (umur == 58) {
        zScore = (berat - 18.0) / (18.0 - 15.8);
        return classificationStunting(zScore);
      } else if (umur == 59) {
        zScore = (berat - 18.2) / (18.2 - 15.9);
        return classificationStunting(zScore);
      } else {
        zScore = (berat - 18.3) / (18.3 - 16.0);
        return classificationStunting(zScore);
      }
    } else {
      if (umur == 0) {
        zScore = (berat - 3.2) / (3.2 - 2.8);
        return classificationStunting(zScore);
      } else if (umur == 1) {
        zScore = (berat - 4.2) / (4.2 - 3.6);
        return classificationStunting(zScore);
      } else if (umur == 2) {
        zScore = (berat - 5.1) / (5.1 - 4.5);
        return classificationStunting(zScore);
      } else if (umur == 3) {
        zScore = (berat - 5.8) / (5.8 - 5.2);
        return classificationStunting(zScore);
      } else if (umur == 4) {
        zScore = (berat - 6.4) / (6.4 - 5.7);
        return classificationStunting(zScore);
      } else if (umur == 5) {
        zScore = (berat - 6.9) / (6.9 - 6.1);
        return classificationStunting(zScore);
      } else if (umur == 6) {
        zScore = (berat - 7.3) / (7.3 - 6.5);
        return classificationStunting(zScore);
      } else if (umur == 7) {
        zScore = (berat - 7.6) / (7.6 - 6.8);
        return classificationStunting(zScore);
      } else if (umur == 8) {
        zScore = (berat - 7.9) / (7.9 - 7.0);
        return classificationStunting(zScore);
      } else if (umur == 9) {
        zScore = (berat - 8.2) / (8.2 - 7.3);
        return classificationStunting(zScore);
      } else if (umur == 10) {
        zScore = (berat - 8.5) / (8.5 - 7.5);
        return classificationStunting(zScore);
      } else if (umur == 11) {
        zScore = (berat - 8.7) / (8.7 - 7.7);
        return classificationStunting(zScore);
      } else if (umur == 12) {
        zScore = (berat - 8.9) / (8.9 - 7.9);
        return classificationStunting(zScore);
      } else if (umur == 13) {
        zScore = (berat - 9.2) / (9.2 - 8.1);
        return classificationStunting(zScore);
      } else if (umur == 14) {
        zScore = (berat - 9.4) / (9.4 - 8.3);
        return classificationStunting(zScore);
      } else if (umur == 15) {
        zScore = (berat - 9.6) / (9.6 - 8.5);
        return classificationStunting(zScore);
      } else if (umur == 16) {
        zScore = (berat - 9.8) / (9.8 - 8.7);
        return classificationStunting(zScore);
      } else if (umur == 17) {
        zScore = (berat - 10.0) / (10.0 - 8.9);
        return classificationStunting(zScore);
      } else if (umur == 18) {
        zScore = (berat - 10.2) / (10.2 - 9.1);
        return classificationStunting(zScore);
      } else if (umur == 19) {
        zScore = (berat - 10.4) / (10.4 - 9.2);
        return classificationStunting(zScore);
      } else if (umur == 20) {
        zScore = (berat - 10.6) / (10.6 - 9.4);
        return classificationStunting(zScore);
      } else if (umur == 21) {
        zScore = (berat - 10.9) / (10.9 - 9.6);
        return classificationStunting(zScore);
      } else if (umur == 22) {
        zScore = (berat - 11.1) / (11.1 - 9.8);
        return classificationStunting(zScore);
      } else if (umur == 23) {
        zScore = (berat - 11.3) / (11.3 - 10.0);
        return classificationStunting(zScore);
      } else if (umur == 24) {
        zScore = (berat - 11.5) / (11.5 - 10.2);
        return classificationStunting(zScore);
      } else if (umur == 25) {
        zScore = (berat - 11.7) / (11.7 - 10.3);
        return classificationStunting(zScore);
      } else if (umur == 26) {
        zScore = (berat - 11.9) / (11.9 - 10.5);
        return classificationStunting(zScore);
      } else if (umur == 27) {
        zScore = (berat - 12.1) / (12.1 - 10.7);
        return classificationStunting(zScore);
      } else if (umur == 28) {
        zScore = (berat - 12.3) / (12.3 - 10.9);
        return classificationStunting(zScore);
      } else if (umur == 29) {
        zScore = (berat - 12.5) / (12.5 - 11.1);
        return classificationStunting(zScore);
      } else if (umur == 30) {
        zScore = (berat - 12.7) / (12.7 - 11.2);
        return classificationStunting(zScore);
      } else if (umur == 31) {
        zScore = (berat - 12.9) / (12.9 - 11.4);
        return classificationStunting(zScore);
      } else if (umur == 32) {
        zScore = (berat - 13.1) / (13.1 - 11.6);
        return classificationStunting(zScore);
      } else if (umur == 33) {
        zScore = (berat - 13.3) / (13.3 - 11.7);
        return classificationStunting(zScore);
      } else if (umur == 34) {
        zScore = (berat - 13.5) / (13.5 - 11.9);
        return classificationStunting(zScore);
      } else if (umur == 35) {
        zScore = (berat - 13.7) / (13.7 - 12.0);
        return classificationStunting(zScore);
      } else if (umur == 36) {
        zScore = (berat - 13.9) / (13.9 - 12.2);
        return classificationStunting(zScore);
      } else if (umur == 37) {
        zScore = (berat - 14.0) / (14.0 - 12.4);
        return classificationStunting(zScore);
      } else if (umur == 38) {
        zScore = (berat - 14.2) / (14.2 - 12.5);
        return classificationStunting(zScore);
      } else if (umur == 39) {
        zScore = (berat - 14.4) / (14.4 - 12.7);
        return classificationStunting(zScore);
      } else if (umur == 40) {
        zScore = (berat - 14.6) / (14.6 - 12.8);
        return classificationStunting(zScore);
      } else if (umur == 41) {
        zScore = (berat - 14.8) / (14.8 - 13.0);
        return classificationStunting(zScore);
      } else if (umur == 42) {
        zScore = (berat - 15.0) / (15.0 - 13.1);
        return classificationStunting(zScore);
      } else if (umur == 43) {
        zScore = (berat - 15.2) / (15.2 - 13.3);
        return classificationStunting(zScore);
      } else if (umur == 44) {
        zScore = (berat - 15.3) / (15.3 - 13.4);
        return classificationStunting(zScore);
      } else if (umur == 45) {
        zScore = (berat - 15.5) / (15.5 - 13.6);
        return classificationStunting(zScore);
      } else if (umur == 46) {
        zScore = (berat - 15.7) / (15.7 - 13.7);
        return classificationStunting(zScore);
      } else if (umur == 47) {
        zScore = (berat - 15.9) / (15.9 - 13.9);
        return classificationStunting(zScore);
      } else if (umur == 48) {
        zScore = (berat - 16.1) / (16.1 - 14.0);
        return classificationStunting(zScore);
      } else if (umur == 49) {
        zScore = (berat - 16.3) / (16.3 - 14.2);
        return classificationStunting(zScore);
      } else if (umur == 50) {
        zScore = (berat - 16.4) / (16.4 - 14.3);
        return classificationStunting(zScore);
      } else if (umur == 51) {
        zScore = (berat - 16.6) / (16.6 - 14.5);
        return classificationStunting(zScore);
      } else if (umur == 52) {
        zScore = (berat - 16.8) / (16.8 - 14.6);
        return classificationStunting(zScore);
      } else if (umur == 53) {
        zScore = (berat - 17.0) / (17.0 - 14.8);
        return classificationStunting(zScore);
      } else if (umur == 54) {
        zScore = (berat - 17.2) / (17.2 - 14.9);
        return classificationStunting(zScore);
      } else if (umur == 55) {
        zScore = (berat - 17.3) / (17.3 - 15.1);
        return classificationStunting(zScore);
      } else if (umur == 56) {
        zScore = (berat - 17.5) / (17.5 - 15.2);
        return classificationStunting(zScore);
      } else if (umur == 57) {
        zScore = (berat - 17.7) / (17.7 - 15.3);
        return classificationStunting(zScore);
      } else if (umur == 58) {
        zScore = (berat - 17.9) / (17.9 - 15.5);
        return classificationStunting(zScore);
      } else if (umur == 59) {
        zScore = (berat - 18.0) / (18.0 - 15.6);
        return classificationStunting(zScore);
      } else {
        zScore = (berat - 18.2) / (18.2 - 15.8);
        return classificationStunting(zScore);
      }
    }
  }

  String classificationStunting(double zScore) {
    print(zScore.toString());
    if (zScore < -3) {
      return "Gizi Buruk";
    } else if (zScore >= -3 && zScore < -2) {
      return "Gizi Kurang";
    } else if (zScore >= -2 && zScore < 2) {
      return "Gizi Baik";
    } else {
      return "Gizi Lebih";
    }
  }
}
