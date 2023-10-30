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
  void _showDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text(
            'Scan Qr Code to transfer Live Sharing Controll.',
            style: TextStyle(
              fontSize: 18,
            ),
          ),
          content: const GenerateQr(),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Close'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Transfer Package'),
        leading: IconButton(
          style: const ButtonStyle(
              backgroundColor: MaterialStatePropertyAll(Colors.transparent)),
          onPressed: () {},
          icon: const Icon(Icons.arrow_back),
        ),
        actions: [
          IconButton(
            style: const ButtonStyle(
                backgroundColor: MaterialStatePropertyAll(Colors.transparent)),
            icon: const Icon(
              Icons.qr_code,
            ),
            onPressed: () {
              _showDialog(context);
            },
          ),
          IconButton(
            style: const ButtonStyle(
                backgroundColor: MaterialStatePropertyAll(Colors.transparent)),
            icon: const Icon(
              Icons.qr_code_scanner,
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const ScanQr(),
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
            ],
          ),
        ),
      ),
    );
  }
}
