import 'package:flutter/material.dart';
import 'package:sih_v2/features/ui/trip/trip.dart';
import 'package:sih_v2/test.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // Mapping of all the main screens
  final pages = [
    const Scaffold(backgroundColor: Colors.blueGrey),
    const TripScreen(),
    const MapSample(),
    const Scaffold(),
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
