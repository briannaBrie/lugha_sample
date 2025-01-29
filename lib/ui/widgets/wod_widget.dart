import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../utils/color_utils.dart';
import 'export.dart';

class WOD extends StatelessWidget {
  const WOD({
    super.key,
    required this.size,
  });

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Container(
            width: double.infinity,
            height: size.height * 0.2,
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(Radius.circular(20)),
              // color: Color((0xFFAE5B9F))
              gradient: LinearGradient(colors: [
                hexStringToColor("FEC26C"),
                hexStringToColor("BE396F"),
                hexStringToColor("83006A"),
              ]),
            ),
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(
                            width: size.width * 0.1,
                          ),
                          const Text(
                            'Word of the Day',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.bold),
                          ),
                          const Spacer(),
                        ],
                      ),
                      const Spacer(),
                      Row(
                        children: [
                          const Spacer(),
                          Text(
                            'Nedostajati',
                            softWrap: true,
                            style: GoogleFonts.aclonica(
                                color: const Color(0xFFFFD4F2),
                                fontWeight: FontWeight.w400,
                                fontSize: 17),
                          ),
                          const Spacer(),
                        ],
                      ),
                      Row(
                        children: [
                          const Spacer(),
                          Text(
                            'To miss someone/something',
                            softWrap: true,
                            style: GoogleFonts.arima(
                                color: Colors.white,
                                fontWeight: FontWeight.w400,
                                fontSize: 14),
                          ),
                          const Spacer(),
                        ],
                      ),
                      const Spacer(),
                      // SizedBox(
                      //   height: size.height * 0.01,
                      // ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Spacer(),
                          Container(
                            height: size.height * 0.05,
                            width: size.width * 0.4,
                            decoration: BoxDecoration(
                                color: Colors.white.withOpacity(0.45),
                                borderRadius: BorderRadius.circular(20)),
                            child: Center(
                              child: reusableModalClickableText(
                                context,
                                'More. . .',
                                0xFF83006A,
                                // 0xFFFFD4F2,
                                // 0xFFFFFFFF,
                                // 0xFFFEC26C,
                                17,
                              ),
                            ),
                          ),
                          const Spacer(),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            bottom: 0,
            child: ClipRRect(
              borderRadius:
                  const BorderRadius.only(bottomLeft: Radius.circular(20)),
              child: SvgPicture.asset(
                "assets/icons/bubbles.svg",
                height: 88, width: 80,
                // theme: const SvgTheme(
                //   currentColor: Color(0xFF83006A),
                // ),
                color: const Color(0xFF83006A),
              ),
            ),
          ),
          Positioned(
            top: 0,
            right: 0,
            child: ClipRRect(
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(20),
                topRight: Radius.circular(20),
              ),
              child: Transform(
                alignment: FractionalOffset.center,
                transform: Matrix4.rotationZ(3.1415926535897932 / 1),
                child: SvgPicture.asset(
                  "assets/icons/bubbles.svg",
                  height: 88, width: 0,
                  color: const Color(0xFFFEC26C),
                  //theme: const SvgTheme(currentColor: Color(0xFFFEC26C)),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
