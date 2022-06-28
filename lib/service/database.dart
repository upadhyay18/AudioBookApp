import 'package:cloud_firestore/cloud_firestore.dart';

class DataBase {
  static final bookDB = FirebaseFirestore.instance.collection('books');

  //fetch data from Database
  static Future<QuerySnapshot> getBookData(int index) async {
    QuerySnapshot snapshot;
    if (index == 1) {
      snapshot = await bookDB.where("type", isEqualTo: "fantasy").get();
    } else if (index == 2) {
      snapshot = await bookDB.where("type", isEqualTo: "self help").get();
    } else if (index == 3) {
      snapshot = await bookDB.where("type", isEqualTo: "adventure").get();
    } else {
      snapshot = await bookDB.get();
    }
    return snapshot;
  }

  static Future<QuerySnapshot> getChaptersByBookId(String bookId) async {
    return await bookDB.doc(bookId).collection("chapters").get();
  }
}
