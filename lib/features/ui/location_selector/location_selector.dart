import 'package:flutter/material.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:sih_v2/features/ui/trip/trip.dart';

class LocationSelector extends StatefulWidget {
  const LocationSelector({super.key});

  @override
  State createState() => _LocationSelectorState();
}

class _LocationSelectorState extends State<LocationSelector> {
  final TextEditingController _startController = TextEditingController();
  final TextEditingController _endController = TextEditingController();

  final List<String> locations = [
    'Mumbai',
    'Delhi',
    'Bangalore',
    'Chennai',
    'Kolkata',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Fill Trip Details'),
        centerTitle: true,
        leading: null,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            const SizedBox(
              height: 30,
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: TypeAheadFormField<String>(
                textFieldConfiguration: TextFieldConfiguration(
                  controller: _startController,
                  decoration: const InputDecoration(
                    labelText: 'Source Location',
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
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: TypeAheadFormField<String>(
                textFieldConfiguration: TextFieldConfiguration(
                  controller: _endController,
                  decoration: const InputDecoration(
                    labelText: 'Destination Location',
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
            ),
            const SizedBox(
              height: 10,
            ),
            //
            const Padding(
              padding: EdgeInsets.all(16.0),
              child: TextField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                    labelText: 'Number of Tonnes',
                    border: OutlineInputBorder(),
                    suffix: Text('Tonnes')),
              ),
            ),
            const SizedBox(
              height: 180,
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const TripScreen(),
                    ));
              },
              child: const Text('Let Aladdin Do his work'),
            ),
            const SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }
}
