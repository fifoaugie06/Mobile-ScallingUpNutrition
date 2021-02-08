import 'package:flutter/material.dart';
import 'package:scallingupnutrition/model/Pregnancy.dart';
import 'package:scallingupnutrition/theme/PaletteColor.dart';
import 'package:scallingupnutrition/theme/SpacingDimens.dart';
import 'package:scallingupnutrition/theme/TypographyStyle.dart';
import 'package:intl/intl.dart';

class CekKehamilanDetailPage extends StatelessWidget {
  final Datum data;

  CekKehamilanDetailPage({@required this.data});

  @override
  Widget build(BuildContext context) {
    String formattedDate =
        DateFormat('dd MMMM yyyy').format(data.createdAt);

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
          'Detail Cek Kehamilan',
          style: TypographyStyle.subtitle1.merge(
            TextStyle(
              color: PaletteColor.primarybg,
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: SpacingDimens.spacing24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              contentKehamilan(
                  "Nama Pemeriksa atau Tempat Pelayanan", data.pemeriksa),
              contentKehamilan("Tanggal", formattedDate),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  contentKehamilan("U.K (mg)", data.usiakehamilan.toString() + " mg"),
                  contentKehamilan("Berat Badan (kg)", data.beratbadan.toString() + " kg"),
                  contentKehamilan("TD (mmhg)", data.tekanan),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  contentKehamilan("Lila (cm)", data.lila.toString() + " cm"),
                  contentKehamilan("Tinggi Fundus (cm)", data.fundus.toString() + " cm"),
                  contentKehamilan("Letak Janin, DJJ", data.janin.toString() + "x / mm"),
                ],
              ),
              contentKehamilan("Imunisasi", data.imunisasi),
              contentKehamilan("Tablet Tambah Darah", data.tablet),
              contentKehamilan("Laboratorium", data.lab),
              contentKehamilan("Analisa", data.analisa),
              contentKehamilan("Tata Laksana", data.tatalaksana),
              contentKehamilan("Konseling", data.konseling),
            ],
          ),
        ),
      ),
    );
  }

  Widget contentKehamilan(String title, String value) {
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
