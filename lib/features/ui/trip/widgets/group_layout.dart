import 'package:flutter/material.dart';

class GroupLayout extends StatelessWidget {
  const GroupLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
              children: [
          ListTile(
            contentPadding: const EdgeInsets.all(5),
            leading: const CircleAvatar(
                backgroundImage: NetworkImage(
                    "https://static.thenounproject.com/png/2167796-200.png")),
            title: const Text(
              "Neyveli ⇆ Chennai",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            subtitle: const Text("Created on 17/6/24"),
            trailing: const Icon(Icons.arrow_outward),
            onTap: () {},
          ),
          ListTile(
            contentPadding: const EdgeInsets.all(5),
            leading: const CircleAvatar(
                backgroundImage: NetworkImage(
                    "https://w7.pngwing.com/pngs/329/767/png-transparent-cruise-ship-boat-computer-icons-ship-angle-cargo-transport.png")),
            title: const Text(
              "Chennai ⇆ Odissa",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            subtitle: const Text("Created on 24/4/17"),
            trailing: const Icon(Icons.arrow_outward),
            onTap: () {},
          ),
              ],
            ),
        ));
  }
}
