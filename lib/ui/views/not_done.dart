import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

import '../widgets/export.dart';
import 'numbers_screen.dart';

class NotDone extends StatefulWidget {
  const NotDone({super.key});

  @override
  _NotDoneState createState() => _NotDoneState();
}

var cardAspectRatio = 1.0 / 1.0;
var widgetAspectRatio = cardAspectRatio * 1.2;

class _NotDoneState extends State<NotDone> {
  var currentPage = ati_images.length - 1.0;
  var currentPage2 = neati_images.length - 1.0;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          'TBD',
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
                      'TBD',
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
                  'This page is To be Developed(TBD)',
                  style: GoogleFonts.arima(fontSize: 15),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
