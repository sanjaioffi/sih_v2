import 'package:flutter/material.dart';
import 'package:sih_v2/features/ui/bidding/view/bid_home_page.dart';
import 'package:sih_v2/features/ui/home/view/agency_page.dart';
import 'package:sih_v2/features/ui/trip/view/corridor_home.dart';
import 'package:sih_v2/test.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // Mapping of all the main screens
  final pages = [
    const AgencyPage(),
    const CorridorHome(),
    const MapSample(),
    BidHomePage(),
  ];

  // Cur Index of the Navigation Bar
  int index = 0;

  // Widget Coding
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.blueAccent,
        currentIndex: index,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.auto_awesome),
            label: "Transport",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.commit_sharp),
            label: "Bidding",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_rounded),
            label: "Profile",
          )
        ],
        onTap: (value) {
          setState(() {
            index = value;
          });
        },
      ),
      body: pages[index],
    );
  }
}
