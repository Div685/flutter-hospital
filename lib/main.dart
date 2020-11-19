import 'package:emergency_hospital/models/place.dart';
import 'package:emergency_hospital/screens/dashboard.dart';
import 'package:emergency_hospital/screens/search.dart';
import 'package:emergency_hospital/services/geolocator_services.dart';
import 'package:emergency_hospital/services/place_services.dart';
import 'package:emergency_hospital/splash/splashScreen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final locatorService = GeoLocatorService();
  final placeService = PlaceService();

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          FutureProvider(create: (context) => locatorService.getLocation()),
          FutureProvider(
            create: (context) {
              ImageConfiguration configuration =
                  createLocalImageConfiguration(context);
              return BitmapDescriptor.fromAssetImage(
                  configuration, 'assets/ambulance_red.png');
            },
          ),
          ProxyProvider2<Position, BitmapDescriptor, Future<List<Place>>>(
            update: (context, position, icon, places) {
              return (position != null)
                  ? placeService.getPlaces(
                      position.latitude, position.longitude, icon)
                  : null;
            },
          ),
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Emergency Rescue',
          theme: ThemeData(),
          home: SplashScreen(),
          routes: {
            'splash': (context) => SplashScreen(),
            'dashboard': (context) => DashBoard(),
            'search': (context) => Search(),
            // 'place': (context) => SearchPlaces(),
            // 'pharmacy': (context) => Pharmacy(),
          },
        ));
  }
}
