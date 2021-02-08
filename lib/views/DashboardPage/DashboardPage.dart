import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:scallingupnutrition/component/Indicator/IndicatorLoad.dart';
import 'package:scallingupnutrition/providers/EducationProvider.dart';
import 'package:scallingupnutrition/theme/PaletteColor.dart';
import 'package:scallingupnutrition/theme/TypographyStyle.dart';
import 'package:scallingupnutrition/views/DashboardPage/section/CarouselSection.dart';
import 'package:scallingupnutrition/views/DashboardPage/section/EducationSection.dart';
import 'package:scallingupnutrition/views/DashboardPage/section/FeatureSection.dart';
import 'package:url_launcher/url_launcher.dart';

import 'component/NavDrawer.dart';

class DashboardPage extends StatefulWidget {
  final int idUser;

  DashboardPage({@required this.idUser});

  @override
  _DashboardPageState createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  final GlobalKey<ScaffoldState> _scaffoldDashboard =
      new GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: PaletteColor.primarybg,
      key: _scaffoldDashboard,
      drawer: Theme(
        data: Theme.of(context).copyWith(canvasColor: Colors.white),
        child: NavDrawer(
          ctx: context,
          idUser: widget.idUser,
        ),
      ),
      appBar: AppBar(
        title: Text(
          'Scalling Up Nutrition',
          style: TypographyStyle.subtitle1.merge(
            TextStyle(
                color: PaletteColor.primarybg, fontWeight: FontWeight.w700),
          ),
        ),
        leading: IconButton(
          icon: Icon(
            Icons.menu,
          ),
          onPressed: () => _scaffoldDashboard.currentState.openDrawer(),
        ),
        actions: [
          IconButton(
            icon: Icon(
              Icons.phone,
            ),
            onPressed: _launchURL,
          ),
        ],
        backgroundColor: PaletteColor.primary,
      ),
      body: RefreshIndicator(
        color: PaletteColor.primary,
        onRefresh: () => Provider.of<EducationProvider>(context, listen: false)
            .getEducation(),
        child: FutureBuilder(
          future: Future.wait([
            Provider.of<EducationProvider>(context, listen: false)
                .getEducation(),
            Provider.of<EducationProvider>(context, listen: false)
                .getEducationRandom(),
          ]),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return indicatorLoad();
            }
            return Consumer2<EducationProvider, EducationProvider>(
              builder: (context, dataEducation, dataEducationRandom, _) {
                // print(dataEducationRandom.responseEducationRandom.data);
                return SingleChildScrollView(
                  physics: BouncingScrollPhysics(),
                  child: Column(
                    children: [
                      CarouselSection(
                        dataEducationRandom: dataEducationRandom,
                      ),
                      FeatureSection(
                        idUser: widget.idUser,
                      ),
                      EducationSection(
                        dataEducation: dataEducation.responseEducation.data,
                      ),
                    ],
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }

  _launchURL() async {
    String msg = "Assalamualaikum, dengan Ibu Sarwenda ? Boleh kah saya berkonsultasi ?";
    var url = 'https://wa.me/6289665954222?text=' + msg;
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}
