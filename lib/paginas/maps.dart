import 'dart:math';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:permission_handler/permission_handler.dart';

class Maps extends StatefulWidget {
  @override
  _MapsState createState() => _MapsState();
}

class _MapsState extends State<Maps> {
  GoogleMapController mapController;
  Set<Marker> markers = new Set<Marker>();
  final LatLng _center = const LatLng(-5.111154, -42.770134);

  // List<Marker> allMarkers = [];

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  /*void checkLocation() async {
    var status = await Permission.location.status;
    if (!status.isGranted) {
      PermissionStatus permissionStatus = await Permission.location.request();
    }
  }*/

  void _add(double lat, double long, titulo, subtitulo) {
    var adicionador = new Random();
    Marker marker = Marker(
        markerId: MarkerId('$adicionador'),
        position: LatLng(lat, long),
        infoWindow: InfoWindow(title: titulo, snippet: subtitulo));
    setState(() {
      markers.add(marker);
    });
  }

  initState() {
    super.initState();
    //checkLocation();
    _add(-5.0888219, -42.813416, 'Whindersson', 'Casa de Whindersson');
    _add(-29.3797216, -50.9014878, 'Joy Chave', 'Cidade Visitada');
    _add(40.6971494, -74.2598644, 'Nilton Soares', 'Casa de Amigo');
    _add(48.8588377, 2.2770203, 'Gado Taxista', 'Local de Trabalho');
    _add(22.3526632, 113.9876144, 'Samantha Furacão', 'Local de Lazer');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title:
            Text('Mapas', style: TextStyle(color: Colors.white, fontSize: 30)),
        backgroundColor: Colors.black,
      ),
      body: GoogleMap(
        //markers: Set<Marker>.of(),
        onMapCreated: _onMapCreated,
        initialCameraPosition: CameraPosition(target: _center, zoom: 1),
        myLocationEnabled: true,
        markers: markers,
      ),
    );
  }
}
