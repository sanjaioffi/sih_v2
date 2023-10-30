import 'package:flutter/material.dart';

class BiddingPage extends StatefulWidget {
  const BiddingPage({super.key});

  @override
  State<BiddingPage> createState() => _BiddingPageState();
}

class _BiddingPageState extends State<BiddingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("NLC Lignite Transport"),
      ),
    );
  }
}