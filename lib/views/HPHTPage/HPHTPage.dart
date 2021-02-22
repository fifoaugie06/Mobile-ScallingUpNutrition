import 'package:flutter/material.dart';
import 'package:flutter_calendar_carousel/flutter_calendar_carousel.dart'
    show CalendarCarousel;
import 'package:flutter_calendar_carousel/classes/event.dart';
import 'package:scallingupnutrition/theme/PaletteColor.dart';
import 'package:scallingupnutrition/theme/SpacingDimens.dart';
import 'package:scallingupnutrition/theme/TypographyStyle.dart';
import 'package:intl/intl.dart';

class HPHTPage extends StatefulWidget {
  @override
  _HPHTPageState createState() => _HPHTPageState();
}

class _HPHTPageState extends State<HPHTPage> {
  DateTime _currentDate = DateTime.now();
  DateTime _currentDate2 = DateTime.now();
  String result;

  CalendarCarousel _calendarCarouselNoHeader;

  @override
  Widget build(BuildContext context) {
    _calendarCarouselNoHeader = CalendarCarousel<Event>(
      onDayPressed: (DateTime date, List<Event> events) {
        this.setState(
          () => _currentDate2 = date,
        );
      },
      weekendTextStyle: TextStyle(
        color: PaletteColor.red,
      ),
      headerTextStyle: TypographyStyle.subtitle1.merge(
        TextStyle(
            // color: PaletteColor.primary,
            fontWeight: FontWeight.w700),
      ),
      height: 380.0,
      selectedDateTime: _currentDate2,
      customGridViewPhysics: NeverScrollableScrollPhysics(),
      showHeader: true,
      leftButtonIcon: Icon(
        Icons.arrow_back_ios,
        size: 20,
      ),
      rightButtonIcon: Icon(
        Icons.arrow_forward_ios,
        size: 20,
      ),
      todayButtonColor: PaletteColor.grey40,
      todayBorderColor: PaletteColor.primary,
      todayTextStyle: TextStyle(
        color: PaletteColor.grey,
      ),
      selectedDayButtonColor: PaletteColor.primary,
      minSelectedDate: _currentDate.subtract(Duration(days: 360)),
      maxSelectedDate: _currentDate.add(Duration(days: 360)),
    );

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
          'HPHT',
          style: TypographyStyle.subtitle1.merge(
            TextStyle(
              color: PaletteColor.primarybg,
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.all(
            SpacingDimens.spacing24,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                'Pilih tanggal Hari Pertama Haid Terakhir atau HPHT',
                style: TypographyStyle.subtitle1.merge(
                  TextStyle(
                    fontSize: 16,
                  ),
                ),
              ),
              _calendarCarouselNoHeader,
              result != null ? Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Result :',
                    style: TypographyStyle.subtitle2,
                  ),
                  SizedBox(
                    height: SpacingDimens.spacing8,
                  ),
                  Text(
                    'Si kecil diperkirakan lahir pada tanggal ' + result + " Dan diperkirakan berumur " + _currentDate2.difference(_currentDate).inDays.toString() + " Hari",
                    style: TypographyStyle.subtitle2,
                  ),
                ],
              ) : Container(),
              SizedBox(
                height: SpacingDimens.spacing48,
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width,
                child: FlatButton(
                  color: PaletteColor.primary,
                  splashColor: PaletteColor.primary80,
                  height: 48,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(3.0),
                    side: BorderSide(
                      color: PaletteColor.red,
                    ),
                  ),
                  onPressed: () {
                    setState(() {
                      result = DateFormat('dd MMMM yyyy').format(
                        calculateHpht(_currentDate2),
                      );
                    });
                  },
                  child: Text(
                    "Kalkulasikan",
                    style: TypographyStyle.button1.merge(
                      TextStyle(
                        color: PaletteColor.primarybg,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  DateTime calculateHpht(DateTime currentDate) {
    var result;

    if (currentDate.month >= 1 && currentDate.month <= 3) {
      result = new DateTime(
          currentDate.year, currentDate.month + 9, currentDate.day + 7);
    } else {
      result = new DateTime(
          currentDate.year + 1, currentDate.month - 3, currentDate.day + 7);
    }

    return result;
  }
}
