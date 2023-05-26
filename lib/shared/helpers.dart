import 'dart:io';

import 'package:another_flushbar/flushbar.dart';
import 'package:event_application/shared/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';

String ImageURl() {
  return "http://localhost:3000/uploads/";
}

void showCustomSnackbar(BuildContext context, String message) {
  Flushbar(
    message: message,
    flushbarPosition: FlushbarPosition.TOP,
    backgroundColor: dangerColor,
    duration: const Duration(seconds: 2),
  ).show(context);
}

String ConvertDate(String date) {
  DateTime time = DateTime.parse(date);
  String dateTime = DateFormat('dd MMMM yyyy').format(time);
  return dateTime;
}

String formatCurrency(num number) {
  // return NumberFormat.currency(
  //         // locale: 'id',
  //         // symbol: 'IDR.',
  //         decimalDigits: 000,
  //         customPattern: "##,##,##,###")
  //     .format(number);
  if (number >= 1000 && number < 1000000) {
    return 'IDR ${(number / 1000).toStringAsFixed(0)}k';
  } else if (number >= 1000000) {
    return 'IDR ${(number / 1000000).toStringAsFixed(0)}M';
  } else {
    return 'IDR $number';
  }
}

Future<XFile?> selectImage() async {
  XFile? selectedImage =
      await ImagePicker().pickImage(source: ImageSource.gallery);
  return selectedImage;
}

Future<File?> compressImage(String file) async {
  final filePath = file;
  final compressedData = await FlutterImageCompress.compressWithFile(filePath,
      quality: 70, format: CompressFormat.jpeg);

  if (compressedData != null) {
    final compressedFile = File(filePath)..writeAsBytesSync(compressedData);
    return compressedFile;
  }

  return null;
}

class Utils {
  static final Utils _singleton = new Utils._internal();

  factory Utils() {
    return _singleton;
  }

  Utils._internal();

  // only use this if reuse image for both dark & light theme
  // otherwise using getSvgPicture in Themes class
  static getSvgPicture(String name) => Image.asset('assets/$name.png');

  static bool isValidEmail(String email) {
    String p = r"^[a-zA-Z0-9._]+@[a-zA-Z0-9]+\.[a-zA-Z]+";
    RegExp regExp = new RegExp(p);
    return regExp.hasMatch(email);
  }

  bool isEmptyString(String str) {
    return str == null || str.isEmpty;
  }

  toast(dynamic str) {
    Fluttertoast.showToast(
        msg: str,
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 3,
        backgroundColor: Colors.green,
        textColor: Colors.white,
        fontSize: 15.0);
  }
}

final utils = new Utils();
