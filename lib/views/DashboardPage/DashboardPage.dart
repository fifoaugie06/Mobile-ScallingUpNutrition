import 'package:flutter/material.dart';
import 'package:scallingupnutrition/theme/PaletteColor.dart';
import 'package:scallingupnutrition/views/DashboardPage/section/CarouselSection.dart';
import 'package:scallingupnutrition/views/DashboardPage/section/EducationSection.dart';
import 'package:scallingupnutrition/views/DashboardPage/section/FeatureSection.dart';

class DashboardPage extends StatefulWidget {
  @override
  _DashboardPageState createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: PaletteColor.primarybg,
      appBar: AppBar(
        title: Text(
          'SCALLING UP NUTRITION',
        ),
        backgroundColor: PaletteColor.primary,
      ),
      body: RefreshIndicator(
        color: PaletteColor.primary,
        onRefresh: null,
      ),
    );
  }
}
