import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:scallingupnutrition/component/Indicator/IndicatorLoad.dart';
import 'package:scallingupnutrition/providers/ParitasProvider.dart';
import 'package:scallingupnutrition/route/RouteTransisition.dart';
import 'package:scallingupnutrition/theme/PaletteColor.dart';
import 'package:scallingupnutrition/theme/SpacingDimens.dart';
import 'package:scallingupnutrition/theme/TypographyStyle.dart';
import 'package:scallingupnutrition/views/ParitasPage/ParitasDetailPage.dart';
import 'package:scallingupnutrition/views/ParitasPage/ParitasTambahPage.dart';
import 'package:scallingupnutrition/views/ParitasPage/component/ParitasTile.dart';

class ParitasPage extends StatelessWidget {
  final int idUser;

  ParitasPage({@required this.idUser});

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
          'Paritas',
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
              ParitasTambahPage(
                idUser: idUser,
                ctx: context
              ),
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
            Provider.of<ParitasProvider>(context, listen: false)
                .getParitas(idUser),
          ]),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return indicatorLoad();
            }
            return Consumer<ParitasProvider>(
              builder: (context, dataParitas, _) {
                return ListView.builder(
                  itemCount: dataParitas.responseParitas.data.length,
                  itemBuilder: (context, index) {
                    var data = dataParitas.responseParitas.data[index];

                    return GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(
                          routeTransition(
                            ParitasDetailPage(
                              data: data,
                            ),
                          ),
                        );
                      },
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
                          Provider.of<ParitasProvider>(context, listen: false)
                              .deleteParitas(data.id)
                              .then((value) {
                            if (value == 200) {
                              Navigator.of(context).pushReplacement(
                                routeTransition(
                                  ParitasPage(
                                    idUser: idUser,
                                  ),
                                ),
                              );
                            }
                          });
                        },
                        child: ParitasTile(
                          data: data,
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
