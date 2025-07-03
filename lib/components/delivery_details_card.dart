import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:oda/constants.dart';

class DeliveryDetailsCard extends StatelessWidget {
  const DeliveryDetailsCard({super.key});

  static const LatLng _kMapCenter = LatLng(
    0.3475963,
    32.5825197,
  ); // Example: Kampala, Uganda

  static const CameraPosition _kInitialPosition = CameraPosition(
    target: _kMapCenter,
    zoom: 15.0,
    tilt: 0,
    bearing: 0,
  );

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Delivery Details', style: AppTextStyles.bodyTitle),
          SizedBox(height: 10),
          Container(
            height: 150,
            decoration: BoxDecoration(
              color: AppColors.grey.withOpacity(0.2),
              borderRadius: BorderRadius.circular(10),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: GoogleMap(
                initialCameraPosition: _kInitialPosition,
                markers: {
                  Marker(
                    markerId: MarkerId('delivery_location'),
                    position: _kMapCenter,
                    infoWindow: InfoWindow(title: 'Delivery Location'),
                  ),
                },
                zoomControlsEnabled: false,
                mapToolbarEnabled: false,
                myLocationButtonEnabled: false,
                myLocationEnabled: false,
              ),
            ),
          ),
          SizedBox(height: 20),
          Row(
            children: [
              Icon(Octicons.location, color: AppColors.secondary, size: 25),
              SizedBox(width: 10),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Namugongo Road, Zots Apartments',
                      style: AppTextStyles.bodyTitle2,
                    ),
                    Text(
                      'Exact Location',
                      style: AppTextStyles.bodySmall.copyWith(
                        color: AppColors.red,
                      ),
                    ),
                  ],
                ),
              ),
              Icon(Icons.arrow_forward_ios, size: 16, color: AppColors.grey),
            ],
          ),
          SizedBox(height: 20),
        ],
      ),
    );
  }
}
