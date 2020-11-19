import 'package:emergency_hospital/models/place.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

class PlaceService {
  final key = '';

  Future<List<Place>> getPlaces(
      double lat, double lng, BitmapDescriptor icon) async {
    var response = await http.get(
        'https://maps.googleapis.com/maps/api/place/nearbysearch/json?location=$lat,$lng&radius=1500&type=hospital&key=$key');
    var json = convert.jsonDecode(response.body);
    var jsonResults = json['results'] as List;
    return jsonResults.map((place) => Place.fromJson(place, icon)).toList();
  }

  final String detailsUrl =
      'https://maps.googleapis.com/maps/api/place/details/json?key=AIzaSyB3ojcHzXsAUwh3POXJZ-tPbqCOhDwH76A&place_id=';

  Future getPlaceDetails(String placeId, BitmapDescriptor icon) async {
    var response = await http
        .get(detailsUrl + placeId, headers: {"Accepts": "application/json"});
    var json = convert.jsonDecode(response.body);
    var jsonResult = json['results'] as List;
    return jsonResult.map((place) => Place.fromJson(place, icon)).toList();
  }
}
