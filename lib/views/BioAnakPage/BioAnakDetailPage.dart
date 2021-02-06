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
}
