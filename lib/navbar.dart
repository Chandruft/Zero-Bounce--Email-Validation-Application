import 'package:awesome_bottom_bar/awesome_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:zero_bounce/bulk.dart';
import 'package:zero_bounce/history.dart';
import 'package:zero_bounce/homepage.dart';

const List<TabItem> items = [
  TabItem(
    icon: Icons.mail_outline,
    title: 'Single',
  ),
  TabItem(
    icon: Icons.my_library_books_rounded,
    title: 'Bulk',
  ),
  TabItem(
    icon: Icons.history,
    title: 'History',
  ),
];

class navbar extends StatefulWidget {
  const navbar({Key? key, required this.title}) : super(key: key);

  final String title;
  @override
  State<navbar> createState() => _navbarState();
}

class _navbarState extends State<navbar> {
  PageController _pageController = PageController(initialPage: 0);
  int _currentPageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _pageController,
        onPageChanged: (int index) {
          setState(() {
            _currentPageIndex = index;
          });
        },
        physics: const NeverScrollableScrollPhysics(),
        children: [
          HomePage(),
          bulk(),
          History(),
        ],
      ),
      bottomNavigationBar: Container(
        child: BottomBarFloating(
          items: items,
          backgroundColor: HexColor('F5F5FF'),
          color: HexColor('717880'),
          colorSelected: HexColor('FFC728'),
          indexSelected: _currentPageIndex,
          paddingVertical: 20,
          onTap: (int index) {
            setState(() {
              _currentPageIndex = index;
            });
            _pageController.jumpToPage(index);
          },
        ),
      ),
    );
  }
}
