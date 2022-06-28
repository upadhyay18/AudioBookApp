import 'dart:io';
import 'package:http/http.dart' as HTTP;
import 'package:path_provider/path_provider.dart';

class PdfDownload {
  static Future<File> loadNetwork(String url) async {
    final response = await HTTP.get(Uri.parse(url));
    final bytes = response.bodyBytes;
    return _storeFile(url, bytes);
  }

  static Future<File> _storeFile(String url, List<int> bytes) async {
    final dir = await getApplicationDocumentsDirectory();

    final file = File("${dir.path}/temp.pdf");
    await file.writeAsBytes(bytes, flush: true);
    return file;
  }
}
