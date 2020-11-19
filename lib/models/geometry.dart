import 'package:emergency_hospital/models/location.dart';

class Geometry {
  final Location location;

  Geometry({this.location});

  Geometry.fromJson(Map<dynamic, dynamic> parseJson)
      : location = Location.fromJson(parseJson['location']);
}
