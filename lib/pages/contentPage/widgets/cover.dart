import 'package:flutter/material.dart';

class BookCover extends StatelessWidget {
  final String imgUrl;
  const BookCover(this.imgUrl, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.all(15),
        padding: const EdgeInsets.all(5),
        width: 200,
        height: 300,
        decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                  color: Color.fromARGB(255, 92, 89, 89),
                  offset: Offset(0, 20),
                  blurRadius: 30)
            ],
            borderRadius: BorderRadius.circular(0),
            color: Color.fromARGB(255, 250, 212, 212)),
        child: Image(image: NetworkImage(imgUrl), fit: BoxFit.cover));
  }
}
