import 'package:bookapp/models/book.dart';
import 'package:bookapp/pages/constants/color.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as HTTP;

class TextBook extends StatefulWidget {
  final Book book;
  TextBook(this.book, {Key? key}) : super(key: key);
  @override
  State<TextBook> createState() => _TextBookState(book);
}

class _TextBookState extends State<TextBook> {
  final Book book;
  _TextBookState(this.book) {
    //Downloader.loadFileNetWork(book.textUrl);
  }
  @override
  // ignore: dead_code
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: _buildAppBar(context),
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Container(
              height: MediaQuery.of(context).size.height - 60,
              width: MediaQuery.of(context).size.width - 40,
              child: StreamBuilder(
                stream: HTTP
                    .get(Uri.parse(book.textUrl))
                    .asStream()
                    .map((event) => Text(event.body)),
                builder: (context, snapshots) {
                  if (snapshots.connectionState == ConnectionState.waiting)
                    return CupertinoActivityIndicator();
                  else if (snapshots.hasError)
                    return Text("Something Went wrong");
                  else if (snapshots.hasData)
                    return Text(snapshots.data.toString());
                  return CupertinoActivityIndicator();
                },
              )),
        ));
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
