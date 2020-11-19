class Location {
  final double lat;
  final double lng;

  Location({this.lat, this.lng});

  Location.fromJson(Map<dynamic, dynamic> parseJson)
      : lat = parseJson['lat'],
        lng = parseJson['lng'];
}
