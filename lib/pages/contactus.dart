import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import '../preset/nav.dart';

class ContactPage extends StatefulWidget {
  const ContactPage({super.key});

  @override
  ContactPageState createState() => ContactPageState();
}

class ContactPageState extends State<ContactPage> {
  late GoogleMapController mapController;

  final LatLng _center = const LatLng(13.72718595606447, 100.77890918030054);

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PresetAppBar(),
      drawer: const PresetDrawer(),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.all(8.0),
              decoration: BoxDecoration(
                color: Colors.blue[50],
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: const Text(
                'Contact us',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue,
                ),
              ),
            ),
            const SizedBox(height: 16.0),
          
            Container(
              height: 400,
              padding: const EdgeInsets.all(10.0),
              child: GoogleMap(
                mapType: MapType.normal,
                onMapCreated: _onMapCreated,
                initialCameraPosition: CameraPosition(
                  target: _center,
                  zoom: 18.0,
                ),
                markers: <Marker>{
                  Marker(
                    draggable: true,
                    markerId: const MarkerId("KOSEN-KMITL"),
                    position: _center,
                    icon: BitmapDescriptor.defaultMarker,
                  )
                },
              ),
            ),

            const SizedBox(height: 24.0),
            const Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(Icons.location_on, size: 32, color: Colors.grey),
                      SizedBox(width: 8.0),
                      Expanded(
                        child: Text(
                          'Chao Phya Surawongwaiwat (Worn Bunnag) Convention Hall,\n'
                          '1 Chalong Krung, 1 Alley,\n'
                          'Lat Krabang Bangkok 10520',
                          style: TextStyle(fontSize: 14, color: Colors.black54),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 16.0),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(Icons.email, size: 32, color: Colors.grey),
                      SizedBox(width: 8.0),
                      Text(
                        'kosen@kmitl.ac.th',
                        style: TextStyle(fontSize: 14, color: Colors.black54),
                      ),
                    ],
                  ),
                  SizedBox(height: 16.0),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(Icons.phone, size: 32, color: Colors.grey),
                      SizedBox(width: 8.0),
                      Text(
                        '02-3289000',
                        style: TextStyle(fontSize: 14, color: Colors.black54),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
