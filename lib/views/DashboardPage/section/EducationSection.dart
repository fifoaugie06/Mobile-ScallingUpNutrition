import 'package:flutter/material.dart';
import 'package:scallingupnutrition/model/Education.dart';
import 'package:scallingupnutrition/route/RouteTransisition.dart';
import 'package:scallingupnutrition/theme/PaletteColor.dart';
import 'package:scallingupnutrition/theme/SpacingDimens.dart';
import 'package:scallingupnutrition/theme/TypographyStyle.dart';
import 'package:scallingupnutrition/views/DashboardPage/component/EducationTile.dart';
import 'package:scallingupnutrition/views/EducationPage/EducationDetailPage.dart';
import 'package:scallingupnutrition/views/EducationPage/EducationPage.dart';

class EducationSection extends StatelessWidget {
  final List<Datum> dataEducation;

  EducationSection({@required this.dataEducation});

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
                  onTap: () {
                    Navigator.of(context).push(
                      routeTransition(EducationPage()),
                    );
                  },
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
                itemCount: dataEducation.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(
                        routeTransition(
                          EducationDetailPage(
                            title: dataEducation[index].title,
                            category: dataEducation[index].educationcategory.title,
                            photo: dataEducation[index].photo,
                            content: dataEducation[index].content,
                            createdAt: dataEducation[index].createdAt,
                          ),
                        ),
                      );
                    },
                    child: Container(
                      margin: EdgeInsets.only(
                        top: SpacingDimens.spacing16,
                      ),
                      color: PaletteColor.primarybg,
                      child: EducationTile(
                        title: dataEducation[index].title,
                        category: dataEducation[index].educationcategory.title,
                        photo: dataEducation[index].photo,
                        content: dataEducation[index].content,
                        createdAt: dataEducation[index].createdAt,
                      ),
                    ),
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
