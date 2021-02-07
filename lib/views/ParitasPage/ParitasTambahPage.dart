import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:scallingupnutrition/providers/ParitasProvider.dart';
import 'package:scallingupnutrition/route/RouteTransisition.dart';
import 'package:scallingupnutrition/theme/PaletteColor.dart';
import 'package:scallingupnutrition/theme/SpacingDimens.dart';
import 'package:scallingupnutrition/theme/TypographyStyle.dart';
import 'package:intl/intl.dart';
import 'package:scallingupnutrition/views/ParitasPage/ParitasPage.dart';
import 'package:toast/toast.dart';

class ParitasTambahPage extends StatefulWidget {
  int idUser;
  BuildContext ctx;

  ParitasTambahPage({@required this.idUser, @required this.ctx});

  @override
  _ParitasTambahPageState createState() => _ParitasTambahPageState();
}

class _ParitasTambahPageState extends State<ParitasTambahPage> {
  final _hamilkeController = new TextEditingController();
  final _umurKehamilanController = new TextEditingController();
  final _penolongController = new TextEditingController();
  final _bbLahirController = new TextEditingController();
  final _nifasLaktasiController = new TextEditingController();
  final _nifasKomplikasiController = new TextEditingController();

  DateTime selectedDate = DateTime.now();
  var persalinanArr = [
    "Normal",
    "Persalinan",
  ];
  var komplikasiArr = [
    "Ibu",
    "Bayi",
  ];
  var jenisKelaminArr = [
    "Pria",
    "Wanita",
  ];

  String selectPersalinan;
  String selectKomplikasi;
  String selectKelamin;

  Future<void> _selectDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(2015, 8),
        lastDate: DateTime(2101));
    if (picked != null && picked != selectedDate)
      setState(() {
        selectedDate = picked;
      });
  }

  @override
  Widget build(BuildContext context) {
    String tanggalLahir = DateFormat('yyyy-MM-dd').format(selectedDate);

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
          'Tambah Paritas',
          style: TypographyStyle.subtitle1.merge(
            TextStyle(
              color: PaletteColor.primarybg,
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(
            SpacingDimens.spacing24,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              contentForms("Hamil Ke-", "Hamil Ke-", _hamilkeController, true),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Tanggal Lahir',
                    style: TypographyStyle.caption1.merge(
                      TextStyle(
                        color: PaletteColor.grey60,
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      _selectDate(context);
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(
                        SpacingDimens.spacing16,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Text(
                              tanggalLahir,
                              style: TypographyStyle.caption1.merge(
                                TextStyle(
                                  color: PaletteColor.grey60,
                                  fontSize: 14,
                                ),
                              ),
                            ),
                          ),
                          Icon(
                            Icons.calendar_today,
                            size: 18,
                            color: PaletteColor.grey60,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              Container(
                height: 1,
                color: PaletteColor.grey60,
                margin: EdgeInsets.only(
                  bottom: SpacingDimens.spacing16,
                ),
              ),
              contentForms("Umur Kehamilan", "Umur Kehamilan",
                  _umurKehamilanController, true),
              contentForms("Penolong", "Penolong", _penolongController, false),
              contentForms(
                  "BB Lahir", "Berat Badan Lahir", _bbLahirController, true),
              dropDownJenisPersalinan(),
              dropDownKomplikasi(),
              dropDownJenisKelamin(),
              contentForms("Nifas Laktasi", "Nifas Laktasi",
                  _nifasLaktasiController, false),
              contentForms("Nifas Komplikasi", "Nifas Komplikasi",
                  _nifasKomplikasiController, false),
              SizedBox(
                height: SpacingDimens.spacing24,
              ),
              FlatButton(
                minWidth: double.infinity,
                height: 45,
                color: PaletteColor.primary,
                onPressed: () {
                  if (_hamilkeController.text == "" ||
                      _penolongController.text == "" ||
                      _bbLahirController.text == "" ||
                      _nifasLaktasiController.text == "" ||
                      _nifasKomplikasiController.text == "" ||
                      tanggalLahir == "" ||
                      selectPersalinan == null ||
                      selectKomplikasi == null ||
                      selectKelamin == null) {
                    Toast.show("Pastikan telah terisi semuanya", context,
                        duration: Toast.LENGTH_SHORT, gravity: Toast.BOTTOM);
                  } else {
                    createParitas(context, tanggalLahir);
                  }
                },
                child: Text(
                  'Submit',
                  style: TypographyStyle.button2.merge(
                    TextStyle(
                      color: PaletteColor.primarybg,
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

  Widget dropDownJenisPersalinan() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Jenis Persalinan',
          style: TypographyStyle.caption1.merge(
            TextStyle(
              color: PaletteColor.grey60,
            ),
          ),
        ),
        Container(
          margin: EdgeInsets.only(
            top: SpacingDimens.spacing16,
            bottom: SpacingDimens.spacing16,
          ),
          width: double.infinity,
          decoration: BoxDecoration(
            border: Border.all(
              color: PaletteColor.grey60,
              width: 1,
            ),
            borderRadius: BorderRadius.circular(4.0),
          ),
          padding: EdgeInsets.symmetric(
            horizontal: SpacingDimens.spacing16,
            vertical: 2.0,
          ),
          child: DropdownButtonHideUnderline(
            child: DropdownButton(
              hint: Text(
                "Pilih Jenis Persalinan",
                style: TypographyStyle.paragraph.merge(
                  TextStyle(
                    color: PaletteColor.grey60,
                  ),
                ),
              ),
              value: selectPersalinan,
              items: persalinanArr.map((value) {
                return DropdownMenuItem(
                  child: Text(
                    value,
                    style: TypographyStyle.paragraph.merge(
                      TextStyle(
                        color: PaletteColor.grey,
                      ),
                    ),
                  ),
                  value: value,
                );
              }).toList(),
              onChanged: (value) {
                setState(() {
                  selectPersalinan = value;
                });
              },
              icon: Icon(
                Icons.arrow_forward_ios,
                color: PaletteColor.primary,
                size: 20,
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget dropDownKomplikasi() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Komplikasi',
          style: TypographyStyle.caption1.merge(
            TextStyle(
              color: PaletteColor.grey60,
            ),
          ),
        ),
        Container(
          margin: EdgeInsets.only(
            top: SpacingDimens.spacing16,
            bottom: SpacingDimens.spacing16,
          ),
          width: double.infinity,
          decoration: BoxDecoration(
            border: Border.all(
              color: PaletteColor.grey60,
              width: 1,
            ),
            borderRadius: BorderRadius.circular(4.0),
          ),
          padding: EdgeInsets.symmetric(
            horizontal: SpacingDimens.spacing16,
            vertical: 2.0,
          ),
          child: DropdownButtonHideUnderline(
            child: DropdownButton(
              hint: Text(
                "Pilih Komplikasi",
                style: TypographyStyle.paragraph.merge(
                  TextStyle(
                    color: PaletteColor.grey60,
                  ),
                ),
              ),
              value: selectKomplikasi,
              items: komplikasiArr.map((value) {
                return DropdownMenuItem(
                  child: Text(
                    value,
                    style: TypographyStyle.paragraph.merge(
                      TextStyle(
                        color: PaletteColor.grey,
                      ),
                    ),
                  ),
                  value: value,
                );
              }).toList(),
              onChanged: (value) {
                setState(() {
                  selectKomplikasi = value;
                });
              },
              icon: Icon(
                Icons.arrow_forward_ios,
                color: PaletteColor.primary,
                size: 20,
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget dropDownJenisKelamin() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Jenis Kelamin',
          style: TypographyStyle.caption1.merge(
            TextStyle(
              color: PaletteColor.grey60,
            ),
          ),
        ),
        Container(
          margin: EdgeInsets.only(
            top: SpacingDimens.spacing16,
            bottom: SpacingDimens.spacing16,
          ),
          width: double.infinity,
          decoration: BoxDecoration(
            border: Border.all(
              color: PaletteColor.grey60,
              width: 1,
            ),
            borderRadius: BorderRadius.circular(4.0),
          ),
          padding: EdgeInsets.symmetric(
            horizontal: SpacingDimens.spacing16,
            vertical: 2.0,
          ),
          child: DropdownButtonHideUnderline(
            child: DropdownButton(
              hint: Text(
                "Pilih Jenis Kelamin",
                style: TypographyStyle.paragraph.merge(
                  TextStyle(
                    color: PaletteColor.grey60,
                  ),
                ),
              ),
              value: selectKelamin,
              items: jenisKelaminArr.map((value) {
                return DropdownMenuItem(
                  child: Text(
                    value,
                    style: TypographyStyle.paragraph.merge(
                      TextStyle(
                        color: PaletteColor.grey,
                      ),
                    ),
                  ),
                  value: value,
                );
              }).toList(),
              onChanged: (value) {
                setState(() {
                  selectKelamin = value;
                });
              },
              icon: Icon(
                Icons.arrow_forward_ios,
                color: PaletteColor.primary,
                size: 20,
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget contentForms(
    String title,
    String hint,
    TextEditingController controller,
    bool isNumeric,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TypographyStyle.mini.merge(
            TextStyle(
              color: PaletteColor.grey60,
            ),
          ),
        ),
        TextFormField(
          controller: controller,
          cursorColor: PaletteColor.primary,
          keyboardType: isNumeric ? TextInputType.number : TextInputType.text,
          decoration: InputDecoration(
            contentPadding: EdgeInsets.only(
              left: SpacingDimens.spacing16,
              top: SpacingDimens.spacing8,
              bottom: SpacingDimens.spacing8,
            ),
            hintText: hint,
            hintStyle: TypographyStyle.paragraph.merge(
              TextStyle(
                color: PaletteColor.grey60,
              ),
            ),
            focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(
                color: PaletteColor.primary,
              ),
            ),
          ),
        ),
        SizedBox(
          height: SpacingDimens.spacing16,
        ),
      ],
    );
  }

  void createParitas(BuildContext context, String tanggalLahir) {
    Provider.of<ParitasProvider>(context, listen: false).createParitas(
      id: widget.idUser,
      hamilke: _hamilkeController.text,
      tanggallahir: tanggalLahir,
      umurkehamilan: _umurKehamilanController.text,
      jenispersalinan: selectPersalinan,
      penolong: _penolongController.text,
      komplikasi: selectKomplikasi,
      jeniskelamin: selectKelamin,
      bb: _bbLahirController.text,
      nifas_laktasi: _nifasLaktasiController.text,
      nifas_komplikasi: _nifasKomplikasiController.text,
    ).then((value){
      if (value == 200) {
        Navigator.of(context).pop();
        Navigator.of(widget.ctx).pushReplacement(
          routeTransition(
            ParitasPage(
              idUser: widget.idUser,
            ),
          ),
        );
      }
    });
  }
}
