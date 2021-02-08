import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:scallingupnutrition/providers/EducationProvider.dart';
import 'package:scallingupnutrition/theme/PaletteColor.dart';
import 'package:scallingupnutrition/theme/SpacingDimens.dart';
import 'package:scallingupnutrition/theme/TypographyStyle.dart';

class CarouselSection extends StatefulWidget {
  final EducationProvider dataEducationRandom;

  CarouselSection({@required this.dataEducationRandom});

  @override
  _CarouselSectionState createState() => _CarouselSectionState();
}

class _CarouselSectionState extends State<CarouselSection> {
  int _current = 0;
  List _imgList = [
    'slide1.jpg',
    'slide2.jpg',
    'slide3.jpg',
  ];

  List<T> map<T>(List list, Function handler) {
    List<T> result = [];
    for (var i = 0; i < list.length; i++) {
      result.add(handler(i, list[i]));
    }
    return result;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: PaletteColor.primarybg,
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.all(
              SpacingDimens.spacing16,
            ),
            child: CarouselSlider(
              options: CarouselOptions(
                  autoPlay: false,
                  enlargeCenterPage: false,
                  height: 180.0,
                  viewportFraction: 1.0,
                  aspectRatio: 2.0,
                  autoPlayCurve: Curves.fastOutSlowIn,
                  autoPlayInterval: Duration(seconds: 2),
                  autoPlayAnimationDuration: Duration(seconds: 2),
                  onPageChanged: (index, reason) {
                    setState(() {
                      _current = index;
                    });
                  }),
              items: _imgList.map(
                (imgUrl) {
                  return Builder(
                    builder: (BuildContext context) {
                      return imageContent(imgUrl);
                    },
                  );
                },
              ).toList(),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: map<Widget>(
              _imgList,
              (index, url) {
                return Container(
                  width: 20.0,
                  height: 5.0,
                  margin: EdgeInsets.only(
                    bottom: 20.0,
                  ),
                  decoration: BoxDecoration(
                    shape: _current == index
                        ? BoxShape.rectangle
                        : BoxShape.circle,
                    borderRadius: _current == index
                        ? BorderRadius.all(
                            Radius.circular(
                              SpacingDimens.spacing16,
                            ),
                          )
                        : null,
                    color: _current == index
                        ? PaletteColor.primary40
                        : PaletteColor.grey40,
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget imageContent(imgUrl) {
    return Stack(
      children: [
        Container(
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            color: PaletteColor.grey40,
            borderRadius: BorderRadius.circular(
              4.0,
            ),
            image: DecorationImage(
              image: AssetImage(
                'assets/images/carousel/$imgUrl',
              ),
              fit: BoxFit.cover,
            ),
          ),
        ),
        Container(
          width: MediaQuery.of(context).size.width / 1.8,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.centerLeft,
              stops: [0.1, 0.9],
              colors: [
                PaletteColor.grey.withOpacity(.5),
                Color(0xFF5D5D5D).withOpacity(0),
              ],
            ),
            borderRadius: BorderRadius.circular(
              4.0,
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.all(
            SpacingDimens.spacing24,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Let\'s Join!',
                style: TypographyStyle.title.merge(
                  TextStyle(
                    color: PaletteColor.primarybg,
                  ),
                ),
              ),
              SizedBox(
                height: SpacingDimens.spacing8,
              ),
              Text(
                'Workshop Python Basic 1.0',
                style: TypographyStyle.paragraph.merge(
                  TextStyle(
                    color: PaletteColor.primarybg,
                  ),
                ),
              ),
              SizedBox(
                height: SpacingDimens.spacing24,
              ),
              Text(
                'Read more',
                style: TypographyStyle.caption2.merge(
                  TextStyle(
                    color: PaletteColor.primary,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
