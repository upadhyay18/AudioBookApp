import 'package:bookapp/models/book.dart';
import 'package:bookapp/pages/constants/color.dart';
import 'package:bookapp/pages/details/widget/book_cover.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class BookDetail extends StatelessWidget {
  final Book book;
  const BookDetail(this.book, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(book.type.toUpperCase(),
              style: const TextStyle(
                color: Colors.deepOrange,
                fontWeight: FontWeight.bold,
              )),
          const SizedBox(height: 10),
          Text(
            book.name.toUpperCase(),
            style: const TextStyle(
                color: kFont,
                fontWeight: FontWeight.bold,
                fontSize: 24,
                height: 1.2),
          ),
          const SizedBox(height: 10),
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Text.rich(TextSpan(children: [
              const TextSpan(
                  text: "Published From ",
                  style: const TextStyle(color: Colors.grey)),
              TextSpan(
                  text: book.publisher,
                  style: const TextStyle(
                      color: kFont, fontWeight: FontWeight.w500))
            ])),
            Text(DateFormat.yMMM().format(book.date))
          ]),
          const SizedBox(height: 10),
          // Book Cover Widget
          BookCover(book),
          const SizedBox(height: 10),
          Text.rich(TextSpan(children: [
            const TextSpan(
                text: "A Book By  ",
                style:
                    const TextStyle(color: Color.fromARGB(255, 243, 68, 15))),
            TextSpan(
                text: book.author.toUpperCase(),
                style:
                    const TextStyle(color: kFont, fontWeight: FontWeight.w500))
          ])),
        ],
      ),
    );
  }
}
