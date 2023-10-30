import 'package:flutter/material.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:sih_v2/features/ui/trip/trip.dart';

class LocationSelector extends StatefulWidget {
  const LocationSelector({super.key});

  @override
  State createState() => _LocationSelectorState();
}

class _LocationSelectorState extends State<LocationSelector> {
  DateTime selectedDate = DateTime.now();
  TimeOfDay selectedTime = TimeOfDay.now();

  Future<void> _selectDate(BuildContext context) async {
    var picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime.now(),
      lastDate: DateTime(2101),
    );
    if (picked != selectedDate) {
      setState(() {
        selectedDate = picked!;
      });
    }
  }

  final TextEditingController _startController = TextEditingController();
  final TextEditingController _endController = TextEditingController();

  final List<String> locations = [
    'Mumbai',
    'NeyVeli',
    'Delhi',
    'Bangalore',
    'Chennai',
    'Kolkata',
    'Oddisha',
    'Bhuvaneshwar',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Choose Trip Details'),
        centerTitle: true,
        leading: const SizedBox(),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            const SizedBox(
              height: 30,
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text("Source"),
                  const SizedBox(height: 10),
                  TypeAheadFormField<String>(
                    textFieldConfiguration: TextFieldConfiguration(
                      controller: _startController,
                      decoration: const InputDecoration(
                        prefixIcon: Icon(Icons.local_shipping_outlined),
                        hintText: 'Source Location',
                        border: OutlineInputBorder(),
                      ),
                    ),
                    suggestionsCallback: (pattern) {
                      return locations
                          .where((location) => location
                              .toLowerCase()
                              .contains(pattern.toLowerCase()))
                          .toList();
                    },
                    itemBuilder: (context, suggestion) {
                      return ListTile(
                        title: Text(suggestion),
                      );
                    },
                    onSuggestionSelected: (suggestion) {
                      _startController.text = suggestion;
                    },
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text("Destination"),
                  const SizedBox(height: 10),
                  TypeAheadFormField<String>(
                    textFieldConfiguration: TextFieldConfiguration(
                      controller: _endController,
                      decoration: const InputDecoration(
                        prefixIcon: Icon(Icons.local_shipping_outlined),
                        hintText: 'Destination Location',
                        border: OutlineInputBorder(),
                      ),
                    ),
                    suggestionsCallback: (pattern) {
                      return locations
                          .where((location) => location
                              .toLowerCase()
                              .contains(pattern.toLowerCase()))
                          .toList();
                    },
                    itemBuilder: (context, suggestion) {
                      return ListTile(
                        title: Text(suggestion),
                      );
                    },
                    onSuggestionSelected: (suggestion) {
                      _endController.text = suggestion;
                    },
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            //
            const Padding(
              padding: EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Quantity"),
                  SizedBox(height: 10),
                  TextField(
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.keyboard_command_key_outlined),
                      hintText: 'No of Tonnes',
                      border: OutlineInputBorder(),
                      suffix: Text('Tonnes'),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: GestureDetector(
                onTap: () {
                  _selectDate(context);
                },
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text("Departure Date"),
                    const SizedBox(height: 15),
                    Container(
                      width: double.infinity,
                      decoration:
                          BoxDecoration(border: Border.all(color: Colors.grey)),
                      padding: const EdgeInsets.symmetric(
                          vertical: 15, horizontal: 15),
                      child: Text(
                        "${selectedDate.toLocal()}".split(' ')[0],
                        style: const TextStyle(fontSize: 18),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 50),
            ElevatedButton(
              style: const ButtonStyle(),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const TripScreen(),
                  ),
                );
              },
              child: const Text('Let Aladdin Do his work'),
            ),
          ],
        ),
      ),
    );
  }
}
