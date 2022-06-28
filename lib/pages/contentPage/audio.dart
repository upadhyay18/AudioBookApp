import 'package:bookapp/models/chapter.dart';
import 'package:bookapp/pages/contentPage/widgets/control.dart';
import 'package:bookapp/pages/contentPage/widgets/cover.dart';
import 'package:flutter/material.dart';
import '../constants/color.dart';

class AudioPage extends StatelessWidget {
  final Chapters chap;
  const AudioPage(this.chap, {Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color.fromARGB(255, 253, 253, 253),
        appBar: _buildAppBar(context),
        body: SizedBox(
          width: MediaQuery.of(context).size.width,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                chap.chapName.toUpperCase(),
                style: const TextStyle(
                    color: kFont,
                    fontWeight: FontWeight.bold,
                    fontSize: 24,
                    height: 1.2),
              ),
              SizedBox(height: 10),
              // book cover widget
              BookCover(chap.imgUrl),
              const SizedBox(height: 16),
              Text.rich(TextSpan(children: [
                const TextSpan(
                    text: "A Chapter By ",
                    style: const TextStyle(
                        color: Color.fromARGB(255, 230, 103, 103))),
                TextSpan(
                    text: chap.author.toUpperCase(),
                    style: const TextStyle(
                        color: kFont, fontWeight: FontWeight.w500))
              ])),
              const SizedBox(height: 10),
              // controler UI Widget
              AudioControl(chap.url),
            ],
          ),
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
