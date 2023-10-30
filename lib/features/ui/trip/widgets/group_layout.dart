import 'package:flutter/material.dart';
import 'package:sih_v2/features/ui/QR/transfer_package.dart';

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
                child: Icon(Icons.local_shipping_outlined, color: Colors.black),
              ),
              title: const Text(
                "Neyveli --> Chennai",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              subtitle: const Text("Created on 17/6/24"),
              trailing: const Icon(Icons.arrow_outward),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const TransferPackage(),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
