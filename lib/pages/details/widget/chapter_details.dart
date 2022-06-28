import 'package:bookapp/models/book.dart';
import 'package:bookapp/models/chapter.dart';
import 'package:bookapp/pages/details/widget/chapter_item.dart';
import 'package:bookapp/service/database.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';

class ChapterDetails extends StatefulWidget {
  final Book book;
  ChapterDetails(this.book, {Key? key}) : super(key: key);

  @override
  State<ChapterDetails> createState() => _ChapterDetailsState(book);
}

class _ChapterDetailsState extends State<ChapterDetails> {
  final Book book;
  _ChapterDetailsState(this.book);
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: DataBase.getChaptersByBookId(book.bookId),
        builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            final chapList = Chapters.getChapters(snapshot.data!, book);
            return ListView.builder(
                shrinkWrap: true,
                itemCount: chapList.length,
                padding: EdgeInsets.symmetric(horizontal: 20),
                scrollDirection: Axis.vertical,
                itemBuilder: (context, index) {
                  return ChapterItem(chapList[index], index);
                });
          } else if (snapshot.connectionState == ConnectionState.none)
            return Text("somthing Went Wrong");
          return CupertinoActivityIndicator();
        });
  }
}
