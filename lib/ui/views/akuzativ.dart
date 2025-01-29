import 'dart:math';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lugha_sample/ui/views/numbers_screen.dart';

import '../widgets/export.dart';

class Akuzativ extends StatefulWidget {
  const Akuzativ({super.key});

  @override
  _AkuzativState createState() => _AkuzativState();
}

var cardAspectRatio = 1.0 / 1.0;
var widgetAspectRatio = cardAspectRatio * 1.2;

class _AkuzativState extends State<Akuzativ> {
  var currentPage = akuzativ_images.length - 1.0;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    PageController controller = PageController(
        initialPage: akuzativ_images.length - 1, viewportFraction: 0.8);
    controller.addListener(() {
      setState(() {
        currentPage = controller.page!;
      });
    });
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          'Padež - Akuzativ',
          style: TextStyle(fontSize: 18),
        ),
        leading: IconButton(
          icon: const FaIcon(FontAwesomeIcons.chevronLeft),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        actions: const [],
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
              // --------Word of the Day-----

              Container(
                height: size.height * 0.07,
                padding: const EdgeInsets.symmetric(horizontal: 12.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    reusableBoldText(
                      'Akuzativ (Kamo?)',
                      0xFF000000,
                      18.5,
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
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Text(
                  'Akuzativ is the second padež that we are going to tackle.\nIt answers the question: Kamo?\n\nWords in Muški rod (-Ф) now transform to have the vowel(-a) at the end\n  -E.g Imam brataIf the noun is alive (Živo) the it transforms as shown above. However, if the noun is not alive(Ne Živo) doesn\'t transform at all.\n\nWords in Ženski rod (-a) now transform to have the vowel(-u) replace the vowel(-a)\n  -E.g Želim kavu\n\nWords in Srednji rod (-o/e) doesn\'t transform at all.\n  -E.g Ovo je od polja\n\n - Akuzativ is triggered by the question \'Kamo?\'\n - Akuzativ is triggered by the use of a verb before the noun:\n \t\t\t\t\t - e.g\'Idem na kavu\', \'Možete šečer\'',
                  style: GoogleFonts.arima(fontSize: 15),
                ),
              ),
              _dataTable(),
              Stack(
                children: <Widget>[
                  CardScrollWidget(currentPage),
                  Positioned.fill(
                    child: PageView.builder(
                      itemCount: akuzativ_images.length,
                      controller: controller,
                      reverse: true,
                      itemBuilder: (context, index) {
                        return Container();
                      },
                    ),
                  )
                ],
              ),
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

  List<DataColumn> _createColumns() {
    return [
      DataColumn(
          label: Text(
        'Muški -Ф',
        style: GoogleFonts.comicNeue(
          fontSize: 14,
        ),
      )),
      DataColumn(
          label: Text('Ženski -a', style: GoogleFonts.comicNeue(fontSize: 14))),
      DataColumn(
          label:
              Text('Srednji -o/e', style: GoogleFonts.comicNeue(fontSize: 14))),
    ];
  }

  List<DataRow> _createRows() {
    return [
      DataRow(cells: [
        DataCell(Text('Muž(ž)', style: GoogleFonts.arima(fontSize: 12))),
        DataCell(Text('Kava', style: GoogleFonts.arima(fontSize: 12))),
        DataCell(Text('Pecivo', style: GoogleFonts.arima(fontSize: 12))),
      ]),
      DataRow(cells: [
        DataCell(Text('Nema muža', style: GoogleFonts.arima(fontSize: 11.5))),
        DataCell(Text('Trebam kavu', style: GoogleFonts.arima(fontSize: 11.5))),
        DataCell(
            Text('Možete pecivo', style: GoogleFonts.arima(fontSize: 11.5))),
      ]),
      DataRow(cells: [
        DataCell(Text('Film(nž)', style: GoogleFonts.arima(fontSize: 12))),
        DataCell(Text('Skripta', style: GoogleFonts.arima(fontSize: 12))),
        DataCell(Text('More', style: GoogleFonts.arima(fontSize: 12))),
      ]),
      DataRow(cells: [
        DataCell(Text('Gleda film', style: GoogleFonts.arima(fontSize: 11.5))),
        DataCell(
            Text('Cita skriptu', style: GoogleFonts.arima(fontSize: 11.5))),
        DataCell(
            Text('Idemo na  more', style: GoogleFonts.arima(fontSize: 11.5))),
      ]),
    ];
  }
}

class CardScrollWidget extends StatelessWidget {
  final double currentPage;
  final double padding = 20.0;
  final double verticalInset = 20.0;
  //final GlobalKey _imageKey = GlobalKey();

  const CardScrollWidget(this.currentPage, {super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Directionality(
      textDirection: TextDirection.ltr,
      child: AspectRatio(
        aspectRatio: widgetAspectRatio,
        child: LayoutBuilder(builder: (context, contraints) {
          var width = contraints.maxWidth;
          var height = contraints.maxHeight;

          var safeWidth = width - 2 * padding;
          var safeHeight = height - 2 * padding;

          var heightOfPrimaryCard = safeHeight;
          var widthOfPrimaryCard = heightOfPrimaryCard * cardAspectRatio;

          var primaryCardLeft = safeWidth - widthOfPrimaryCard;
          var horizontalInset = primaryCardLeft / 3;

          List<Widget> cardList = [];

          for (var i = 0; i < akuzativ_images.length; i++) {
            var delta = i - currentPage;
            bool isOnRight = delta > 0;

            var start = padding +
                max(
                    0.0,
                    primaryCardLeft -
                        horizontalInset * -delta * (isOnRight ? 13 : 1));

            var cardItem = Positioned.directional(
              top: padding + verticalInset * max(-delta, 0.0),
              bottom: padding + verticalInset * max(-delta, 0.0),
              end: start,
              textDirection: TextDirection.ltr,
              child: Container(
                decoration: BoxDecoration(boxShadow: [
                  BoxShadow(
                      color: Colors.black.withOpacity(0.4),
                      offset: const Offset(3.0, 6.0),
                      blurRadius: 10.0)
                ]),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(16.0),
                  child: AspectRatio(
                    aspectRatio: cardAspectRatio,
                    child: Stack(
                      fit: StackFit.expand,
                      children: <Widget>[
                        Image.asset(
                          akuzativ_images[i],
                          fit: BoxFit.cover,
                        ),
                        Align(
                          alignment: Alignment.bottomRight,
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 16.0, vertical: 8.0),
                                child: Container(
                                  height: size.height * 0.07,
                                  width: size.width * 0.7,
                                  decoration: BoxDecoration(
                                      color: Colors.black45,
                                      borderRadius: BorderRadius.circular(20)),
                                  child: Center(
                                    child: Text(akuzativ[i],
                                        style: GoogleFonts.comicNeue(
                                            color: Colors.white,
                                            fontSize: 18.0,
                                            fontWeight: FontWeight.bold)),
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 10.0,
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            );
            cardList.add(cardItem);
          }
          return Stack(
            children: cardList,
          );
        }),
      ),
    );
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
