import 'package:bookapp/models/book.dart';
import 'package:bookapp/pages/home/widgets/book_item.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import '../../../service/database.dart';

class BookStaggeredGridView extends StatelessWidget {
  final int selected;
  final PageController pageController;
  final Function callback;
  BookStaggeredGridView(this.selected, this.pageController, this.callback,
      {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: DataBase.getBookData(selected),
      builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          // book List is genrated by genrate Books Method define in Book.dart
          final bookList = Book.generateAllBooks(snapshot.data!);
          return Container(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: StaggeredGridView.countBuilder(
                shrinkWrap: true,
                physics: const ScrollPhysics(),
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
                crossAxisCount: 4,
                itemCount: bookList.length,
                itemBuilder: (_, index) => BookItem(bookList[index]),
                staggeredTileBuilder: (_) => const StaggeredTile.fit(2)),
          );
        } else if (snapshot.connectionState == ConnectionState.none) {
          return Text("No data");
        }
        return CupertinoActivityIndicator();
      },
    );
  }
}
