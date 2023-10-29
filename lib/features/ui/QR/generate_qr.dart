import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

class GenerateQr extends StatelessWidget {
  final String qrData = "Hello, QR Code!";

  const GenerateQr({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: QrImageView(
        data: qrData,
        version: QrVersions.auto,
        size: 200.0,
      ),
    );
  }
}
