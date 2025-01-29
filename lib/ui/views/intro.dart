import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

import '../widgets/export.dart';
import 'numbers_screen.dart';

class Intro extends StatefulWidget {
  const Intro({super.key});

  @override
  _IntroState createState() => _IntroState();
}

var cardAspectRatio = 1.0 / 1.0;
var widgetAspectRatio = cardAspectRatio * 1.2;

class _IntroState extends State<Intro> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          'Introductions',
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
      // backgroundColor: Color(0xff2d3447),
      body: SingleChildScrollView(
        child: Container(
          // height: size.height,
          // width: size.height,
          padding: const EdgeInsets.symmetric(vertical: 5),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // --------Word of the Day-----
              WOD(size: size),
              // --------Word of the Day-----

              Container(
                height: size.height * 0.07,
                padding: const EdgeInsets.symmetric(horizontal: 12.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    reusableBoldText(
                      'Glagol - Znati se',
                      0xFF000000,
                      20,
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

              Container(
                height: size.height * 0.09,
                //padding: const EdgeInsets.symmetric(horizontal: 12.0),
                padding: const EdgeInsets.fromLTRB(20, 20, 12, 5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    reusableBoldText(
                      'Glagol - biti',
                      0xFF000000,
                      20,
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
                  'Biti is a verb that is used in 3 different ways: \n- To introduce yourself (Ime) E.g Ja sam Ana\n- To describe/inquire about your state (Raspoloženje) E.g One su dobro?\n- To describe your profession (Profesija) E.g Ti si konobarica',
                  style: GoogleFonts.arima(fontSize: 15),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 8.0, vertical: 13),
                child: Text(
                  'For more information on how to use biti refer to the table',
                  style: GoogleFonts.arima(fontSize: 15),
                ),
              ),

              _bitiTable(),

              Container(
                height: size.height * 0.09,
                padding: const EdgeInsets.fromLTRB(20, 20, 12, 5),
                //padding: const EdgeInsets.fromLTRB(20, 20, 0, 5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    reusableBoldText(
                      'Glagol - ne biti',
                      0xFF000000,
                      20,
                    ),
                    SizedBox(height: size.height * 0.01),
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
                  'Ne biti is a verb that is used to negate in 3 different ways: \n- To introduce yourself E.g Nisam Ana\n- To describe your state E.g One nisu dobro\n- To describe your profession E.g Niste Konobarica, Vi ste Ekonimistica',
                  style: GoogleFonts.arima(fontSize: 15),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 8.0, vertical: 13),
                child: Text(
                  'For more information on how to use Ne Biti refer to the table',
                  style: GoogleFonts.arima(fontSize: 15),
                ),
              ),

              _neBitiTable(),

              Container(
                height: size.height * 0.09,
                padding: const EdgeInsets.fromLTRB(20, 20, 12, 5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    reusableBoldText(
                      'Glagol - Biti Dugi Oblik',
                      0xFF000000,
                      20,
                    ),
                    SizedBox(height: size.height * 0.01),
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
                  'This is used to ask questions with the biti is the first word in the question\n \t- It is followed by the word li\n \t E.g Jeste li Vi studentice?',
                  style: GoogleFonts.arima(fontSize: 15),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 8.0, vertical: 13),
                child: Text(
                  'For more information on how to use Biti - Dugi Oblik, refer to the table',
                  style: GoogleFonts.arima(fontSize: 15),
                ),
              ),

              _dugiBitiTable(),
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
      dataRowHeight: 70,
      showBottomBorder: true,
      headingTextStyle:
          const TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
      headingRowColor:
          WidgetStateProperty.resolveWith((states) => const Color(0xFF83006A)),
    );
  }

  DataTable _bitiTable() {
    return DataTable(
      columns: _createColumns(),
      rows: _bitiCreateRows(),
      dividerThickness: 2,
      dataRowHeight: 70,
      showBottomBorder: true,
      headingTextStyle:
          const TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
      headingRowColor:
          WidgetStateProperty.resolveWith((states) => const Color(0xFF83006A)),
    );
  }

  DataTable _neBitiTable() {
    return DataTable(
      columns: _createColumns(),
      rows: _neBitiCreateRows(),
      dividerThickness: 2,
      dataRowHeight: 70,
      showBottomBorder: true,
      headingTextStyle:
          const TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
      headingRowColor:
          WidgetStateProperty.resolveWith((states) => const Color(0xFF83006A)),
    );
  }

  DataTable _dugiBitiTable() {
    return DataTable(
      columns: _createColumns(),
      rows: _dugiBitiCreateRows(),
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
          label: Text('Tko?', style: GoogleFonts.comicNeue(fontSize: 16))),
      DataColumn(
          label: Text(
        'Jednina',
        style: GoogleFonts.comicNeue(fontSize: 16, fontWeight: FontWeight.bold),
      )),
      DataColumn(
          label: Text('Množina',
              style: GoogleFonts.comicNeue(
                  fontSize: 16, fontWeight: FontWeight.bold))),
    ];
  }

  List<DataRow> _createRows() {
    return [
      DataRow(cells: [
        DataCell(Text('Ja/Mi', style: GoogleFonts.arima(fontSize: 15))),
        DataCell(Text('Zovem se', style: GoogleFonts.arima(fontSize: 15))),
        DataCell(Text('Zovemo se', style: GoogleFonts.arima(fontSize: 15))),
      ]),
      DataRow(cells: [
        DataCell(Text('Ti/Vi', style: GoogleFonts.arima(fontSize: 15))),
        DataCell(Text('Zoveš se', style: GoogleFonts.arima(fontSize: 15))),
        DataCell(Text('Zovete se', style: GoogleFonts.arima(fontSize: 15))),
        // DataCell(Text('More', style: GoogleFonts.arima(fontSize: 15))),
      ]),
      DataRow(cells: [
        DataCell(Text('On,Ona,Ono/Oni,One, Ona',
            style: GoogleFonts.arima(fontSize: 15))),
        DataCell(Text('Zove se', style: GoogleFonts.arima(fontSize: 15))),
        DataCell(Text('Zovu se', style: GoogleFonts.arima(fontSize: 15))),
        // DataCell(Text('Pivo', style: GoogleFonts.arima(fontSize: 15))),
      ]),
    ];
  }

  List<DataRow> _bitiCreateRows() {
    return [
      DataRow(cells: [
        DataCell(Text('Ja/Mi', style: GoogleFonts.arima(fontSize: 15))),
        DataCell(Text('Ja sam', style: GoogleFonts.arima(fontSize: 15))),
        DataCell(Text('Mi smo', style: GoogleFonts.arima(fontSize: 15))),
      ]),
      DataRow(cells: [
        DataCell(Text('Ti/Vi', style: GoogleFonts.arima(fontSize: 15))),
        DataCell(Text('Ti si', style: GoogleFonts.arima(fontSize: 15))),
        DataCell(Text('Vi ste', style: GoogleFonts.arima(fontSize: 15))),
        // DataCell(Text('More', style: GoogleFonts.arima(fontSize: 15))),
      ]),
      DataRow(cells: [
        DataCell(Text('On,Ona,Ono/\nOni,One,Ona',
            style: GoogleFonts.arima(fontSize: 15))),
        DataCell(Text('On/Ona/Ono je', style: GoogleFonts.arima(fontSize: 15))),
        DataCell(
            Text('Oni/One/Ona su', style: GoogleFonts.arima(fontSize: 15))),
        // DataCell(Text('Pivo', style: GoogleFonts.arima(fontSize: 15))),
      ]),
    ];
  }

  List<DataRow> _neBitiCreateRows() {
    return [
      DataRow(cells: [
        DataCell(Text('Ja/Mi', style: GoogleFonts.arima(fontSize: 15))),
        DataCell(Text('Nisam', style: GoogleFonts.arima(fontSize: 15))),
        DataCell(Text('Nismo', style: GoogleFonts.arima(fontSize: 15))),
      ]),
      DataRow(cells: [
        DataCell(Text('Ti/Vi', style: GoogleFonts.arima(fontSize: 15))),
        DataCell(Text('Nisi', style: GoogleFonts.arima(fontSize: 15))),
        DataCell(Text('Niste', style: GoogleFonts.arima(fontSize: 15))),
        // DataCell(Text('More', style: GoogleFonts.arima(fontSize: 15))),
      ]),
      DataRow(cells: [
        DataCell(Text('On,Ona,Ono/\nOni,One,Ona',
            style: GoogleFonts.arima(fontSize: 15))),
        DataCell(Text('Nije', style: GoogleFonts.arima(fontSize: 14))),
        DataCell(Text('Nisu', style: GoogleFonts.arima(fontSize: 14))),
        // DataCell(Text('Pivo', style: GoogleFonts.arima(fontSize: 15))),
      ]),
    ];
  }

  List<DataRow> _dugiBitiCreateRows() {
    return [
      DataRow(cells: [
        DataCell(Text('Ja/Mi', style: GoogleFonts.arima(fontSize: 15))),
        DataCell(Text('Jesam', style: GoogleFonts.arima(fontSize: 15))),
        DataCell(Text('Jesmo', style: GoogleFonts.arima(fontSize: 15))),
      ]),
      DataRow(cells: [
        DataCell(Text('Ti/Vi', style: GoogleFonts.arima(fontSize: 15))),
        DataCell(Text('Jesi', style: GoogleFonts.arima(fontSize: 15))),
        DataCell(Text('Jeste', style: GoogleFonts.arima(fontSize: 15))),
        // DataCell(Text('More', style: GoogleFonts.arima(fontSize: 15))),
      ]),
      DataRow(cells: [
        DataCell(Text('On,Ona,Ono/\nOni,One,Ona',
            style: GoogleFonts.arima(fontSize: 15))),
        DataCell(Text('Je(st)', style: GoogleFonts.arima(fontSize: 14))),
        DataCell(Text('Jesu', style: GoogleFonts.arima(fontSize: 14))),
        // DataCell(Text('Pivo', style: GoogleFonts.arima(fontSize: 15))),
      ]),
    ];
  }
}

class ParallaxFlowDelegate extends FlowDelegate {
  ParallaxFlowDelegate({
    required this.scrollable,
    required this.listItemContext,
    required this.backgroundImageKey,
  }) : super(repaint: scrollable.position);

  final ScrollableState scrollable;
  final BuildContext listItemContext;
  final GlobalKey backgroundImageKey;

  @override
  BoxConstraints getConstraintsForChild(int i, BoxConstraints constraints) {
    return BoxConstraints.tightFor(
      height: constraints.maxHeight,
    );
  }

  @override
  void paintChildren(FlowPaintingContext context) {
    // Calculate the position of this list item within the viewport.
    final scrollableBox = scrollable.context.findRenderObject() as RenderBox;
    final listItemBox = listItemContext.findRenderObject() as RenderBox;
    final listItemOffset = listItemBox.localToGlobal(
      listItemBox.size.topCenter(Offset.zero),
      ancestor: scrollableBox,
    );

    // Determine the percent position of this list item within the
    // scrollable area.
    final viewportDimension = scrollable.position.viewportDimension;
    final scrollFraction =
        (listItemOffset.dx / viewportDimension).clamp(0.0, 1.0);

    // Calculate the horizontal alignment of the background
    // based on the scroll percent.
    final horizontalAlignment = Alignment(scrollFraction * 2 - 1, 0);

    // Convert the background alignment into a pixel offset for
    // painting purposes.
    final backgroundSize =
        (backgroundImageKey.currentContext!.findRenderObject() as RenderBox)
            .size;
    final listItemSize = context.size;
    final childRect = horizontalAlignment.inscribe(
      backgroundSize,
      Offset.zero & listItemSize,
    );

    // Paint the background.
    context.paintChild(
      0,
      transform:
          Transform.translate(offset: Offset(childRect.left, 0)).transform,
    );
  }

  @override
  bool shouldRepaint(ParallaxFlowDelegate oldDelegate) {
    return scrollable != oldDelegate.scrollable ||
        listItemContext != oldDelegate.listItemContext ||
        backgroundImageKey != oldDelegate.backgroundImageKey;
  }
}
