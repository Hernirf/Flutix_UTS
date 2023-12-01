import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:utsmobile/page/homeMovies.dart';
import 'package:utsmobile/page/myticket.dart';
import 'package:utsmobile/page/mywallet.dart';
import 'package:utsmobile/page/profile.dart';
import 'package:utsmobile/page/successtopup.dart';
import 'package:utsmobile/page/ticketdetails.dart';
import 'package:utsmobile/page/wallettopup.dart';

import '../Olah_data.dart';

class bottomnav extends StatefulWidget {
  final int idx;
  const bottomnav({super.key, required this.idx});

  @override
  State<bottomnav> createState() => _bottomnavState();
}

class _bottomnavState extends State<bottomnav> {
  @override
  late int currentIndex;

  Widget image1 = Image.asset("asset/movies.png");
  Widget image2 = Image.asset("asset/ticket.png");
  Widget image3 = Image.asset("asset/profile.png");
  Color color1 = Colors.white;
  Color color2 = Color(0xFFA340A6);
  final List<Widget> _children = [
    homeMovies(),
    myticket(),
    profile(),
  ];

  @override
  void initState() {
    super.initState();
    currentIndex = widget.idx;
  }
  Widget build(BuildContext context) {
    final data = Provider.of<olahData>(context, listen: false);

  // int currentIndex = data.index;

    void button() {
      setState(() {
        if (currentIndex == 0) {
          image1 = Image.asset("asset/movies2.png");
          image2 = Image.asset("asset/ticket.png");
          image3 = Image.asset("asset/profile.png");

        } else if (currentIndex == 1) {
          image1 = Image.asset("asset/movies.png");
          image2 = Image.asset("asset/tiket2.png");
          image3 = Image.asset("asset/profile.png");

        } else if (currentIndex == 2) {
          image1 = Image.asset("asset/movies.png");
          image2 = Image.asset("asset/ticket.png");
          image3 = Image.asset("asset/profile2.png");
        }
      });
    }

    button();
    return Scaffold(
      body: IndexedStack(
        index: currentIndex,
        children: _children,
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Color.fromARGB(255, 39, 26, 84),
        selectedLabelStyle:
            TextStyle(color: Colors.white),
        unselectedLabelStyle:
            TextStyle(color: Colors.white),
        unselectedItemColor: color1,
        selectedItemColor: color2,
        // unselectedIconTheme: IconThemeData(size: 0),
        // selectedIconTheme: IconThemeData(size: 35),
        currentIndex: currentIndex,
        onTap: (int index) {
          setState(() {
            currentIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: image1,
            label: 'Movies',
            
          ),
          BottomNavigationBarItem(
            icon: image2,
            label: 'Ticket',
          ),
          BottomNavigationBarItem(
            icon: image3,
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}
