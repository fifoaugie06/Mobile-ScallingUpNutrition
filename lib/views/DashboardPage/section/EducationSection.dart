import 'package:flutter/material.dart';
import 'package:scallingupnutrition/theme/PaletteColor.dart';
import 'package:scallingupnutrition/theme/SpacingDimens.dart';
import 'package:scallingupnutrition/theme/TypographyStyle.dart';
import 'package:scallingupnutrition/views/DashboardPage/component/EducationTile.dart';

class EducationSection extends StatelessWidget {
  int _educationCount = 5;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: PaletteColor.primarybg,
      padding: EdgeInsets.only(
        top: SpacingDimens.spacing24,
        bottom: SpacingDimens.spacing4,
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: SpacingDimens.spacing16,
        ),
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: EdgeInsets.only(
                        bottom: SpacingDimens.spacing4,
                      ),
                      alignment: Alignment.center,
                      child: Text(
                        "Informasi Edukasi",
                        style: TypographyStyle.subtitle2,
                      ),
                    ),
                    Text(
                      "Update Terbaru",
                      style: TypographyStyle.mini.merge(
                        TextStyle(
                          color: PaletteColor.grey60,
                        ),
                      ),
                    ),
                  ],
                ),
                GestureDetector(
                  onTap: () {},
                  child: Row(
                    children: [
                      Text(
                        "View All",
                        style: TypographyStyle.caption2.merge(
                          TextStyle(
                            color: PaletteColor.primary,
                          ),
                        ),
                      ),
                      SizedBox(
                        width: SpacingDimens.spacing8,
                      ),
                      Icon(
                        Icons.arrow_forward_ios,
                        size: 12,
                        color: PaletteColor.primary,
                      ),
                    ],
                  ),
                ),
              ],
            ),
            GestureDetector(
              onTap: () {},
              child: ListView.builder(
                physics: BouncingScrollPhysics(),
                shrinkWrap: true,
                itemCount: _educationCount,
                itemBuilder: (context, index) {
                  return Container(
                    margin: EdgeInsets.only(
                      top: SpacingDimens.spacing16,
                    ),
                    child: EducationTile(),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
