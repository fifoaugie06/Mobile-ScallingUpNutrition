import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:scallingupnutrition/component/Indicator/IndicatorLoad.dart';
import 'package:scallingupnutrition/providers/PregnancyProvider.dart';
import 'package:scallingupnutrition/route/RouteTransisition.dart';
import 'package:scallingupnutrition/theme/PaletteColor.dart';
import 'package:scallingupnutrition/theme/SpacingDimens.dart';
import 'package:scallingupnutrition/theme/TypographyStyle.dart';
import 'package:scallingupnutrition/views/CekKehamilanPage/CekKehamilanTambahPage.dart';
import 'package:scallingupnutrition/views/CekKehamilanPage/component/CekKehamilanTile.dart';
import 'package:intl/intl.dart';

class CekKehamilanPage extends StatelessWidget {
  final int idUser;

  CekKehamilanPage({@required this.idUser});

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
          'Cek Kehamilan',
          style: TypographyStyle.subtitle1.merge(
            TextStyle(
              color: PaletteColor.primarybg,
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(
            routeTransition(
              CekKehamilanTambahPage(idUser: idUser, ctx: context),
            ),
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
            Provider.of<PregnancyProvider>(context, listen: false)
                .getPregnancy(idUser)
          ]),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return indicatorLoad();
            }
            return Consumer<PregnancyProvider>(
              builder: (context, dataPregnancy, _) {
                return ListView.builder(
                  itemCount: dataPregnancy.responsePregnancy.data.length,
                  itemBuilder: (context, index) {
                    var data = dataPregnancy.responsePregnancy.data[index];

                    String formattedDate =
                        DateFormat('dd MMMM yyyy').format(data.createdAt);

                    return GestureDetector(
                      onTap: () {},
                      child: Dismissible(
                        key: UniqueKey(),
                        direction: DismissDirection.endToStart,
                        background: Container(
                          child: Align(
                            child: Padding(
                              padding: const EdgeInsets.only(right: 16.0),
                              child: Icon(
                                Icons.delete_sweep,
                                color: Colors.white,
                              ),
                            ),
                            alignment: Alignment.centerRight,
                          ),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(
                              4.0,
                            ),
                            color: PaletteColor.red,
                          ),
                        ),
                        confirmDismiss: (DismissDirection direction) async {
                          final bool res = await showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  title: Text('Konfirmasi'),
                                  content: Text('Anda Yakin?'),
                                  actions: [
                                    FlatButton(
                                      onPressed: () =>
                                          Navigator.of(context).pop(true),
                                      child: Text(
                                        'Hapus',
                                        style: TypographyStyle.subtitle2.merge(
                                          TextStyle(
                                            color: PaletteColor.red,
                                          ),
                                        ),
                                      ),
                                    ),
                                    FlatButton(
                                      onPressed: () =>
                                          Navigator.of(context).pop(false),
                                      child: Text(
                                        'Batalkan',
                                        style: TypographyStyle.subtitle2.merge(
                                          TextStyle(
                                            color: PaletteColor.grey80,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                );
                              });
                          return res;
                        },
                        onDismissed: (value) {
                          Provider.of<PregnancyProvider>(context, listen: false)
                              .deletePregnancy(data.id)
                              .then((value) {
                            if (value == 200) {
                              Navigator.of(context).pushReplacement(
                                routeTransition(
                                  CekKehamilanPage(
                                    idUser: idUser,
                                  ),
                                ),
                              );
                            }
                          });
                        },
                        child: CekKehamilanTile(
                          title: formattedDate,
                          description: dataPregnancy
                              .responsePregnancy.data[index].pemeriksa,
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
