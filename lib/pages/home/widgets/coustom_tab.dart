import 'package:bookapp/pages/constants/color.dart';
import 'package:flutter/material.dart';

class CoustomTab extends StatelessWidget {
  final int selected;
  final Function callback;
  CoustomTab(this.selected, this.callback, {Key? key}) : super(key: key);
  final tabs = ["All Books", "Fantasy", "self help", "adventure"];

  @override
  Widget build(BuildContext context) {
    final screeWid = MediaQuery.of(context).size.width - 40;
    return Container(
      margin: EdgeInsets.all(20),
      decoration: BoxDecoration(
          color: Colors.grey[200], borderRadius: BorderRadius.circular(5)),
      width: screeWid,
      height: 56,
      child: ListView.separated(
          padding: const EdgeInsets.symmetric(horizontal: 5),
          scrollDirection: Axis.horizontal,
          itemBuilder: (_, index) => GestureDetector(
              onTap: () => callback(index),
              child: Container(
                  decoration: BoxDecoration(
                      color:
                          selected == index ? Colors.white : Colors.grey[200],
                      borderRadius: BorderRadius.circular(5)),
                  child: Text(
                    tabs[index],
                    style: const TextStyle(
                        color: kFont, fontWeight: FontWeight.w500),
                  ),
                  width: (screeWid - 40) / 2 - 10,
                  margin: const EdgeInsets.symmetric(vertical: 5),
                  alignment: Alignment.center)),
          separatorBuilder: (_, index) => const SizedBox(width: 10),
          itemCount: tabs.length),
    );
  }
}
