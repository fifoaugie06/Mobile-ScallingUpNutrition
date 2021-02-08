import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:scallingupnutrition/config/GlobalEndpoint.dart';
import 'package:scallingupnutrition/theme/PaletteColor.dart';
import 'package:scallingupnutrition/theme/SpacingDimens.dart';
import 'package:scallingupnutrition/theme/TypographyStyle.dart';
import 'package:intl/intl.dart';

class EducationTile extends StatelessWidget {
  final String title, category, content, photo;
  final DateTime createdAt;

  EducationTile({
    @required this.title,
    @required this.category,
    @required this.content,
    @required this.photo,
    @required this.createdAt,
  });

  @override
  Widget build(BuildContext context) {
    String formattedDate = DateFormat('dd MMMM yyyy').format(createdAt);

    return Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 100,
              height: 65,
              decoration: BoxDecoration(
                color: PaletteColor.primarybg2,
                borderRadius: BorderRadius.circular(
                  4.0,
                ),
                image: DecorationImage(
                  image: NetworkImage(
                    GlobalEndpoint.BASE_STORAGE_URL + photo,
                  ),
                  fit: BoxFit.cover,
                ),
              ),
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
                          category.toUpperCase(),
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
                          formattedDate,
                          style: TypographyStyle.mini.merge(
                            TextStyle(
                              fontWeight: FontWeight.w600,
                              color: PaletteColor.grey80,
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: SpacingDimens.spacing4,
                    ),
                    Text(
                      title,
                      style: TypographyStyle.subtitle2,
                    ),
                    SizedBox(
                      height: SpacingDimens.spacing4,
                    ),
                    Text(
                      content,
                      style: TypographyStyle.caption1.merge(
                        TextStyle(
                          color: PaletteColor.grey60,
                        ),
                      ),
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
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
