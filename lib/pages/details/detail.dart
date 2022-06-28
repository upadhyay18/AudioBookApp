import 'package:bookapp/models/book.dart';
import 'package:bookapp/pages/constants/color.dart';
import 'package:bookapp/pages/details/widget/chapter_details.dart';
import 'package:bookapp/pages/details/widget/book_detail.dart';
import 'package:flutter/material.dart';

class DetailPage extends StatelessWidget {
  final Book book;
  const DetailPage(this.book, {Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: _buildAppBar(context),
        body: SingleChildScrollView(
            child: Column(children: [
          BookDetail(book),
          Container(
            width: MediaQuery.of(context).size.width - 40,
            margin: EdgeInsets.all(5),
            padding: EdgeInsets.all(5),
            alignment: Alignment.center,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              color: kFont,
            ),
            child: Text("Chapters",
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 25)),
          ),
          SizedBox(
            height: 300,
            child: ChapterDetails(book),
          )
        ])));
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
