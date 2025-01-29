import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

import '../widgets/export.dart';
import 'numbers_screen.dart';

class Professions extends StatefulWidget {
  const Professions({super.key});

  @override
  State<Professions> createState() => _ProfessionsState();
}

class _ProfessionsState extends State<Professions> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          'Profesija',
          style: TextStyle(fontSize: 18),
        ),
        leading: IconButton(
          icon: const FaIcon(FontAwesomeIcons.chevronLeft),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 5),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // --------Word of the Day-----
              WOD(size: size),

              Container(
                height: size.height * 0.07,
                padding: const EdgeInsets.symmetric(horizontal: 12.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    reusableBoldText(
                      'Po Zanimanju / Professija',
                      0xFF000000,
                      18,
                    ),
                    Container(
                      decoration: BoxDecoration(
                          color: const Color(0xFFFFD4F2).withOpacity(0.45),
                          borderRadius: BorderRadius.circular(20)),
                      width: size.width * 0.25,
                      height: size.height * 0.05,
                      child: Align(
                        alignment: Alignment.center,
                        child: reusableClickableText(context, "", 'Quiz... ',
                            0xFF83006A, const NumberScreen()),
                      ),
                    ),
                  ],
                ),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 8.0),
                child: Divider(
                  thickness: 1.5,
                  color: Colors.grey,
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 8.0, vertical: 13),
                child: Text(
                  'When making introductions it is common to introduce yourself e.g \'Zovem se Ana\'\n'
                  'In the table below there is an indicator of how to say this in the 1st, 2nd and 3rd person',
                  style: GoogleFonts.arima(fontSize: 15),
                ),
              ),
              Padding(
                padding:
                    //padding: const EdgeInsets.symmetric(horizontal: 12.0),
                    const EdgeInsets.symmetric(horizontal: 12.0, vertical: 13),
                child: Text(
                  'When there is a noun or a verb infront of the znati se verb, it morphs to se znati e.g \'Ona se zove Lea\' or \'Kako se zovete?\'',
                  style: GoogleFonts.arima(fontSize: 15),
                ),
              ),
              _dataTable(),
            ],
          ),
        ),
      ),
    );
  }

  DataTable _dataTable() {
    return DataTable(
      columns: _createColumns(),
      rows: _genderRows(),
      dividerThickness: 2,
      dataRowHeight: 70,
      showBottomBorder: true,
      headingTextStyle:
          const TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
      headingRowColor:
          WidgetStateProperty.resolveWith((states) => const Color(0xFF83006A)),
    );
  }

  List<DataColumn> _createColumns() {
    return [
      DataColumn(
          label: Text('English', style: GoogleFonts.comicNeue(fontSize: 15))),
      DataColumn(
          label: Text(
        'Muški',
        style: GoogleFonts.comicNeue(
          fontSize: 15,
        ),
      )),
      DataColumn(
          label: Text('Ženski', style: GoogleFonts.comicNeue(fontSize: 15))),
    ];
  }

  List<DataRow> _createRows() {
    return [
      DataRow(cells: [
        DataCell(Text('Hair Salonist', style: GoogleFonts.arima(fontSize: 13))),
        DataCell(Text('Frizer', style: GoogleFonts.arima(fontSize: 13))),
        DataCell(Text('Frizerka', style: GoogleFonts.arima(fontSize: 13))),
      ]),
      DataRow(cells: [
        DataCell(
            Text('blizu prozora', style: GoogleFonts.arima(fontSize: 11.5))),
        DataCell(Text('od rajčice', style: GoogleFonts.arima(fontSize: 11.5))),
        DataCell(Text('iz osla', style: GoogleFonts.arima(fontSize: 11.5))),
      ]),
      DataRow(cells: [
        DataCell(Text('Zagreb', style: GoogleFonts.arima(fontSize: 12))),
        DataCell(Text('Šećer', style: GoogleFonts.arima(fontSize: 12))),
        DataCell(Text('More', style: GoogleFonts.arima(fontSize: 12))),
      ]),
      DataRow(cells: [
        DataCell(Text('iz Zagreba', style: GoogleFonts.arima(fontSize: 12))),
        DataCell(Text('bez šećera', style: GoogleFonts.arima(fontSize: 12))),
        DataCell(Text('od Mora', style: GoogleFonts.arima(fontSize: 12))),
      ]),
    ];
  }

  List<DataRow> _genderRows() {
    return [
      DataRow(cells: [
        DataCell(
            Text('Hair Salonist', style: GoogleFonts.comicNeue(fontSize: 13))),
        DataCell(Text('Frizer', style: GoogleFonts.comicNeue(fontSize: 13))),
        DataCell(Text('Frizerka', style: GoogleFonts.comicNeue(fontSize: 13))),
      ]),
      DataRow(cells: [
        DataCell(
            Text('Police Officer', style: GoogleFonts.comicNeue(fontSize: 13))),
        DataCell(Text('Policajac', style: GoogleFonts.comicNeue(fontSize: 13))),
        DataCell(Text('Policajka', style: GoogleFonts.comicNeue(fontSize: 13))),
      ]),
      DataRow(cells: [
        DataCell(Text('Singer', style: GoogleFonts.comicNeue(fontSize: 13))),
        DataCell(Text('Pjevač', style: GoogleFonts.comicNeue(fontSize: 13))),
        DataCell(Text('Pjevačića', style: GoogleFonts.comicNeue(fontSize: 13))),
      ]),
      DataRow(cells: [
        DataCell(
            Text('Actor/Actress', style: GoogleFonts.comicNeue(fontSize: 13))),
        DataCell(Text('Glumac', style: GoogleFonts.comicNeue(fontSize: 13))),
        DataCell(Text('Glumica', style: GoogleFonts.comicNeue(fontSize: 13))),
      ]),
      DataRow(cells: [
        DataCell(Text('Programmer/ \nSoftware Developer',
            style: GoogleFonts.comicNeue(fontSize: 12))),
        DataCell(Text('Programer', style: GoogleFonts.comicNeue(fontSize: 12))),
        DataCell(
            Text('Programerka', style: GoogleFonts.comicNeue(fontSize: 12))),
      ]),
      DataRow(cells: [
        DataCell(Text('Professor', style: GoogleFonts.comicNeue(fontSize: 13))),
        DataCell(Text('Profesor', style: GoogleFonts.comicNeue(fontSize: 13))),
        DataCell(
            Text('Profesorica', style: GoogleFonts.comicNeue(fontSize: 13))),
      ]),
      DataRow(cells: [
        DataCell(Text('Doctor', style: GoogleFonts.comicNeue(fontSize: 13))),
        DataCell(Text('Lječnik', style: GoogleFonts.comicNeue(fontSize: 13))),
        DataCell(Text('Lječnica', style: GoogleFonts.comicNeue(fontSize: 13))),
      ]),
      DataRow(cells: [
        DataCell(
            Text('Water/Waitress', style: GoogleFonts.comicNeue(fontSize: 13))),
        DataCell(Text('Konobar', style: GoogleFonts.comicNeue(fontSize: 13))),
        DataCell(
            Text('Konobarica', style: GoogleFonts.comicNeue(fontSize: 13))),
      ]),
      DataRow(cells: [
        DataCell(Text('Friend', style: GoogleFonts.comicNeue(fontSize: 13))),
        DataCell(Text('Prijatelj', style: GoogleFonts.comicNeue(fontSize: 13))),
        DataCell(
            Text('Prijateljica', style: GoogleFonts.comicNeue(fontSize: 13))),
      ]),
      DataRow(cells: [
        DataCell(Text('Student', style: GoogleFonts.comicNeue(fontSize: 13))),
        DataCell(Text('Student', style: GoogleFonts.comicNeue(fontSize: 13))),
        DataCell(
            Text('Studentica', style: GoogleFonts.comicNeue(fontSize: 13))),
      ]),
      DataRow(cells: [
        DataCell(Text('Collegue', style: GoogleFonts.comicNeue(fontSize: 13))),
        DataCell(Text('Kolega', style: GoogleFonts.comicNeue(fontSize: 13))),
        DataCell(Text('Kolegica', style: GoogleFonts.comicNeue(fontSize: 13))),
      ]),
      DataRow(cells: [
        DataCell(Text('Economist', style: GoogleFonts.comicNeue(fontSize: 12))),
        DataCell(Text('Ekonomist', style: GoogleFonts.comicNeue(fontSize: 12))),
        DataCell(
            Text('Ekonomistica', style: GoogleFonts.comicNeue(fontSize: 12))),
      ]),
      DataRow(cells: [
        DataCell(Text('Manager', style: GoogleFonts.comicNeue(fontSize: 13))),
        DataCell(Text('Menadžer', style: GoogleFonts.comicNeue(fontSize: 13))),
        DataCell(
            Text('Menadžerka', style: GoogleFonts.comicNeue(fontSize: 13))),
      ]),
      DataRow(cells: [
        DataCell(Text('Engineer', style: GoogleFonts.comicNeue(fontSize: 13))),
        DataCell(Text('Inženjer', style: GoogleFonts.comicNeue(fontSize: 13))),
        DataCell(
            Text('Inženjerka', style: GoogleFonts.comicNeue(fontSize: 13))),
      ]),
    ];
  }
}
