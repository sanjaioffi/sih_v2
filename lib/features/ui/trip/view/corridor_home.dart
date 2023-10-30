import 'package:flutter/material.dart';
import 'package:sih_v2/features/ui/location_selector/location_selector.dart';
import 'package:sih_v2/features/ui/trip/widgets/group_layout.dart';

class CorridorHome extends StatelessWidget {
  const CorridorHome({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
          shape: const CircleBorder(),
          elevation: 0,
          child: const Icon(Icons.add, color: Colors.black),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const LocationSelector(),
              ),
            );
          }),
      appBar: AppBar(
        elevation: 5,
        centerTitle: true,
        title: const Text("Transfer Corridor"),
      ),
      body: const GroupLayout(),
    );
  }
}
