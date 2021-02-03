import 'package:flutter/material.dart';
import 'package:scallingupnutrition/route/RouteTransisition.dart';
import 'package:scallingupnutrition/theme/PaletteColor.dart';
import 'package:scallingupnutrition/theme/SpacingDimens.dart';
import 'package:scallingupnutrition/theme/TypographyStyle.dart';
import 'package:scallingupnutrition/views/LoginPage/LoginPage.dart';

class DialogSuccess extends StatelessWidget {
  final String content;
  final BuildContext ctx;

  DialogSuccess({@required this.ctx, @required this.content});

  @override
  Widget build(BuildContext context) {
    return Container(
      // color: Colors.black.withOpacity(SpacingDimens.spacing4),
      child: AlertDialog(
        backgroundColor: PaletteColor.primarybg,
        contentPadding: EdgeInsets.all(0.0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(
              SpacingDimens.spacing4,
            ),
          ),
        ),
        elevation: 5,
        title: Column(
          children: [
            Container(
              padding: EdgeInsets.all(
                SpacingDimens.spacing12,
              ),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: PaletteColor.green,
              ),
              child: Icon(
                Icons.check,
                size: 28,
                color: PaletteColor.primarybg,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                top: SpacingDimens.spacing16,
                bottom: SpacingDimens.spacing4,
              ),
              child: Text(
                'Success!',
                style: TypographyStyle.subtitle1.merge(
                  TextStyle(
                    color: PaletteColor.black,
                  ),
                ),
              ),
            ),
          ],
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: EdgeInsets.only(
                left: SpacingDimens.spacing64,
                right: SpacingDimens.spacing64,
              ),
              child: Text(
                content,
                textAlign: TextAlign.center,
                style: TypographyStyle.paragraph.merge(
                  TextStyle(
                    color: PaletteColor.grey60,
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(
                SpacingDimens.spacing24,
              ),
              child: FlatButton(
                minWidth: double.infinity,
                color: PaletteColor.primary,
                onPressed: () {
                  Navigator.pop(context);
                  Navigator.of(ctx).pushReplacement(
                    routeTransition(
                      LoginPage(),
                    ),
                  );
                },
                child: Text(
                  'OK',
                  style: TypographyStyle.button2.merge(
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
    );
  }
}
