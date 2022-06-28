import 'package:bookapp/pages/home/widgets/Book_Staggered_GridView.dart';
import 'package:bookapp/pages/home/widgets/coustom_tab.dart';
import 'package:flutter/material.dart';
import 'package:bookapp/pages/constants/color.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

// function to create Home  page
class _HomeState extends State<Home> {
  var tabIndex = 0;
  var bottomIndex = 0;
  final pageController = PageController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: _buildAppBar(), // methed to build AppBar
      body: Column(
        children: [
          CoustomTab(tabIndex, (int index) {
            setState(() {
              tabIndex = index;
            });
            pageController.jumpToPage(index);
          }),
          Expanded(
              // listing books using staggered view
              child: BookStaggeredGridView(
            tabIndex,
            pageController,
            (int index) => setState(() {
              tabIndex = index;
            }),
          ))
        ],
      ),
      bottomNavigationBar: _buildBottomNavigationBar(
          context), // method to build bottom navigation bar
    );
  }

// method to build bottom navigation bar
  Widget _buildBottomNavigationBar(BuildContext context) {
    final bottomList = [Icons.home_outlined, Icons.person_outline];
    final screeWid = MediaQuery.of(context).size.width - 40;
    return SizedBox(
      width: screeWid,
      height: 56,
      child: ListView.separated(
          scrollDirection: Axis.horizontal,
          itemBuilder: (_, index) => GestureDetector(
                onTap: () => setState(() {
                  bottomIndex = index;
                }),
                child: Container(
                    width: (screeWid) / 2,
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    decoration: bottomIndex == index
                        ? const BoxDecoration(
                            border: Border(
                              bottom: BorderSide(
                                  width: 3, color: Colors.deepOrange),
                            ),
                          )
                        : null,
                    child: Icon(bottomList[index],
                        size: 30,
                        color:
                            bottomIndex == index ? kFont : Colors.grey[300])),
              ),
          separatorBuilder: (_, index) => const SizedBox(width: 10),
          itemCount: bottomList.length),
    );
  }

// methed to build AppBar
  AppBar _buildAppBar() {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
      leading: IconButton(
        onPressed: () {},
        icon: Icon(Icons.menu_open_rounded),
        color: kFont,
      ),
      title: Text(
        "Sangrah Publication",
        style: TextStyle(color: kFont, fontSize: 18),
      ),
      centerTitle: true,
      actions: [
        IconButton(
            onPressed: () {},
            icon: const Icon(Icons.search_outlined),
            color: kFont)
      ],
    );
  }
}
