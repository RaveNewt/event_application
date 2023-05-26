import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

double defaultMargin = 24.0;

Color primaryColor = Color(0xff4063F3);
Color dotsHover = const Color(0xffCDEDE2);
Color bglight = const Color(0xfffcfeff);
Color bgsecondary = Color.fromARGB(255, 86, 115, 234);
Color secondaryColor = Color(0xffE8906C);
Color dangerColor = Color(0xffD12659);
Color warningColor = Color(0xffD7D02C);
Color transparentColor = Colors.transparent;
Color blackColor = Color(0xff252525);
Color blackColor50 = Color(0x802B3347);
Color blackColor30 = Color(0x4D2B3347);
Color greyColor = Colors.grey;
Color whiteColor = const Color(0xffFFFFFF);

TextStyle primaryTextStyle = GoogleFonts.montserrat(
  color: primaryColor,
);
TextStyle subtitleTextStyle = GoogleFonts.montserrat(
  color: blackColor50,
);
TextStyle dangerTextStyle = GoogleFonts.montserrat(
  color: dangerColor,
);
TextStyle blackTextStyle = GoogleFonts.montserrat(
  color: blackColor,
);
TextStyle whiteTextStyle = GoogleFonts.montserrat(
  color: whiteColor,
);
TextStyle greyTextStyle = GoogleFonts.montserrat(
  color: greyColor,
);

FontWeight light = FontWeight.w300;
FontWeight regular = FontWeight.w400;
FontWeight medium = FontWeight.w500;
FontWeight semiBold = FontWeight.w600;
FontWeight bold = FontWeight.w700;
FontWeight superbold = FontWeight.w900;
