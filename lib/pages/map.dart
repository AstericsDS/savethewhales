import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
// import 'package:flutter_svg/svg.dart';
import 'package:latlong2/latlong.dart';

class MapPage extends StatefulWidget {
  const MapPage({super.key});

  @override
  State<MapPage> createState() => _Mapstate();
}

class _Mapstate extends State<MapPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: mainMenu()
    );
  }

  Widget mainMenu() {
    return FlutterMap(
      options: const MapOptions(
        initialCenter: LatLng(6.003,109.550),
        initialZoom: 4,
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
    );
  }
}

TileLayer get openStreetMapTileLayer => TileLayer(
  urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
  userAgentPackageName: 'dev.fleaflet.flutter_map.example',
);