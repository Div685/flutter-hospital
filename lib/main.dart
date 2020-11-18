import 'package:emergency_hospital/screens/dashboard.dart';
import 'package:emergency_hospital/splash/splashScreen.dart';
import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import 'package:geolocator/geolocator.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  //final locatorService = GeoLocatorService();

  @override
  Widget build(BuildContext context) {
    return Center(
        // provider: [
        //   FutureProvider(create: (context) => locatorService.getLocation()),
        // ],
        child: MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Emergency Rescue',
      theme: ThemeData(),
      home: SplashScreen(),
      routes: {
        'splash': (context) => SplashScreen(),
        'dashboard': (context) => DashBoard(),
        //'search': (context) => Search(),
        // 'place': (context) => SearchPlaces(),
        // 'pharmacy': (context) => Pharmacy(),
      },
    ));
  }
}
