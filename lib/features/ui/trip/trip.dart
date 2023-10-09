import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:sih_v2/features/ui/trip/trasport_component.dart';
import 'package:sih_v2/features/ui/trip/trip_info.dart';

class TripScreen extends StatefulWidget {
  const TripScreen({super.key});

  @override
  State<TripScreen> createState() => _TripScreenState();
}

class _TripScreenState extends State<TripScreen> {
  final Completer<GoogleMapController> _controller =
      Completer<GoogleMapController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        forceMaterialTransparency: false,
        scrolledUnderElevation: 0,
        toolbarHeight: 80,
        leadingWidth: MediaQuery.of(context).size.width,
        leading: const TripInfoTopBar(),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 10,
                  horizontal: 10,
                ),
                child: Container(
                  height: 400,
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(
                      Radius.circular(2),
                    ),
                  ),
                  child: GoogleMap(
                    compassEnabled: false,
                    myLocationEnabled: false,
                    zoomControlsEnabled: false,
                    markers: {
                      const Marker(
                        markerId: MarkerId("Source"),
                        position: LatLng(11.570363, 79.503817),
                      ),
                      const Marker(
                        markerId: MarkerId("Destination"),
                        position: LatLng(21.938122, 83.699179),
                      )
                    },
                    mapType: MapType.terrain,
                    initialCameraPosition: const CameraPosition(
                      target: LatLng(22.756948, 77.716758),
                      zoom: 4.4,
                    ),
                    onMapCreated: (GoogleMapController controller) {
                      _controller.complete(controller);
                    },
                  ),
                ),
              ),
              const TransportPlanComponent(),
              const TransportPlanComponent(),
              const TransportPlanComponent(),
              const TransportPlanComponent(),
              const SizedBox(height: 10),
            ],
          ),
        ),
      ),
    );
  }
}
