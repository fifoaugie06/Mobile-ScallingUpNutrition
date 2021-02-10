import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:scallingupnutrition/component/Indicator/IndicatorLoad.dart';
import 'package:scallingupnutrition/providers/EducationCategoryProvider.dart';
import 'package:scallingupnutrition/route/RouteTransisition.dart';
import 'package:scallingupnutrition/theme/PaletteColor.dart';
import 'package:scallingupnutrition/theme/SpacingDimens.dart';
import 'package:scallingupnutrition/theme/TypographyStyle.dart';
import 'package:scallingupnutrition/views/DashboardPage/component/EducationTile.dart';
import 'package:scallingupnutrition/views/EducationPage/EducationDetailPage.dart';

class EducationPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
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
          'Informasi Edukasi',
          style: TypographyStyle.subtitle1.merge(
            TextStyle(
              color: PaletteColor.primarybg,
            ),
          ),
        ),
      ),
      body: FutureBuilder(
        future: Future.wait([
          Provider.of<EducationCategoryProvider>(context, listen: false)
              .getEducation(),
        ]),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Scaffold(
              body: indicatorLoad(),
            );
          }
          return Consumer<EducationCategoryProvider>(
            builder: (snapshot, dataEducationCategory, _) {
              return EducationNavigationPage(
                dataEducationCategory: dataEducationCategory,
              );
            },
          );
        },
      ),
    );
  }
}

class EducationNavigationPage extends StatefulWidget {
  final EducationCategoryProvider dataEducationCategory;

  EducationNavigationPage({@required this.dataEducationCategory});

  @override
  _EducationNavigationPageState createState() => _EducationNavigationPageState(
        idSelected:
            dataEducationCategory.responseEducationCategory.data.length == 0
                ? 0
                : dataEducationCategory.responseEducationCategory.data[0].id,
      );
}

class _EducationNavigationPageState extends State<EducationNavigationPage> {
  int idSelected;
  int idArr = 0;

  _EducationNavigationPageState({@required this.idSelected});

  @override
  Widget build(BuildContext context) {
    var data = widget.dataEducationCategory.responseEducationCategory.data;

    return Scaffold(
      backgroundColor: PaletteColor.primarybg,
      body: Padding(
        padding: EdgeInsets.all(
          SpacingDimens.spacing12,
        ),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 50,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  itemCount: data.length,
                  itemBuilder: (context, idx) {
                    return Container(
                      margin: EdgeInsets.only(
                        left: idx == 0 ? 0 : SpacingDimens.spacing8,
                      ),
                      child: ChoiceChip(
                        label: Text(
                          data[idx].title,
                          style: TypographyStyle.caption2.merge(
                            TextStyle(
                              color: data[idx].id != idSelected
                                  ? PaletteColor.grey60
                                  : PaletteColor.primarybg,
                            ),
                          ),
                        ),
                        selected: idSelected == data[idx].id,
                        onSelected: (_) => setState(
                          () {
                            idSelected = data[idx].id;
                            idArr = idx;
                          },
                        ),
                        selectedColor: PaletteColor.primary,
                        backgroundColor: PaletteColor.primarybg,
                        shape: StadiumBorder(
                          side: BorderSide(
                            color: PaletteColor.grey40,
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
              SizedBox(
                height: 16,
              ),
              ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: data.length == 0 ? 0 : data[idArr].education.length,
                itemBuilder: (context, idx) {
                  var dataEducation = data[idArr].education[idx];

                  return GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(
                        routeTransition(
                          EducationDetailPage(
                            title: dataEducation.title,
                            category: data[idArr].title,
                            content: dataEducation.content,
                            photo: dataEducation.photo,
                            createdAt: dataEducation.createdAt,
                          ),
                        ),
                      );
                    },
                    child: Container(
                      color: PaletteColor.primarybg,
                      margin: EdgeInsets.only(
                        top: idx == 0 ? 0 : SpacingDimens.spacing16,
                      ),
                      child: EducationTile(
                        title: dataEducation.title,
                        category: data[idArr].title,
                        content: dataEducation.content,
                        photo: dataEducation.photo,
                        createdAt: dataEducation.createdAt,
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ItemChoice {
  final int id;
  final String label;

  ItemChoice(this.id, this.label);
}
