import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as HTTP;

class Downloader with ChangeNotifier {
  final String url;
  static String data = "";
  static String textState = "Loading";
  Downloader(this.url) {
    log(url);
    loadFileNetWork();
  }
  void loadFileNetWork() async {
    try {
      log(url);
      final response = await HTTP.get(Uri.parse(url));
      data = response.body.toString();
      textState = "available";
      log(data);
    } catch (error) {
      data = error.toString();
      textState = "error";
    }
    notifyListeners();
  }
}
/*
  static Future<File> _storeFile(String url, List<int> bytes) async {
    final filename = "/assets/temp.txt";
    final file = File(filename);
    await file.writeAsBytes(bytes);
    print(file);
    return file;
  }
*/
