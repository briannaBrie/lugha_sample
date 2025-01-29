import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lugha_sample/ui/views/genetiv.dart';
import 'package:lugha_sample/ui/views/not_done.dart';
import 'package:lugha_sample/ui/views/professions.dart';
import 'package:lugha_sample/ui/views/pronouns.dart';

import '../../views/akuzativ.dart';
import '../../views/alphabet.dart';
import '../../views/ati_verb.dart';
import '../../views/export_view.dart';
import '../../views/genders.dart';
import '../../views/iti_verb.dart';
import '../../views/numbers_screen.dart';
import '../../views/weather.dart';
import '../../widgets/export.dart';
import 'export_pages.dart';

class Homescreen extends StatefulWidget {
  final String? email;
  const Homescreen({super.key, required this.email});

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  final FixedExtentScrollController _controller =
      FixedExtentScrollController(initialItem: 2);

  Widget getWidgetCode(int code) {
    switch (code) {
      case 0:
        return const Intro();
      case 1:
        return const Alphabet();
      case 3:
        return const NumberScreen();
      case 4:
        return const Gender();
      case 5:
        return const Weather();
      case 6:
        return const Genetiv();
      case 7:
        return const Professions();
      case 8:
        return const AtiVerb();
      case 9:
        return const Possession();
      case 10:
        return const ItiVerb();
      case 11:
        return const Akuzativ();
      default:
        return const NotDone();
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          color: Colors.white,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 50, 20, 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Hi ${widget.email},',
                    style: GoogleFonts.aclonica(
                        color: Colors.black.withOpacity(0.7),
                        fontWeight: FontWeight.w400,
                        fontSize: 25),
                  ),
                  Row(
                    children: [
                      IconButton(
                          onPressed: () {
                            if (kDebugMode) {
                              print('Info Icon Pressed');
                            }
                          },
                          icon: const FaIcon(
                            FontAwesomeIcons.solidQuestionCircle,
                            size: 27,
                          ),
                          color: Colors.black.withOpacity(0.7)
                          // color: const Color(0xFF83006A),
                          ),
                      IconButton(
                          onPressed: () {
                            if (kDebugMode) {
                              print('Info Icon Pressed');
                            }
                          },
                          icon: const FaIcon(
                            FontAwesomeIcons.powerOff,
                            size: 23,
                          ),
                          color: Colors.black.withOpacity(0.7)
                          // color: const Color(0xFF83006A),
                          ),
                    ],
                  ),
                ],
              ),
            ),
            // Second Row Start
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 10, 0, 10),
              child: Text(
                'Let\'s learn something new today.',
                style: GoogleFonts.arima(fontSize: 16),
              ),
            ),
            // --------Word of the Day-----
            WOD(size: size),
            // --------Word of the Day-----

            Container(
              height: size.height * 0.07,
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  reusableBoldText('Categories', 0xFF000000, 20),
                  Container(
                    decoration: BoxDecoration(
                        color: const Color(0xFFFFD4F2).withOpacity(0.45),
                        borderRadius: BorderRadius.circular(20)),
                    width: size.width * 0.25,
                    height: size.height * 0.05,
                    child: Align(
                      alignment: Alignment.center,
                      child: reusableClickableText(
                          context, "", 'View All', 0xFF83006A, const Courses()),
                    ),
                  ),
                ],
              ),
            ),

            // ----------------------------
            // ----ListWheelScrollView-----
            // ----------------------------
            Expanded(
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                width: double.infinity,
                child: ListWheelScrollView(
                  itemExtent: 100,
                  diameterRatio: 10,
                  offAxisFraction: 1.5,
                  controller: _controller,
                  clipBehavior: Clip.antiAlias,
                  onSelectedItemChanged: (int index) {
                    setState(() {
                      _selectedItemIndex = index;
                    });
                  },
                  children: _topics
                      .map(
                        (e) => Card(
                          color: _topics.indexOf(e) == _selectedItemIndex &&
                                  _topics.indexOf(e) % 2 == 0
                              ? const Color(0xFFAE5B9F)
                              : _topics.indexOf(e) == _selectedItemIndex &&
                                      _topics.indexOf(e) % 2 != 0
                                  ? const Color(0xFF6944A0)
                                  : _topics.indexOf(e) != _selectedItemIndex &&
                                          _topics.indexOf(e) % 2 == 0
                                      ? const Color(0xFFFFD4F2)
                                      : const Color(0xFFEED7FF),
                          child: GestureDetector(
                            onTap: () {
                              //navigate to the correct page from the scrollwheelListview.
                              Navigator.push(context, topicRoute(e));
                            },
                            child: Row(
                              children: [
                                Expanded(
                                  child: ListTile(
                                    title: Text(
                                      e,
                                      style: GoogleFonts.comicNeue(
                                          fontSize: 22,
                                          fontWeight: FontWeight.w900,
                                          color: _topics.indexOf(e) ==
                                                      _selectedItemIndex &&
                                                  _topics.indexOf(e) % 2 == 0
                                              ? const Color(0xFFFFD4F2)
                                              : _topics.indexOf(e) ==
                                                          _selectedItemIndex &&
                                                      _topics.indexOf(e) % 2 !=
                                                          0
                                                  ? const Color(0xFFEED7FF)
                                                  : _topics.indexOf(e) !=
                                                              _selectedItemIndex &&
                                                          _topics.indexOf(e) %
                                                                  2 ==
                                                              0
                                                      ? const Color(0xFFAE5B9F)
                                                      : const Color(
                                                          0xFF6944A0)),
                                    ),
                                    subtitle: Text(
                                      '"Art is not a thing: it\'s a way."',
                                      style: GoogleFonts.arima(
                                        fontWeight: FontWeight.w400,
                                        color: _topics.indexOf(e) ==
                                                _selectedItemIndex
                                            ? Colors.white
                                            : Colors.black,
                                      ),
                                    ),
                                  ),
                                ),
                                Container(
                                  width: size.width * 0.15,
                                  height: double.infinity,
                                  padding:
                                      const EdgeInsets.symmetric(horizontal: 8),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(12),
                                      image: const DecorationImage(
                                          image: AssetImage(
                                              'assets/images/courses/reading.png'),
                                          fit: BoxFit.cover)),
                                ),
                              ],
                            ),
                          ),
                        ),
                      )
                      .toList(),
                ),
              ),
            )
            // ----------------------------
            // ----ListWheelScrollView-----
            // ----------------------------
          ],
        ),
      ),
    );
  }

  PageRouteBuilder<dynamic> topicRoute(e) {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) =>
          getWidgetCode(_topics.indexOf(e)),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        var begin = const Offset(1.0, 0.0);
        var end = Offset.zero;
        var curve = Curves.ease;
        var tween =
            Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
        return SlideTransition(
          position: animation.drive(tween),
          child: child,
        );
      },
    );
  }

  int _selectedItemIndex = 0;
  final List _topics = [
    'Introductions',
    'Alphabet',
    'Greetings',
    'Numbers',
    'Word Genders',
    'Weather',
    'Padež - Genetiv',
    'Professions',
    'Verbs -ati',
    'Posessive Pronouns',
    'Verbs -iti',
    'Padež - Akuzativ',
    'Family Tree',
    'Padež - Lokativ',
    'Verbs exceptions',
    'Verbs -jeti',
    'Verbs -ovati',
  ];
}
