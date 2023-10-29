import 'package:flutter/material.dart';
import 'package:sih_v2/features/ui/QR/generate_qr.dart';
import 'package:sih_v2/features/ui/QR/scan_qr.dart';
import 'package:sih_v2/features/ui/track/location_map.dart';

class TransferPackage extends StatefulWidget {
  const TransferPackage({super.key});

  @override
  State<TransferPackage> createState() => _TransferPackageState();
}

class _TransferPackageState extends State<TransferPackage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Transfer Package'),
          actions: [
            IconButton(
              icon: const Icon(Icons.qr_code_scanner),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ScanQr(),
                  ),
                );
              },
            )
          ],
        ),
        body: SingleChildScrollView(
          child: SizedBox(
            height: MediaQuery.of(context).size.height,
            child: Column(
              children: [
                Flexible(flex: 2, child: LocationMap()),
                Flexible(
                    flex: 1,
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: const Text(
                              'Scan QR Code to transfer the package to the next location',
                              style: TextStyle(fontSize: 15)),
                        ),
                        GenerateQr(),
                      ],
                    ))
              ],
            ),
          ),
        ));
  }
}
