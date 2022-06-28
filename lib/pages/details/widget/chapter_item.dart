import 'package:bookapp/models/chapter.dart';
import 'package:bookapp/pages/constants/color.dart';
import 'package:bookapp/pages/contentPage/audio.dart';
import 'package:flutter/material.dart';

class ChapterItem extends StatelessWidget {
  final Chapters chap;
  final int index;
  ChapterItem(this.chap, this.index, {Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.of(context)
          .push(MaterialPageRoute(builder: (context) => AudioPage(chap))),
      child: Container(
          padding: EdgeInsets.symmetric(vertical: 5, horizontal: 5),
          margin: EdgeInsets.symmetric(vertical: 5, horizontal: 5),
          decoration: BoxDecoration(
              color: chap.hasComplete == true
                  ? Colors.lightGreenAccent
                  : Colors.grey.shade300,
              borderRadius: BorderRadius.circular(8)),
          child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
            Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
              Text(
                "Chapter: " + (index + 1).toString(),
                style: TextStyle(
                  color: kFont,
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                ),
              ),
              Text(
                "Duration: " + chap.duration + " min",
                style: TextStyle(
                    color: Colors.black38,
                    fontSize: 10,
                    fontStyle: FontStyle.italic),
              )
            ]),
            Text(
              chap.chapName,
              style: TextStyle(
                  color: Colors.black38,
                  fontSize: 15,
                  fontStyle: FontStyle.italic),
            )
          ])),
    );
  }
}
