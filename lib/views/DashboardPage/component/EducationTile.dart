import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:scallingupnutrition/theme/PaletteColor.dart';
import 'package:scallingupnutrition/theme/SpacingDimens.dart';
import 'package:scallingupnutrition/theme/TypographyStyle.dart';

class EducationTile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 100,
              height: 65,
              color: PaletteColor.primarybg2,
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(
                  left: SpacingDimens.spacing8,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                          'KEHAMILAN',
                          style: TypographyStyle.mini.merge(
                            TextStyle(
                              color: PaletteColor.primary,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                        SizedBox(
                          width: SpacingDimens.spacing8,
                        ),
                        Text(
                          '28 Apr 2020',
                          style: TypographyStyle.mini.merge(
                            TextStyle(
                                fontWeight: FontWeight.w600,
                                color: PaletteColor.grey80),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: SpacingDimens.spacing4,
                    ),
                    Text(
                      'Mengenal Lebih Jauh Kehamilan Ektopik atau Kehamilan di Luar Rahim',
                      style: TypographyStyle.subtitle2,
                    ),
                    SizedBox(
                      height: SpacingDimens.spacing4,
                    ),
                    Text(
                      'Kehamilan adalah sebuah anugerah yang harus dijaga perkembangannya. Tapi, pada beberap ...',
                      style: TypographyStyle.caption1.merge(
                        TextStyle(
                          color: PaletteColor.grey60,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
        Container(
          margin: EdgeInsets.only(
            top: SpacingDimens.spacing16,
          ),
          width: MediaQuery.of(context).size.width,
          height: 1,
          color: PaletteColor.grey20,
        ),
      ],
    );
  }
}
