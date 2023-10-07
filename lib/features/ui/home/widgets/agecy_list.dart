import 'package:flutter/material.dart';
import 'package:sih_v2/features/ui/home/widgets/agency_tile.dart';

class AgencyList extends StatelessWidget {
  AgencyList({Key? key});

  final Map<String, Map<String, String>> data = {
  'BCM':{
  "Name": "Bermo Coal Mine",
  "OperatingState":"Jharkhand",
  },
  'KC':{
  "Name": "Kalyani Colliery",
  "OperatingState":"Jharkhand",
  },
  'TSCM':{
  "Name": "TATA Steel coal mines",
  "OperatingState":"Jharkhand",
  },
  'DOM':{
  "Name": "Dobari Opencast Mine BCCL",
  "OperatingState":"Jharkhand",
  },
  'JCF':{
  "Name": "Jharia Coalfield ",
  "OperatingState":"Jharkhand",
  },
  'GCF':{
  "Name": "Girdih coalfield",
  "OperatingState":"Jharkhand",
  },
  'HCF':{
  "Name": "Hutar coalfield",
  "OperatingState":"Jharkhand",
  },
  'RACM':{
  "Name": "Rajmahal Coal Mine",
  "OperatingState":"Jharkhand",
  },
  'CCOM':{
  "Name": "Chitra Colliery Open Mines",
  "OperatingState":"Jharkhand",
  },
  'SCM':{
  "Name": "Sikni Coal Mines",
  "OperatingState":"Jharkhand",
  },
  'SICM':{
  "Name": "Singareni Coal Mines",
  "OperatingState":"Telangana",
  },
  'SCCL':{
  "Name": "Singareni Collieries Company Limited",
  "OperatingState":"Telangana",
  },
  'KCM':{
  "Name": "Kasipeta Coal Mine",
  "OperatingState":"Telangana",
  },
  'MCF':{
  "Name": "Mannargudi Coal Field",
  "OperatingState":"Tamilnadu",
  },
  'NCM':{
  "Name": "Neyveli Coal Mine",
  "OperatingState":"Tamilnadu",
  },
  'JCM':{
  "Name": "Jharsuguda Coal Mines",
  "OperatingState":"Odisha",
  },
  'TCF':{
  "Name": "Talcher Coal Field",
  "OperatingState":"Odisha",
  },
  'HiCF':{
  "Name": "Himgiri Coal Field",
  "OperatingState":"Odisha",
  },
  'JPCF':{
  "Name": "Jaipur Coal Field",
  "OperatingState":"Odisha",
  },
  'GOCM':{
  "Name": "Gevra OC Mine",
  "OperatingState":"Chhattisgarh",
  },
  'BCCL':{
  "Name": "Bharat Coking Coal Limited ",
  "OperatingState":"Kolkata",
  },
};


  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
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
