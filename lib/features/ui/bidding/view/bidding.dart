import 'package:flutter/material.dart';
import 'package:sih_v2/features/ui/bidding/widgets/contestants.dart';

class BiddingPage extends StatefulWidget {
  const BiddingPage({super.key});

  @override
  State<BiddingPage> createState() => _BiddingPageState();
}

class _BiddingPageState extends State<BiddingPage> {
  final ValueNotifier<String> enteredNameNotifier = ValueNotifier<String>("");
  final ValueNotifier<String> enteredAmountNotifier = ValueNotifier<String>("");

  @override
  void dispose() {
    enteredNameNotifier.dispose();
    enteredAmountNotifier.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("NLC Lignite Transport"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(17),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const SizedBox(
                  height: 15,
                ),
                 const Contestants(
                  name: "ABCD Groups",
                  amount: "₹30000",
                  percentage: "10%",
                ),
                const SizedBox(
                  height: 25,
                ),
                const Contestants(
                  name: "EFGH Groups",
                  amount: "₹28000",
                  percentage: "15%",
                ),
                const SizedBox(
                  height: 25,
                ),
                const Contestants(
                  name: "IJKL Groups",
                  amount: "₹26000",
                  percentage: "20%",
                ),
                const SizedBox(
                  height: 25,
                ),
                if (enteredAmountNotifier.value.isNotEmpty)
                  Contestants(
                    name: enteredNameNotifier.value,
                    amount: "₹${enteredAmountNotifier.value}",
                    percentage: calculatePercentage(enteredAmountNotifier.value),
                  ),
              ],
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                elevation: 0,
                textStyle: const TextStyle(fontSize: 17),
                shape: const RoundedRectangleBorder(),
              ),
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)),
                      title: const Text(
                        'Bid',
                        style: TextStyle(
                            fontSize: 25, fontWeight: FontWeight.bold),
                      ),
                      content: Container(
                        height: 125,
                        child: Column(
                          children: [
                            TextField(
                              decoration: const InputDecoration(
                                hintText: 'Enter name',
                              ),
                              onChanged: (value) {
                                setState(() {
                                  enteredNameNotifier.value = value;
                                });
                              },
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            TextField(
                              keyboardType: TextInputType.number,
                              decoration: const InputDecoration(
                                hintText: 'Enter amount',
                              ),
                              onChanged: (value) {
                                setState(() {
                                  enteredAmountNotifier.value = value;
                                });
                              },
                            ),
                          ],
                        ),
                      ),
                      actions: <Widget>[
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          child: const Text('Submit'),
                        ),
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
              },
              child: const Text("Place a bid"),
            ),
          ],
        ),
      ),
    );
  }

  String calculatePercentage(String enteredAmount) {
    if (enteredAmount.isEmpty) {
      return "0%";
    }

    final int originalAmount = 32000;
    final int newAmount = int.tryParse(enteredAmount) ?? 0;
    final double percentageReduction =
        ((originalAmount - newAmount) / originalAmount) * 100;
    return "${percentageReduction.toStringAsFixed(2)}%";
  }
}

