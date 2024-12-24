import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

class StatPage extends StatefulWidget {
  const StatPage({super.key});

  @override
  State<StatPage> createState() => _StatPageState();
}

class _StatPageState extends State<StatPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlue[100],
      appBar: AppBar(
        title: const Text('Statistics'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 200,
              color: Colors.grey[300],
              alignment: Alignment.center,
              child: FlutterMap(
                options: const MapOptions(
                  initialCenter: LatLng(6.003,109.550),
                  initialZoom: 9,
                  interactionOptions: 
                    InteractionOptions(flags: ~InteractiveFlag.doubleTapDragZoom),
                ),
                children: [
                  openStreetMapTileLayer,
                  const MarkerLayer(
                    markers: [
                      Marker(
                        point: LatLng(6.003,109.550),
                        child: Icon(Icons.location_pin,semanticLabel: 'penangkaran 1',)
                      )
                    ],
                  )
                ],
              )
            ),
            const SizedBox(height: 16),
            const Text(
              'Population Count',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              'Pollution Index',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              'Temperature',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

TileLayer get openStreetMapTileLayer => TileLayer(
  urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
  userAgentPackageName: 'dev.fleaflet.flutter_map.example',
);