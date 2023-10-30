import 'package:flutter/material.dart';

class AgencyTile extends StatelessWidget {
  const AgencyTile({
    super.key,
    required this.agencyName,
    required this.agencyImage,
    required this.agencyLocation,
  });

  final String agencyName,
      agencyImage,
      agencyLocation;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: ListTile(
        contentPadding: const EdgeInsets.all(1),
        onTap: () {},
        trailing: IconButton(
          onPressed: () {},
          icon: const Icon(Icons.arrow_right),
          splashRadius: 10,
        ),
        leading: CircleAvatar(
          radius: 35,
          backgroundImage: NetworkImage(agencyImage)
        ),
        title: Text(
          agencyName,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        subtitle: Text(
          agencyLocation,
        ),
      ),
    );
  }
}
