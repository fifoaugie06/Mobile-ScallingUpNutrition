import 'package:flutter/material.dart';
import 'package:scallingupnutrition/config/GlobalEndpoint.dart';
import 'package:scallingupnutrition/theme/PaletteColor.dart';
import 'package:scallingupnutrition/theme/SpacingDimens.dart';
import 'package:scallingupnutrition/theme/TypographyStyle.dart';
import 'package:intl/intl.dart';

class EducationDetailPage extends StatelessWidget {
  final String title, category, content, photo;
  final DateTime createdAt;

  EducationDetailPage({
    @required this.title,
    @required this.category,
    @required this.content,
    @required this.photo,
    @required this.createdAt,
  });

  @override
  Widget build(BuildContext context) {
    String formattedDate =
        DateFormat('dd MMMM yyyy HH:mm').format(createdAt);

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
          'Detail Informasi',
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
          margin: EdgeInsets.symmetric(
            horizontal: SpacingDimens.spacing16,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: EdgeInsets.only(
                  top: SpacingDimens.spacing16,
                ),
                child: Text(
                  title,
                  style: TypographyStyle.subtitle2,
                ),
              ),
              SizedBox(
                height: SpacingDimens.spacing8,
              ),
              Row(
                children: [
                  Text(
                    category,
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
                        color: PaletteColor.grey80,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: SpacingDimens.spacing16,
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                height: 190,
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
              SizedBox(
                height: SpacingDimens.spacing16,
              ),
              Text(
                content,
                style: TypographyStyle.paragraph.merge(
                  TextStyle(
                    height: 1.5,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
