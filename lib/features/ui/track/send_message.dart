// import 'package:flutter/material.dart';
// import 'package:flutter_sms/flutter_sms.dart';
// import 'package:contacts_service/contacts_service.dart';
// import 'package:permission_handler/permission_handler.dart';



// class ContactWithSelection {
//   Contact contact;
//   bool isSelected;

//   ContactWithSelection(this.contact, this.isSelected);
// }

// class SendMessagePage extends StatefulWidget {
//   @override
//   _SendMessagePageState createState() => _SendMessagePageState();
// }

// class _SendMessagePageState extends State<SendMessagePage> {
//   List<ContactWithSelection> selectedContacts = [];
//   TextEditingController messageController = TextEditingController();

//   @override
//   void initState() {
//     super.initState();
//     _requestPermission();
//   }

//   Future<void> _requestPermission() async {
//     final PermissionStatus status = await Permission.sms.request();
//     if (status.isGranted) {
//       _loadContacts();
//     } else {
//       print('Permission denied for SMS');
//     }
//   }

//   Future<void> _loadContacts() async {
//     final Iterable<Contact> contacts = await ContactsService.getContacts();
//     setState(() {
//       selectedContacts = contacts
//           .map((contact) => ContactWithSelection(contact, false))
//           .toList();
//     });
//   }

//   void _sendTextMessage(String phoneNumber, String message) async {
//     try {
//       await sendSMS(
//         message: message,
//         recipients: [phoneNumber],
//       );
//       print('Message sent successfully to $phoneNumber');
//     } catch (error) {
//       print('Failed to send message to $phoneNumber: $error');
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Send SMS to Selected Contacts'),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           children: <Widget>[
//             TextField(
//               controller: messageController,
//               decoration: InputDecoration(
//                 labelText: 'Message',
//                 hintText: 'Enter your message',
//               ),
//             ),
//             SizedBox(height: 20),
//             Expanded(
//               child: ListView.builder(
//                 itemCount: selectedContacts.length,
//                 itemBuilder: (context, index) {
//                   final contact = selectedContacts[index];
//                   return ListTile(
//                     title: Text(contact.contact.displayName ?? ''),
//                     subtitle: Text(contact.contact.phones?.first.value ?? ''),
//                     trailing: Checkbox(
//                       value: contact.isSelected,
//                       onChanged: (bool? value) {
//                         setState(() {
//                           contact.isSelected = value ?? false;
//                         });
//                       },
//                     ),
//                   );
//                 },
//               ),
//             ),
//             ElevatedButton(
//               onPressed: () {
//                 for (final contact in selectedContacts) {
//                   if (contact.isSelected) {
//                     _sendTextMessage(
//                       contact.contact.phones?.first.value ?? '',
//                       messageController.text,
//                     );
//                   }
//                 }
//               },
//               child: Text('Send SMS to Selected Contacts'),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
