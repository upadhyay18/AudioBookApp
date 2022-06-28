import 'dart:io';
import 'package:bookapp/pages/constants/color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';

class TextBook extends StatefulWidget {
  final File file;
  TextBook(this.file, {Key? key}) : super(key: key);
  @override
  State<TextBook> createState() => _TextBookState(file);
}

class _TextBookState extends State<TextBook> {
  final File file;
  _TextBookState(this.file) {
    //Downloader.loadFileNetWork(book.textUrl);
  }
  @override
  // ignore: dead_code
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(context),
      backgroundColor: Colors.white,
      body: PDFView(
        filePath: file.path,
        swipeHorizontal: true,
        nightMode: true,
      ),
    );
  }
}

AppBar _buildAppBar(BuildContext context) {
  return AppBar(
    backgroundColor: Colors.white,
    elevation: 0,
    leading: IconButton(
      onPressed: () => Navigator.of(context).pop(),
      icon: const Icon(Icons.arrow_back_ios_outlined),
      color: kFont,
    ),
    actions: [
      IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.more_horiz_outlined,
            color: kFont,
          ))
    ],
  );
}
