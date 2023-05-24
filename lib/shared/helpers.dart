import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:mongo_dart/mongo_dart.dart';

String ImageURl() {
  return "http://localhost:3000/uploads/";
}

String ConvertDate(String date) {
  DateTime time = DateTime.parse(date);
  String dateTime = DateFormat('dd MMMM yyyy').format(time);
  return dateTime;
}

String formatCurrency(num number) {
  return NumberFormat.currency(
    locale: 'id',
    symbol: 'Rp. ',
    decimalDigits: 0,
  ).format(number);
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

ObjectId convertObjectID(String data) {
  ObjectId convert = ObjectId.parse(data);
  return convert;
}
