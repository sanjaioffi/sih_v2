import 'package:flutter/material.dart';
import 'package:sih_v2/features/constants/agencies.dart';
import 'package:sih_v2/features/ui/home/widgets/agency_tile.dart';

class AgencyList extends StatelessWidget {
  const AgencyList({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: SizedBox(
        height: 700,
        width: double.infinity,
        child: ListView.builder(
          reverse: true,
          itemCount: data.length,
          itemBuilder: (context, index) {
            String mineCode = data.keys.elementAt(index);
            Map<String, String> mineDetails = data[mineCode] ?? {};
            return AgencyTile(
              agencyName: mineDetails['Name'] ?? "",
              agencyImage:
                  "https://yt3.googleusercontent.com/ytc/AOPolaSru16wvo8kcOFn0YDWN8fPrZ0UcLY5zYPMR8UZ=s900-c-k-c0x00ffffff-no-rj",
              agencyLocation: mineDetails['OperatingState'] ?? "",
            );
          },
        ),
      ),
    );
  }
}
