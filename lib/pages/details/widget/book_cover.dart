import 'dart:io';
import 'package:bookapp/models/book.dart';
import 'package:bookapp/pages/contentPage/textbook.dart';
import 'package:bookapp/pages/contentPage/txtWidget/file_download.dart';
import 'package:flutter/material.dart';

class BookCover extends StatelessWidget {
  final Book book;
  const BookCover(this.book, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      padding: const EdgeInsets.only(left: 20),
      height: 250,
      child: Stack(
        children: [
          Container(
            padding: const EdgeInsets.only(left: 50),
            width: MediaQuery.of(context).size.width - 60,
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(50),
                  bottomLeft: Radius.circular(50)),
              color: Colors.grey.shade300,
            ),
            child: ClipRRect(
                borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(50),
                    bottomLeft: Radius.circular(50)),
                child: Image.network(book.bookCover, fit: BoxFit.cover)),
          ),
          Positioned(
              left: 240,
              bottom: 20,
              child: GestureDetector(
                onTap: () async {
                  final File file = await PdfDownload.loadNetwork(book.textUrl);
                  openPDF(context, file);
                },
                child: Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Color.fromARGB(227, 235, 132, 29)),
                  child: Row(
                    children: const [
                      Icon(Icons.book_online_sharp,
                          color: Color.fromARGB(255, 245, 244, 244), size: 25),
                      Text(
                        "Read Book",
                        style: TextStyle(color: Colors.white),
                      )
                    ],
                  ),
                ),
              ))
        ],
      ),
    );
  }
}

void openPDF(BuildContext context, File file) => Navigator.of(context)
    .push(MaterialPageRoute(builder: (context) => TextBook(file)));
