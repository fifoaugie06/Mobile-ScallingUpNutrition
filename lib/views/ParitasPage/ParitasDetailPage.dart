import 'package:flutter/material.dart';
import 'package:scallingupnutrition/model/Paritas.dart';
import 'package:scallingupnutrition/theme/PaletteColor.dart';
import 'package:scallingupnutrition/theme/SpacingDimens.dart';
import 'package:scallingupnutrition/theme/TypographyStyle.dart';
import 'package:intl/intl.dart';

class ParitasDetailPage extends StatelessWidget {
  final Datum data;

  ParitasDetailPage({@required this.data});

  @override
  Widget build(BuildContext context) {
    String formattedDate = DateFormat('dd MMMM yyyy').format(data.tanggallahir);

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
          'Detail Paritas',
          style: TypographyStyle.subtitle1.merge(
            TextStyle(
              color: PaletteColor.primarybg,
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(
            SpacingDimens.spacing24,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              content("Hamil Ke-", data.hamilke),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  content("Tanggal Lahir", formattedDate),
                  content("UK (mg)",
                      data.umurkehamilan.toString() + " Minggu"),
                  content("Jenis Persalinan", data.jenispersalinan),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  content("Komplikasi", data.komplikasi),
                  content("Jenis Kelamin", data.jeniskelamin),
                  content("BB Lahir", data.bb.toString()),
                ],
              ),
              content("Penolong", data.penolong),
              content("Laktasi", data.nifasLaktasi),
              content("Komplikasi", data.komplikasi),
            ],
          ),
        ),
      ),
    );
  }

  Widget content(String title, String value) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
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
        SizedBox(
          height: SpacingDimens.spacing24,
        ),
      ],
    );
  }
}
