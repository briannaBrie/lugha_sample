import 'dart:math';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

import '../widgets/export.dart';
import 'numbers_screen.dart';

class AtiVerb extends StatefulWidget {
  const AtiVerb({super.key});

  @override
  _AtiVerbState createState() => _AtiVerbState();
}

var cardAspectRatio = 1.0 / 1.0;
var widgetAspectRatio = cardAspectRatio * 1.2;

class _AtiVerbState extends State<AtiVerb> {
  var currentPage = ati_images.length - 1.0;
  var currentPage2 = neati_images.length - 1.0;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    PageController controller = PageController(
        initialPage: ati_images.length - 1, viewportFraction: 0.8);
    controller.addListener(() {
      setState(() {
        currentPage = controller.page!;
      });
    });
    PageController controller2 = PageController(
        initialPage: neati_images.length - 1, viewportFraction: 0.8);
    controller2.addListener(() {
      setState(() {
        currentPage2 = controller2.page!;
      });
    });
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          'Glagol - Ati',
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
              // --------Word of the Day-----

              Container(
                height: size.height * 0.07,
                padding: const EdgeInsets.symmetric(horizontal: 12.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    reusableBoldText(
                      'Glagol -ati',
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
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Text(
                  'Most verbs belong to one of several groups of regular verbs.\nThe first group of regular verbs is the -ati group. This is a group characterized by:\n \t- Ending in -ati\n \t- E.g Imati, Šetati, Gledati, Plivati, Svirati, etc\n \t- The verbs behave as shown below:',
                  style: GoogleFonts.arima(fontSize: 15),
                ),
              ),
              _dataTable(),

              Stack(
                children: <Widget>[
                  CardScrollWidget(currentPage),
                  Positioned.fill(
                    child: PageView.builder(
                      itemCount: ati_images.length,
                      controller: controller,
                      reverse: true,
                      itemBuilder: (context, index) {
                        return Container();
                      },
                    ),
                  )
                ],
              ),

              // --------Ne -ati-----
              Container(
                height: size.height * 0.07,
                padding: const EdgeInsets.symmetric(horizontal: 12.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    reusableBoldText(
                      'Glagol ne -ati',
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
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Text(
                  'The -ati group can also be negated.\n \t- To negate this you add the \'ne\' key word infront of verb\n \t- E.g nemati, ne šetati, ne gledati, ne plivati, ne svirati, etc.\n \t- The verbs behave as shown below:',
                  style: GoogleFonts.arima(fontSize: 15),
                ),
              ),
              _neAtiTable(),

              Stack(
                children: <Widget>[
                  NeAtiCard(currentPage2),
                  Positioned.fill(
                    child: PageView.builder(
                      itemCount: neati_images.length,
                      controller: controller2,
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

  DataTable _neAtiTable() {
    return DataTable(
      columns: _createColumns(),
      rows: _neAtiRows(),
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
        DataCell(Text('Imam', style: GoogleFonts.arima(fontSize: 15))),
        DataCell(Text('Imamo', style: GoogleFonts.arima(fontSize: 15))),
      ]),
      DataRow(cells: [
        DataCell(Text('Ti/Vi', style: GoogleFonts.arima(fontSize: 15))),
        DataCell(Text('Imaš', style: GoogleFonts.arima(fontSize: 15))),
        DataCell(Text('Imate', style: GoogleFonts.arima(fontSize: 15))),
      ]),
      DataRow(cells: [
        DataCell(Text('On,Ona,Ono/Oni,One, Ona',
            style: GoogleFonts.arima(fontSize: 15))),
        DataCell(Text('Ima', style: GoogleFonts.arima(fontSize: 15))),
        DataCell(Text('Imaju', style: GoogleFonts.arima(fontSize: 15))),
      ]),
    ];
  }

  List<DataRow> _neAtiRows() {
    return [
      DataRow(cells: [
        DataCell(Text('Ja/Mi', style: GoogleFonts.arima(fontSize: 15))),
        DataCell(Text('Nemam', style: GoogleFonts.arima(fontSize: 15))),
        DataCell(Text('Nemamo', style: GoogleFonts.arima(fontSize: 15))),
      ]),
      DataRow(cells: [
        DataCell(Text('Ti/Vi', style: GoogleFonts.arima(fontSize: 15))),
        DataCell(Text('Nemaš', style: GoogleFonts.arima(fontSize: 15))),
        DataCell(Text('Nemate', style: GoogleFonts.arima(fontSize: 15))),
      ]),
      DataRow(cells: [
        DataCell(Text('On,Ona,Ono/Oni,One, Ona',
            style: GoogleFonts.arima(fontSize: 15))),
        DataCell(Text('Nema', style: GoogleFonts.arima(fontSize: 15))),
        DataCell(Text('Nemaju', style: GoogleFonts.arima(fontSize: 15))),
      ]),
    ];
  }
}

class CardScrollWidget extends StatelessWidget {
  final double currentPage;
  final double padding = 20.0;
  final double verticalInset = 20.0;
  // final GlobalKey _imageKey = GlobalKey();

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

          for (var i = 0; i < ati_images.length; i++) {
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
                          ati_images[i],
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
                                    child: Text(ati_verb[i],
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

class NeAtiCard extends StatelessWidget {
  final double currentPage2;
  final double padding = 20.0;
  final double verticalInset = 20.0;
  //final GlobalKey _imageKey = GlobalKey();

  const NeAtiCard(this.currentPage2, {super.key});

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

          for (var i = 0; i < ati_images.length; i++) {
            var delta = i - currentPage2;
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
                          neati_images[i],
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
                                    child: Text(neati[i],
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
