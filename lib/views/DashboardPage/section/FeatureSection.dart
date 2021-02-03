import 'package:flutter/material.dart';
import 'package:scallingupnutrition/component/Animation/ScaleTileTransition.dart';
import 'package:scallingupnutrition/theme/PaletteColor.dart';
import 'package:scallingupnutrition/theme/SpacingDimens.dart';
import 'package:scallingupnutrition/theme/TypographyStyle.dart';

class FeatureSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: PaletteColor.primarybg,
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.symmetric(
              horizontal: SpacingDimens.spacing24,
            ),
            child: Row(
              children: [
                featureTile(title: "HPHT", icon: Icons.room, onTap: () {}),
                SizedBox(
                  width: SpacingDimens.spacing16,
                ),
                featureTile(title: "Paritas", icon: Icons.room, onTap: () {}),
                SizedBox(
                  width: SpacingDimens.spacing16,
                ),
                featureTile(title: "Bio Anak", icon: Icons.room, onTap: () {}),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // navigateTo(Widget target) {
  //   Navigator.of(ctx).push(
  //     routeTransition(target),
  //   );
  // }

  Widget featureTile(
      {@required String title,
      @required IconData icon,
      @required Function onTap}) {
    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        child: ScaleTileTransition(
          child: Container(
            height: 100,
            decoration: BoxDecoration(
              border: Border.all(
                color: PaletteColor.primarybg2,
                width: 1,
              ),
              borderRadius: BorderRadius.circular(
                4.0,
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: 40.0,
                  width: 40.0,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: PaletteColor.primary40,
                  ),
                  child: Icon(
                    icon,
                    size: 15,
                    color: PaletteColor.primary,
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(
                    top: SpacingDimens.spacing8,
                  ),
                  child: Text(
                    title,
                    style: TypographyStyle.caption1.merge(
                      TextStyle(
                        color: PaletteColor.grey,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
