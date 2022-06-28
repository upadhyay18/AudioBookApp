import 'package:cloud_firestore/cloud_firestore.dart';
class Book {
  String bookId;
  String author;
  String bookCover;
  DateTime date;
  String name;
  num numChapter;
  String publisher;
  String textUrl;
  String type;
  Book(this.bookId, this.author, this.bookCover, this.date, this.name,
      this.numChapter, this.publisher, this.textUrl, this.type);

  static List<Book> generateAllBooks(QuerySnapshot snapshotData) {
    List<Book> bookList = [];
    for (var doc in snapshotData.docs) {
      Book b1 = new Book("", "", "", DateTime(5), "", 5, "", "", "");
      b1.bookId = doc.id.toString();
      b1.author = doc.get("author");
      b1.bookCover = doc.get("bookCover");
      b1.name = doc.get("name");
      b1.numChapter = doc.get("numChapter");
      b1.publisher = doc.get("publishers");
      b1.textUrl = doc.get("txtUrl");
      b1.type = doc.get("type");
      // timestamp conversion to date time
      Timestamp t = doc.get("date");
      b1.date = DateTime.parse(t.toDate().toString());
      bookList.insert(0, b1);
    }
    return bookList;
  }
}
