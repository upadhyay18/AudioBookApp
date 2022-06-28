import 'package:bookapp/models/book.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Chapters {
  String bookId;
  String chapName;
  String duration;
  bool hasComplete;
  String url;
  String author;
  String imgUrl;
  Chapters(this.bookId, this.chapName, this.duration, this.hasComplete,
      this.url, this.author, this.imgUrl);
  static List<Chapters> getChapters(QuerySnapshot snapshotData, Book book) {
    List<Chapters> chapList = [];
    for (var doc in snapshotData.docs) {
      Chapters ch1 = Chapters("", "", "", false, "", "", "");
      ch1.bookId = doc.id;
      ch1.chapName = doc.get("name");
      ch1.duration = doc.get("duration");
      ch1.author = book.author;
      ch1.imgUrl = book.bookCover;
      ch1.url = doc.get("url");
      chapList.insert(0, ch1);
    }
    return chapList;
  }
}
