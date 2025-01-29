import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Image logoWidget(String imageName) {
  return Image.asset(
    imageName,
    fit: BoxFit.fitWidth,
    width: 200,
    height: 200,
    color: Colors.white,
  );
}

TextField reusableTextField(String text, IconData icon, bool isPasswordType,
    TextEditingController controller) {
  return TextField(
    controller: controller,
    obscureText: isPasswordType,
    enableSuggestions: isPasswordType,
    autocorrect: isPasswordType,
    cursorColor: Colors.white,
    style: TextStyle(color: Colors.white.withOpacity(0.9)),
    decoration: InputDecoration(
        prefixIcon: Icon(
          icon,
          color: Colors.white70,
        ),
        labelText: text,
        labelStyle: TextStyle(color: Colors.white.withOpacity(0.9)),
        filled: true,
        floatingLabelBehavior: FloatingLabelBehavior.never,
        fillColor: Colors.white.withOpacity(0.3),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: const BorderSide(width: 0, style: BorderStyle.none),
        )),
    keyboardType: isPasswordType
        ? TextInputType.visiblePassword
        : TextInputType.emailAddress,
  );
}

Container reusableButton(BuildContext context, String btnText, Function onTap) {
  return Container(
    width: MediaQuery.of(context).size.width * 0.9,
    height: 70,
    margin: const EdgeInsets.fromLTRB(0, 10, 0, 20),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(90),
    ),
    child: ElevatedButton(
      onPressed: () {
        onTap;
      },
      style: ButtonStyle(
          backgroundColor: WidgetStateProperty.resolveWith((states) {
            if (states.contains(WidgetState.pressed)) {
              return Colors.black26;
            }
            return Colors.white.withOpacity(0.87);
          }),
          shape: WidgetStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(60)))),
      child: Text(
        btnText,
        style: const TextStyle(
            color: Colors.black87, fontWeight: FontWeight.bold, fontSize: 19),
      ),
    ),
  );
}

Row reusableClickableText(BuildContext context, String qstn, String actionText,
    int setColor, Widget widget) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Text(
        qstn,
        style: const TextStyle(color: Colors.white70),
      ),
      const SizedBox(
        width: 10,
      ),
      GestureDetector(
        onTap: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => widget));
        },
        child: Text(
          actionText,
          style: TextStyle(color: Color(setColor), fontWeight: FontWeight.bold),
        ),
      ),
    ],
  );
}

Row reusableBoldText(String actionText, int setColor, double fontSize) {
  //Size size = MediaQuery.of(context).size;
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Text(
        actionText,
        style: GoogleFonts.comicNeue(
            color: Color(setColor),
            fontWeight: FontWeight.w700,
            fontSize: fontSize),
        overflow: TextOverflow.ellipsis,
      ),
    ],
  );
}

Row reusableSingleClickableText(BuildContext context, String actionText,
    int setColor, double fontSize, Function widget) {
  //Size size = MediaQuery.of(context).size;
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      GestureDetector(
        onTap: () {
          widget;
        },
        child: Text(
          actionText,
          style: TextStyle(
              color: Color(setColor),
              fontWeight: FontWeight.bold,
              fontSize: fontSize),
        ),
      ),
    ],
  );
}

Row reusableModalClickableText(
    BuildContext context, String actionText, int setColor, double fontSize) {
  Size size = MediaQuery.of(context).size;
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      GestureDetector(
        onTap: () {
          reusableDialog(context, size);
          //reusable_modal(context, size);
        },
        child: Text(
          actionText,
          style: GoogleFonts.aclonica(
            color: Color(setColor),
            fontSize: fontSize,
          ),
        ),
      ),
    ],
  );
}

Future<dynamic> reusableModal(BuildContext context, Size size) {
  return showModalBottomSheet(
      context: context,
      barrierColor: Colors.transparent,
      backgroundColor: const Color(0xFFFFF0FA).withOpacity(0.7),
      // backgroundColor: Colors.transparent,
      builder: (context) {
        return Container(
          margin: const EdgeInsets.all(8),
          child: ClipRRect(
            borderRadius: const BorderRadius.all(Radius.circular(20)),
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 20, sigmaY: 20),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white12,
                  border: Border.all(width: 0.5, color: Colors.black26),
                  borderRadius: const BorderRadius.all(Radius.circular(
                    20,
                  )),
                ),
                child: Column(
                  children: [
                    Center(
                      child: FractionallySizedBox(
                        widthFactor: 0.25,
                        child: Container(
                          margin: const EdgeInsets.symmetric(vertical: 8),
                          height: 4,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(2),
                              border: Border.all(
                                  color: Colors.black12, width: 0.5)),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        alignment: Alignment.center,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              RichText(
                                  text: TextSpan(
                                      text: 'Nedostajati,',
                                      style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black,
                                          fontSize: 17),
                                      children: [
                                    TextSpan(
                                        text:
                                            ' (infinite verb) \n \tto miss someone.',
                                        style: DefaultTextStyle.of(context)
                                            .style
                                            .copyWith(fontSize: 15))
                                  ])),
                              const Divider(
                                color: Color(0xFFAE5B9F),
                              ),
                              SizedBox(height: size.height * 0.02),
                              const Text("Example:",
                                  style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold)),
                              SizedBox(height: size.height * 0.01),
                              RichText(
                                  text: TextSpan(
                                      text: 'Nedostajaš mi,',
                                      style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black,
                                          fontSize: 17),
                                      children: [
                                    TextSpan(
                                        text: ' means I miss you.',
                                        style: DefaultTextStyle.of(context)
                                            .style
                                            .copyWith(fontSize: 15))
                                  ])),
                              SizedBox(height: size.height * 0.02),
                              const Text("Response:",
                                  style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold)),
                              RichText(
                                  text: TextSpan(
                                      text: 'I meni',
                                      style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black,
                                          fontSize: 17),
                                      children: [
                                    TextSpan(
                                        text: ' means me too.',
                                        style: DefaultTextStyle.of(context)
                                            .style
                                            .copyWith(fontSize: 15))
                                  ])),
                            ],
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        );
      });
}

Future<dynamic> reusableDialog(BuildContext context, Size size) {
  return showDialog(
      context: context,
      barrierDismissible: false,
      barrierColor: Colors.transparent,
      builder: (BuildContext context) {
        return Container(
          height: size.height * 0.02,
          width: double.infinity,
          margin: const EdgeInsets.all(8),
          child: ClipRRect(
            borderRadius: const BorderRadius.all(Radius.circular(20)),
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 20, sigmaY: 20),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white12,
                  border: Border.all(width: 0.5, color: Colors.black26),
                  borderRadius: const BorderRadius.all(Radius.circular(
                    20,
                  )),
                ),
                child: AlertDialog.adaptive(
                  backgroundColor: const Color(0xFFFFF0FA),
                  title: const Text('Word of the Day',
                      style:
                          TextStyle(fontSize: 21, fontWeight: FontWeight.bold)),
                  content: SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          RichText(
                              text: TextSpan(
                                  text: 'Nedostajati,',
                                  style: GoogleFonts.arima(
                                      color: const Color(0xFFAE5B9F),
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20),
                                  children: [
                                TextSpan(
                                    text:
                                        ' (infinite verb) \n \tto miss someone.',
                                    style: GoogleFonts.arima(
                                        fontSize: 15, color: Colors.black)
                                    // style: DefaultTextStyle.of(context)
                                    //     .style
                                    //     .copyWith(fontSize: 15),
                                    ),
                              ])),
                          const Divider(
                            color: Color(0xFFAE5B9F),
                          ),
                          SizedBox(height: size.height * 0.02),
                          Text(
                            "Example:",
                            style: GoogleFonts.arima(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 20),
                            // style: TextStyle(
                            //     fontSize: 15, fontWeight: FontWeight.bold)
                          ),
                          SizedBox(height: size.height * 0.01),
                          RichText(
                              text: TextSpan(
                                  text: 'Nedostajaš mi,',
                                  style: GoogleFonts.arima(
                                      color: const Color(0xFFAE5B9F),
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18),
                                  // style: const TextStyle(
                                  //     fontWeight: FontWeight.bold,
                                  //     color: Colors.black,
                                  //     fontSize: 17),
                                  children: [
                                TextSpan(
                                    text: ' means I miss you.',
                                    style: GoogleFonts.arima(
                                        fontSize: 15, color: Colors.black)
                                    // style: DefaultTextStyle.of(context)
                                    //     .style
                                    //     .copyWith(fontSize: 15),
                                    ),
                              ])),
                          SizedBox(height: size.height * 0.02),
                          Text(
                            "Response:",
                            style: GoogleFonts.arima(
                                color: Colors.black,
                                // color: const Color(0xFFAE5B9F),
                                fontWeight: FontWeight.bold,
                                fontSize: 20),
                          ),
                          RichText(
                              text: TextSpan(
                                  text: 'I meni,',
                                  style: GoogleFonts.arima(
                                      color: const Color(0xFFAE5B9F),
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18),
                                  children: [
                                TextSpan(
                                    text: ' means me too.',
                                    style: GoogleFonts.arima(
                                        fontSize: 15, color: Colors.black)),
                              ])),
                        ],
                      ),
                    ),
                  ),
                  actions: [
                    Center(
                      child: FloatingActionButton(
                        backgroundColor: const Color(0xFFAE5B9F),
                        child: const Text('OK',
                            style: TextStyle(
                                fontSize: 20, color: Color(0xFFFFD4F2))),
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        );
      });
}
