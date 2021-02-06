import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:scallingupnutrition/component/Indicator/IndicatorLoad.dart';
import 'package:scallingupnutrition/providers/ChildrenProvider.dart';
import 'package:scallingupnutrition/route/RouteTransisition.dart';
import 'package:scallingupnutrition/theme/PaletteColor.dart';
import 'package:scallingupnutrition/theme/SpacingDimens.dart';
import 'package:scallingupnutrition/theme/TypographyStyle.dart';
import 'package:scallingupnutrition/views/BioAnakPage/BioAnakDetailPage.dart';
import 'package:scallingupnutrition/views/BioAnakPage/component/BioAnakTile.dart';
import 'package:scallingupnutrition/views/BioAnakPage/component/DialogTambahAnak.dart';

class BioAnakPage extends StatelessWidget {
  final int idUser;

  BioAnakPage({@required this.idUser});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: PaletteColor.primarybg,
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
          'Biodata Anak',
          style: TypographyStyle.subtitle1.merge(
            TextStyle(
              color: PaletteColor.primarybg,
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
            context: context,
            builder: (ctx) {
              return DialogTambahAnak(
                ctx: context,
                idUser: idUser,
              );
            },
          );
        },
        child: Icon(
          Icons.add,
        ),
        backgroundColor: PaletteColor.primary,
      ),
      body: Padding(
        padding: const EdgeInsets.all(
          SpacingDimens.spacing16,
        ),
        child: FutureBuilder(
          future: Future.wait([
            Provider.of<ChildrenProvider>(context, listen: false)
                .getChildren(idUser)
          ]),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return indicatorLoad();
            }
            return Consumer<ChildrenProvider>(
              builder: (context, dataChildren, _) {
                return ListView.builder(
                  itemCount: dataChildren.responseChildren.data.length,
                  itemBuilder: (context, index) {
                    return Container(
                      margin: EdgeInsets.only(
                        top: index != 0 ? SpacingDimens.spacing12 : 0,
                      ),
                      child: GestureDetector(
                        onTap: () {
                          Navigator.of(context).push(
                            routeTransition(
                              BioAnakDetailPage(
                                data: dataChildren.responseChildren.data[index],
                              ),
                            ),
                          );
                        },
                        child: Container(
                          color: PaletteColor.primarybg,
                          child: BioAnakTile(
                            dataAnak: dataChildren.responseChildren.data[index],
                          ),
                        ),
                      ),
                    );
                  },
                );
              },
            );
          },
        ),
      ),
    );
  }
}
