// import 'package:flutter/material.dart';

// class Contestants extends StatelessWidget {
//   const Contestants({
//     super.key,
//     required this.name,
//     required this.amount,
//     required this.percentage,
//   });

//   final String name, amount, percentage;
//   @override
//   Widget build(BuildContext context) {
//     return Material(
//       shadowColor: Colors.black38,
//       child: Container(
//         padding: EdgeInsets.all(5),
//         height: 50,
//         width: double.infinity,
//         decoration: BoxDecoration(
//           borderRadius: BorderRadius.circular(10)
//         ),
//         child: Row(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: [
//             Text(
//               name,
//               style: const TextStyle(color: Colors.black, fontSize: 22),
//             ),
//             Row(
//               children: [
//                 Text(
//                   amount,
//                   style: const TextStyle(color: Colors.black, fontSize: 19),
//                 ),
//                 const SizedBox(
//                   width: 10,
//                 ),
//                 const Text(
//                   "↓",
//                   style: TextStyle(color: Colors.green, fontSize: 17),
//                 ),
//                 Text(
//                   percentage,
//                   style: const TextStyle(color: Colors.black, fontSize: 15),
//                 ),
//               ],
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';

class Contestants extends StatefulWidget {
  const Contestants({
    super.key,
    required this.name,
    required this.amount,
    required this.percentage,
  });

  final String name, amount, percentage;

  @override
  State<Contestants> createState() => _ContestantsState();
}

class _ContestantsState extends State<Contestants> {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(widget.name, style: const TextStyle(fontSize: 20)),
      trailing: TrailingInfo(amount: widget.amount, percentage: widget.percentage),
    );
  }
}

class TrailingInfo extends StatefulWidget {
  final String amount, percentage;

  const TrailingInfo({
    super.key,
    required this.amount,
    required this.percentage,
  });

  @override
  State<TrailingInfo> createState() => _TrailingInfoState();
}

class _TrailingInfoState extends State<TrailingInfo> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Text(widget.amount, style: const TextStyle(fontSize: 20)),
        Text("↓${widget.percentage}", style: const TextStyle(fontSize: 17, color: Colors.green)),
      ],
    );
  }
}