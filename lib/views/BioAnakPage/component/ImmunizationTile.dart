import 'package:flutter/material.dart';
import 'package:scallingupnutrition/model/Children.dart';
import 'package:scallingupnutrition/theme/PaletteColor.dart';
import 'package:scallingupnutrition/theme/SpacingDimens.dart';
import 'package:scallingupnutrition/theme/TypographyStyle.dart';

class ImmunizationTile extends StatelessWidget {
  String title, description, tanggal;

  ImmunizationTile({@required this.title, @required this.description, @required this.tanggal});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: SpacingDimens.spacing8),
      decoration: BoxDecoration(
        border: Border.all(
          color: PaletteColor.grey20,
        ),
      ),
      child: Padding(
        padding: EdgeInsets.only(
          left: SpacingDimens.spacing24,
          right: SpacingDimens.spacing24,
          top: SpacingDimens.spacing16,
          bottom: SpacingDimens.spacing16,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: TypographyStyle.subtitle1,
            ),
            Padding(
              padding: const EdgeInsets.only(top: SpacingDimens.spacing4),
              child: Text(
                'Jadwal : ' + tanggal,
                style: TypographyStyle.caption1.merge(
                  TextStyle(
                    color: PaletteColor.grey60,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: SpacingDimens.spacing4),
              child: Text(
                description,
                style: TypographyStyle.caption1.merge(
                  TextStyle(
                    color: PaletteColor.grey60,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
