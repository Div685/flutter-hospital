import 'package:emergency_hospital/models/geometry.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class Place {
  String id;
  final String name;
  final double rating;
  final int userRatingCount;
  final String vicinity;
  final Geometry geometry;
  final BitmapDescriptor icon;

  final String internationalPhoneNumber;
  final List<String> weekdayText;
  final String formattedAddress;

  Place(
      {this.id,
      this.name,
      this.rating,
      this.userRatingCount,
      this.vicinity,
      this.geometry,
      this.icon,
      this.internationalPhoneNumber,
      this.weekdayText,
      this.formattedAddress});

  Place.fromJson(Map<dynamic, dynamic> parseJson, BitmapDescriptor icon)
      : name = parseJson['name'],
        rating = (parseJson['rating'] != null)
            ? parseJson['rating'].toDouble()
            : null,
        userRatingCount = (parseJson['user_rating_total'] != null)
            ? parseJson['user_rating_total']
            : null,
        vicinity = parseJson['vicinity'],
        geometry = Geometry.fromJson(parseJson['geometry']),
        internationalPhoneNumber =
            (parseJson['website'] != null) ? parseJson['website'] : null,
        weekdayText = (parseJson['weekday_text']),
        formattedAddress = (parseJson['formatted_Address']),
        icon = icon;
}
