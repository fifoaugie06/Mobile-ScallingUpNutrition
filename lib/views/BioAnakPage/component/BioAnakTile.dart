import 'package:flutter/material.dart';
import 'package:scallingupnutrition/model/Children.dart';
import 'package:scallingupnutrition/theme/PaletteColor.dart';
import 'package:scallingupnutrition/theme/SpacingDimens.dart';
import 'package:scallingupnutrition/theme/TypographyStyle.dart';

class BioAnakTile extends StatelessWidget {
  final Datum dataAnak;

  BioAnakTile({@required this.dataAnak});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 38,
                height: 38,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(
                    4.0,
                  ),
                  color: Color(
                    0xFFE67E22,
                  ),
                ),
                child: Center(
                  child: Text(
                    dataAnak.anakke.toString(),
                    style: TypographyStyle.subtitle2.merge(
                      TextStyle(
                        color: PaletteColor.primarybg,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: SpacingDimens.spacing16,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      dataAnak.nama,
                      style: TypographyStyle.subtitle2,
                    ),
                    SizedBox(
                      height: SpacingDimens.spacing4,
                    ),
                    Text(
                      'TTL : ' + dataAnak.ttl,
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
                      'Tinggi Badan : ' + dataAnak.tb.toString() + " Cm",
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
                      'Berat Badan : ' + dataAnak.bb.toString() + " Kg",
                      style: TypographyStyle.caption2.merge(
                        TextStyle(
                          color: PaletteColor.grey60,
                        ),
                      ),
                    ),
                  ],
                ),
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
