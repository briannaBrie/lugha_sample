import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lugha_sample/ui/views/numbers_screen.dart';

import '../widgets/export.dart';

class Possession extends StatefulWidget {
  const Possession({super.key});

  @override
  State<Possession> createState() => _PossessionState();
}

class _PossessionState extends State<Possession> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          'Pronouns',
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
                      'Posessive Pronouns',
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
                  'The posessive pronouns indicate ownership e.g \'Ovo je moja lopta\'\nIn the table below there is an indicator in the 1st, 2nd and 3rd person:It also determined by the gender of the noun which refering to e.g \'Njezin rođendan\'',
                  style: GoogleFonts.arima(fontSize: 15),
                ),
              ),
              Padding(
                padding:
                    //padding: const EdgeInsets.symmetric(horizontal: 12.0),
                    const EdgeInsets.symmetric(horizontal: 12.0, vertical: 13),
                child: Text(
                  'This can be triggered by the question \'Čiji/Čija/Čije\' '
                  'which is determined by the gender of the noun e.g \'Čiji je ovo mobitel?\'',
                  style: GoogleFonts.arima(fontSize: 15),
                ),
              ),
              Padding(
                padding:
                    //padding: const EdgeInsets.symmetric(horizontal: 12.0),
                    const EdgeInsets.symmetric(horizontal: 12.0, vertical: 13),
                child: Text(
                  'JEDNINA',
                  style: GoogleFonts.arima(
                      fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
              _dataTable(),

              Padding(
                padding:
                    //padding: const EdgeInsets.symmetric(horizontal: 12.0),
                    const EdgeInsets.symmetric(horizontal: 12.0, vertical: 13),
                child: Text(
                  'MNOŽINA',
                  style: GoogleFonts.arima(
                      fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
              _mnozinaTable(),
            ],
          ),
        ),
      ),
    );
  }

  DataTable _dataTable() {
    return DataTable(
      columns: _createColumns(),
      rows: _createRows(),
      dividerThickness: 2,
      dataRowHeight: 60,
      showBottomBorder: true,
      headingTextStyle:
          const TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
      headingRowColor:
          WidgetStateProperty.resolveWith((states) => const Color(0xFF83006A)),
    );
  }

  DataTable _mnozinaTable() {
    return DataTable(
      columns: _createColumns(),
      rows: _mnozinaRows(),
      dividerThickness: 2,
      dataRowHeight: 60,
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
          label: Text('Tko?', style: GoogleFonts.comicNeue(fontSize: 15))),
      DataColumn(
          label: Text(
        'M.R',
        style: GoogleFonts.comicNeue(
          fontSize: 15,
        ),
      )),
      DataColumn(
          label: Text('Ž.R', style: GoogleFonts.comicNeue(fontSize: 15))),
      DataColumn(
          label: Text('S.R', style: GoogleFonts.comicNeue(fontSize: 15))),
    ];
  }

  List<DataRow> _createRows() {
    return [
      DataRow(cells: [
        DataCell(Text('Ja', style: GoogleFonts.arima(fontSize: 12))),
        DataCell(Text('Moj', style: GoogleFonts.arima(fontSize: 12))),
        DataCell(Text('Moja', style: GoogleFonts.arima(fontSize: 12))),
        DataCell(Text('Moje', style: GoogleFonts.arima(fontSize: 12))),
      ]),
      DataRow(cells: [
        DataCell(Text('Ti', style: GoogleFonts.arima(fontSize: 12))),
        DataCell(Text('Tvoj', style: GoogleFonts.arima(fontSize: 12))),
        DataCell(Text('Tvoja', style: GoogleFonts.arima(fontSize: 12))),
        DataCell(Text('Tvoje', style: GoogleFonts.arima(fontSize: 12))),
      ]),
      DataRow(cells: [
        DataCell(Text('On/\nOno', style: GoogleFonts.arima(fontSize: 12))),
        DataCell(Text('Njegov', style: GoogleFonts.arima(fontSize: 12))),
        DataCell(Text('Njegova', style: GoogleFonts.arima(fontSize: 12))),
        DataCell(Text('Njegove', style: GoogleFonts.arima(fontSize: 12))),
      ]),
      DataRow(cells: [
        DataCell(Text('Ona', style: GoogleFonts.arima(fontSize: 12))),
        DataCell(Text('Njezin', style: GoogleFonts.arima(fontSize: 12))),
        DataCell(Text('Njezina', style: GoogleFonts.arima(fontSize: 12))),
        DataCell(Text('Njezine', style: GoogleFonts.arima(fontSize: 12))),
      ]),
      DataRow(cells: [
        DataCell(Text('Mi', style: GoogleFonts.arima(fontSize: 12))),
        DataCell(Text('Naš', style: GoogleFonts.arima(fontSize: 12))),
        DataCell(Text('Naša', style: GoogleFonts.arima(fontSize: 12))),
        DataCell(Text('Naše', style: GoogleFonts.arima(fontSize: 12))),
      ]),
      DataRow(cells: [
        DataCell(Text('Vi', style: GoogleFonts.arima(fontSize: 12))),
        DataCell(Text('Vaš', style: GoogleFonts.arima(fontSize: 12))),
        DataCell(Text('Vaša', style: GoogleFonts.arima(fontSize: 12))),
        DataCell(Text('Vaše', style: GoogleFonts.arima(fontSize: 12))),
      ]),
      DataRow(cells: [
        DataCell(
            Text('Oni/\nOne/\nOna', style: GoogleFonts.arima(fontSize: 12))),
        DataCell(Text('Njihov', style: GoogleFonts.arima(fontSize: 12))),
        DataCell(Text('Njihova', style: GoogleFonts.arima(fontSize: 12))),
        DataCell(Text('Njihove', style: GoogleFonts.arima(fontSize: 12))),
      ]),
    ];
  }

  List<DataRow> _mnozinaRows() {
    return [
      DataRow(cells: [
        DataCell(Text('Ja', style: GoogleFonts.arima(fontSize: 12))),
        DataCell(Text('Moji', style: GoogleFonts.arima(fontSize: 12))),
        DataCell(Text('Moje', style: GoogleFonts.arima(fontSize: 12))),
        DataCell(Text('Moja', style: GoogleFonts.arima(fontSize: 12))),
      ]),
      DataRow(cells: [
        DataCell(Text('Ti', style: GoogleFonts.arima(fontSize: 12))),
        DataCell(Text('Tvoji', style: GoogleFonts.arima(fontSize: 12))),
        DataCell(Text('Tvoje', style: GoogleFonts.arima(fontSize: 12))),
        DataCell(Text('Tvoja', style: GoogleFonts.arima(fontSize: 12))),
      ]),
      DataRow(cells: [
        DataCell(Text('On/\nOno', style: GoogleFonts.arima(fontSize: 12))),
        DataCell(Text('Njegovi', style: GoogleFonts.arima(fontSize: 12))),
        DataCell(Text('Njegove', style: GoogleFonts.arima(fontSize: 12))),
        DataCell(Text('Njegova', style: GoogleFonts.arima(fontSize: 12))),
      ]),
      DataRow(cells: [
        DataCell(Text('Ona', style: GoogleFonts.arima(fontSize: 12))),
        DataCell(Text('Njezini', style: GoogleFonts.arima(fontSize: 12))),
        DataCell(Text('Njezina', style: GoogleFonts.arima(fontSize: 12))),
        DataCell(Text('Njezine', style: GoogleFonts.arima(fontSize: 12))),
      ]),
      DataRow(cells: [
        DataCell(Text('Mi', style: GoogleFonts.arima(fontSize: 12))),
        DataCell(Text('Naši', style: GoogleFonts.arima(fontSize: 12))),
        DataCell(Text('Naše', style: GoogleFonts.arima(fontSize: 12))),
        DataCell(Text('Naša', style: GoogleFonts.arima(fontSize: 12))),
      ]),
      DataRow(cells: [
        DataCell(Text('Vi', style: GoogleFonts.arima(fontSize: 12))),
        DataCell(Text('Vaši', style: GoogleFonts.arima(fontSize: 12))),
        DataCell(Text('Vaše', style: GoogleFonts.arima(fontSize: 12))),
        DataCell(Text('Vaša', style: GoogleFonts.arima(fontSize: 12))),
      ]),
      DataRow(cells: [
        DataCell(
            Text('Oni/\nOne/\nOna', style: GoogleFonts.arima(fontSize: 12))),
        DataCell(Text('Njihovi', style: GoogleFonts.arima(fontSize: 12))),
        DataCell(Text('Njihove', style: GoogleFonts.arima(fontSize: 12))),
        DataCell(Text('Njihova', style: GoogleFonts.arima(fontSize: 12))),
      ]),
    ];
  }
}
