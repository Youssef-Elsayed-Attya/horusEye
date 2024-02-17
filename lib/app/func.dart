import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:intl/intl.dart';
import 'package:path_provider/path_provider.dart';
import 'package:uuid/uuid.dart';

///base 64
Future<File> fromBase64(String extension) async {
  Uint8List bytes = base64.decode('UTF-8');
  String dir = (await getApplicationDocumentsDirectory()).path;
  File file = File("$dir/${DateTime.now().millisecondsSinceEpoch}.$extension");
  await file.writeAsBytes(bytes);
  return file;
}

Future<String> toBase64(File file) async {
  List<int> fileInByte = file.readAsBytesSync();
  String fileInBase64 = base64Encode(fileInByte);
  return fileInBase64;
}

String getRandomUid() {
  return const Uuid().v4();
}

String getDayShortDate() {
  var now = DateTime.now();
  return "${now.day} - ${now.month} - ${now.year}";
}

String getDayTime() {
  var now = DateFormat("HH:mm:ss").format(DateTime.now());
  return now;
}

bool isValidEmail(String email) {
  final pattern = RegExp(r'^[a-zA-Z0-9.!#$%&’*+/=?^_`{|}~-]+@[a-zA-Z0-9-]+(?:\.[a-zA-Z0-9-]+)*$');
  return pattern.hasMatch(email.trim());
}

/// Password is valid if it has an uppercase, lowercase, number, symbol and has at least 8 characters
bool isPasswordValid(String password) {
  final containsUpperCase = RegExp(r'[A-Z]').hasMatch(password);
  final containsLowerCase = RegExp(r'[a-z]').hasMatch(password);
  final containsNumber = RegExp(r'\d').hasMatch(password);
  final containsSymbols = RegExp(r'[`~!@#$%\^&*\(\)_+\\\-={}\[\]\/.,<>;]').hasMatch(password);
  final hasManyCharacters = RegExp(r'^.{8,128}$', dotAll: true).hasMatch(password); // This is variable

  return containsUpperCase && containsLowerCase && containsNumber && containsSymbols && hasManyCharacters;
}



void timer(){

  Timer.periodic(Duration(seconds: 2), (timer) {
    //
    // if(timer.isActive==true && i<messages.length){
    //   print(i);
    //   setState(() {
    //     list.add(messages[i]);
    //     i +=1;
    //   });
    //
    // }

  });
}
