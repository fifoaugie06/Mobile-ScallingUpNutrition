import 'package:flutter/material.dart';
import 'package:scallingupnutrition/model/Paritas.dart';
import 'package:scallingupnutrition/theme/PaletteColor.dart';
import 'package:scallingupnutrition/theme/SpacingDimens.dart';
import 'package:scallingupnutrition/theme/TypographyStyle.dart';
import 'package:intl/intl.dart';

class ParitasTile extends StatelessWidget {
  Datum data;

  ParitasTile({@required this.data});

  @override
  Widget build(BuildContext context) {
    String formattedDate = DateFormat('dd MMMM yyyy').format(data.tanggallahir);

    return Container(
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    "Hamil ke-" + data.hamilke,
                    style: TypographyStyle.subtitle2.merge(
                      TextStyle(
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: SpacingDimens.spacing8,
                  ),
                  Text(
                    'Tanggal Lahir : ' + formattedDate,
                    style: TypographyStyle.caption2.merge(
                      TextStyle(
                        color: PaletteColor.grey60,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 2,
                  ),
                  Text(
                    'Umur Kehamilan : ' +
                        data.umurkehamilan.toString() +
                        " Minggu",
                    style: TypographyStyle.caption2.merge(
                      TextStyle(
                        color: PaletteColor.grey60,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 2,
                  ),
                  Text(
                    'Jenis Persalinan : ' + data.jenispersalinan,
                    style: TypographyStyle.caption2.merge(
                      TextStyle(
                        color: PaletteColor.grey60,
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
          Container(
            margin: EdgeInsets.only(
              top: SpacingDimens.spacing16,
            ),
            height: 1,
            width: MediaQuery.of(context).size.width,
            color: PaletteColor.grey40,
          ),
        ],
      ),
    );
  }
}
