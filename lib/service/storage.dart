import 'package:firebase_storage/firebase_storage.dart';

class Storage {
  static final storageRef = FirebaseStorage.instance;

  static Future<String> getImageUrl(String url) {
    return storageRef.refFromURL(url).getDownloadURL();
  }
}
