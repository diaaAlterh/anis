import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../data/models/company_info_model.dart';
import '../logic/home_bloc.dart';

class MapWidget extends StatelessWidget {
  const MapWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<CompanyInfoModel>(
        stream: homeBloc.companyInfoStream,
        builder: (context, snapshot) {
          final info = snapshot.data?.results?.first;
          final location = LatLng(
            info?.lat ?? 0,
            info?.lng ?? 0,
          );
          if (snapshot.hasData) {
            return Container(
              alignment: Alignment.center,
              margin: const EdgeInsets.all(20),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: SizedBox(
                  height: 300,
                  width: 500,
                  child: GoogleMap(
                    zoomControlsEnabled: false,
                    rotateGesturesEnabled: false,
                    zoomGesturesEnabled: false,
                    myLocationButtonEnabled: false,
                    mapToolbarEnabled: false,
                    myLocationEnabled: false,
                    markers: {
                      Marker(
                          position: location,
                          markerId: const MarkerId('location'),
                          infoWindow:
                              InfoWindow(title: 'anis'.tr(), onTap: () {})),
                    },
                    initialCameraPosition:
                        CameraPosition(target: location, zoom: 18),
                  ),
                ),
              ),
            );
          }
          return const SizedBox();
        });
  }
}
