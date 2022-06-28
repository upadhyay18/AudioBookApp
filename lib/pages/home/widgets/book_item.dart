import 'package:bookapp/models/book.dart';
import 'package:bookapp/pages/details/detail.dart';
import 'package:flutter/material.dart';
import 'dart:math';

class BookItem extends StatelessWidget {
  final Book book;
  const BookItem(this.book, {Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.of(context)
          .push(MaterialPageRoute(builder: (context) => DetailPage(book))),
      child: Container(
        height:
            180.0 + Random().nextDouble() * 100, // height has been changed here
        decoration: BoxDecoration(
            image: DecorationImage(
              image: NetworkImage(book.bookCover),
              fit: BoxFit.cover,
            ),
            borderRadius: BorderRadius.circular(16)),
      ),
    );
  }
}
