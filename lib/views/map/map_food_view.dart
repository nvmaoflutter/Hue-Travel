import 'dart:async';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:vietnamfood/controllers/home_controller.dart';
import 'package:vietnamfood/views/map/widgets/shop_detail_bottom_sheet.dart';
import '../../models/shop_model.dart';

class MapFoodView extends StatefulWidget {
  final String name;
  final List<ShopModel> shops;
  final String? type;
  const MapFoodView(
      {super.key, required this.shops, required this.name, this.type});

  @override
  State<MapFoodView> createState() => _MapViewState();
}

class _MapViewState extends State<MapFoodView> {
  final Completer<GoogleMapController> _controller =
      Completer<GoogleMapController>();
  final HomeController homeController = HomeController();

  final List<Marker> _markers = <Marker>[];

  final CameraPosition _kGooglePlex = const CameraPosition(
    target: LatLng(16.4627609, 107.5900456),
    zoom: 14.4746,
  );

  @override
  void initState() {
    super.initState();
    _handlePermission();
    setMarker();
  }

  Future<bool> _handlePermission() async {
    final position = await homeController.determinePosition();
    final GoogleMapController controller = await _controller.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(CameraPosition(
        target: LatLng(position.latitude, position.longitude), zoom: 14)));
    return true;
  }

  setMarker() async {
    String icon = "assets/images/marker_place.png";
    if (widget.type == "food") {
      icon = "assets/images/shop.png";
    }
    final Uint8List markIcons = await getImages(icon, 150, 150);

    for (ShopModel item in widget.shops ?? []) {
      _markers.add(Marker(
        markerId: MarkerId(item.id ?? generateKey()),
        icon: BitmapDescriptor.fromBytes(markIcons),
        position:
            LatLng(item.latitude ?? 16.083161, item.longitude ?? 108.1531812),
        onTap: () {
          showModalBottomSheet(
              context: context,
              builder: (context) => ShopDetailBottomSheet(model: item),
              backgroundColor: Colors.transparent,
              isScrollControlled: true,
              enableDrag: false);
        },
      ));
    }
    setState(() {});
  }

  Future<Uint8List> getImages(String path, int width, int height) async {
    ByteData data = await rootBundle.load(path);
    Codec codec = await instantiateImageCodec(data.buffer.asUint8List(),
        targetHeight: height, targetWidth: width);
    FrameInfo fi = await codec.getNextFrame();
    return (await fi.image.toByteData(format: ImageByteFormat.png))!
        .buffer
        .asUint8List();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: const BackButton(color: Colors.black),
        title: Text(
          widget.name,
          style: TextStyle(
              fontSize: 20.spMin,
              fontWeight: FontWeight.w600,
              color: Colors.black),
        ),
        centerTitle: true,
        elevation: 1,
      ),
      body: GoogleMap(
        mapType: MapType.normal,
        markers: Set<Marker>.of(_markers),
        initialCameraPosition: _kGooglePlex,
        compassEnabled: true,
        tiltGesturesEnabled: true,
        myLocationEnabled: true,
        myLocationButtonEnabled: true,
        buildingsEnabled: true,
        mapToolbarEnabled: true,
        zoomControlsEnabled: true,
        indoorViewEnabled: true,
        onMapCreated: (GoogleMapController controller) {
          _controller.complete(controller);
        },
      ),
    );
  }
}
