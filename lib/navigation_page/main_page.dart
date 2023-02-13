import 'package:flutter/material.dart';
import '../Home_page.dart';
import 'my_page.dart';
import 'search_page.dart';
import 'bar_page.dart';

class Mainpage extends StatefulWidget {
  const Mainpage({Key? key}) : super(key: key);

  @override
  State<Mainpage> createState() => _MainpageState();
}

class _MainpageState extends State<Mainpage> {
  List screen = [
    const HomePage(),
    const Barpage(),
    const Searchpage(),
    const Mypage(),
  ];
  int count = 0;
  void ontap(int index) {
    setState(() {
      count = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: screen[count],
        backgroundColor: Colors.white,
        bottomNavigationBar: BottomNavigationBar(
          unselectedFontSize: 0,
          selectedFontSize: 0,
          type: BottomNavigationBarType.fixed,
          selectedItemColor: Colors.black54,
          onTap: ontap,
          backgroundColor: Colors.white,
          currentIndex: count,
          unselectedItemColor: Colors.grey.withOpacity(0.5),
          showSelectedLabels: false,
          showUnselectedLabels: false,
          elevation: 0,
          items: const [
            BottomNavigationBarItem(label: "Home", icon: Icon(Icons.apps)),
            BottomNavigationBarItem(
                label: "Bar", icon: Icon(Icons.bar_chart_outlined)),
            BottomNavigationBarItem(label: "Search", icon: Icon(Icons.search)),
            BottomNavigationBarItem(label: "My", icon: Icon(Icons.person)),
          ],
        ),
      ),
    );
  }
}
