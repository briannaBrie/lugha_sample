import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lugha_sample/ui/views/not_done.dart';

import '../../widgets/export.dart';

class QuizPage extends StatefulWidget {
  const QuizPage({super.key});

  @override
  _QuizPageState createState() => _QuizPageState();
}

var cardAspectRatio = 1.0 / 1.0;
var widgetAspectRatio = cardAspectRatio * 1.2;

class _QuizPageState extends State<QuizPage> with TickerProviderStateMixin {
  final FixedExtentScrollController _controller =
      FixedExtentScrollController(initialItem: 1);
  @override
  Widget build(BuildContext context) {
    TabController tabController = TabController(length: 4, vsync: this);
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          'Quizzes',
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
              Container(
                height: size.height * 0.07,
                padding: const EdgeInsets.symmetric(horizontal: 12.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    reusableBoldText(
                      'Quizzes',
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
                            0xFF83006A, const NotDone()),
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
                // --------------------TAB BAR------------------
                child: Column(children: [
                  Align(
                      alignment: Alignment.centerLeft,
                      child: TabBar(
                          labelPadding:
                              const EdgeInsets.only(left: 7, right: 7),
                          controller: tabController,
                          labelColor: Colors.black,
                          labelStyle: GoogleFonts.comicNeue(
                              fontSize: 17, fontWeight: FontWeight.w600),
                          unselectedLabelColor: Colors.grey,
                          isScrollable: true,
                          indicatorSize: TabBarIndicatorSize.label,
                          indicator:
                              CircleTabIndicator(color: Colors.grey, radius: 4),
                          tabs: const [
                            Tab(
                              text: "Basics",
                            ),
                            Tab(
                              text: "Writting",
                            ),
                            Tab(
                              text: "Listening",
                            ),
                            Tab(
                              text: "Speaking",
                            ),
                          ])),

                  // --------------------TAB BARVIEW------------------
                  Container(
                      padding: const EdgeInsets.only(left: 20),
                      height: size.height * 0.45,
                      width: double.maxFinite,
                      child: TabBarView(
                        controller: tabController,
                        children: [
                          //--------Basics View----
                          const Text("Basics"),

                          //--------Writting View-----
                          const Text("Writting"),

                          //--------Listening View-----
                          const Text("Listening"),

                          ////-------Speaking View-----
                          const Text("Speaking"),
                        ],
                      )),
                ]),
              ),
            ],
          ),
        ),
      ),
    );
  }

  final int _selectedItemIndex = 0;
  var imgs = {
    "101.jpg": "Basics",
    "102.jpg": "Writting",
    "103.png": "Listening",
    "104.jpg": "Speaking"
  };
  final List _quizList = [
    'Coffee Shop',
    'Alphabet',
    'Greetings',
    'Numbers',
    'Word Genders',
    'Weather',
  ];
}

class CircleTabIndicator extends Decoration {
  final Color color;
  double radius;

  CircleTabIndicator({required this.color, required this.radius});
  @override
  BoxPainter createBoxPainter([VoidCallback? onChanged]) {
    return _CirclePainter(color: color, radius: radius);
  }
}

class _CirclePainter extends BoxPainter {
  final Color color;
  double radius;

  _CirclePainter({required this.color, required this.radius});
  @override
  void paint(Canvas canvas, Offset offset, ImageConfiguration configuration) {
    Paint paint = Paint();
    paint.color = color;
    paint.isAntiAlias = true;
    //to position the circle in the right position
    final Offset circleOffset = Offset(
        configuration.size!.width / 2 - radius / 2,
        configuration.size!.height - radius);

    canvas.drawCircle(offset + circleOffset, radius, paint);
  }
}
