import 'package:emergency_hospital/models/place.dart';
import 'package:emergency_hospital/services/geolocator_services.dart';
import 'package:emergency_hospital/services/marker_service.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class Search extends StatefulWidget {
  @override
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<Search> {
  @override
  Widget build(BuildContext context) {
    final currentPosition = Provider.of<Position>(context);
    final placesProvider = Provider.of<Future<List<Place>>>(context);
    final markerService = MarkerService();
    final geoService = GeoLocatorService();

    return FutureProvider(
        create: (context) => placesProvider,
        child: Scaffold(
          body: (currentPosition != null)
              ? Consumer<List<Place>>(
                  builder: (_, places, __) {
                    var markers = (places != null)
                        ? markerService.getMarker(places)
                        : List<Marker>();
                    return (places != null)
                        ? Column(
                            children: <Widget>[
                              Container(
                                width: MediaQuery.of(context).size.width,
                                height:
                                    MediaQuery.of(context).size.height * 0.93,
                                child: GoogleMap(
                                  initialCameraPosition: CameraPosition(
                                      target: LatLng(currentPosition.latitude,
                                          currentPosition.longitude),
                                      zoom: 16.0),
                                  mapType: MapType.normal,
                                  zoomGesturesEnabled: true,
                                  myLocationEnabled: true,
                                  compassEnabled: true,
                                  markers: Set<Marker>.of(markers),
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  showModalBottomSheet<void>(
                                    context: context,
                                    isScrollControlled: true,
                                    builder: (context) {
                                      return DraggableScrollableSheet(
                                        expand: false,
                                        builder: (context, controller) {
                                          return Container(
                                            child: ListView.builder(
                                              controller: controller,
                                              itemCount: places.length,
                                              itemBuilder: (context, index) {
                                                return FutureProvider(
                                                  create: (context) =>
                                                      geoService.getDistance(
                                                          currentPosition
                                                              .latitude,
                                                          currentPosition
                                                              .longitude,
                                                          places[index]
                                                              .geometry
                                                              .location
                                                              .lat,
                                                          places[index]
                                                              .geometry
                                                              .location
                                                              .lng),
                                                  child: Card(
                                                    child: ListTile(
                                                      title: Text(
                                                        places[index].name,
                                                        style: TextStyle(
                                                            color: Colors
                                                                .redAccent[700],
                                                            fontWeight:
                                                                FontWeight
                                                                    .bold),
                                                      ),
                                                      subtitle: Column(
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: <Widget>[
                                                          (places[index]
                                                                      .rating !=
                                                                  null)
                                                              ? Row(
                                                                  children: <
                                                                      Widget>[
                                                                    Text(places[
                                                                            index]
                                                                        .rating
                                                                        .toString()),
                                                                    RatingBarIndicator(
                                                                      rating: places[
                                                                              index]
                                                                          .rating,
                                                                      itemBuilder:
                                                                          (context, index) =>
                                                                              Icon(
                                                                        Icons
                                                                            .star,
                                                                        color: Colors
                                                                            .redAccent[700],
                                                                      ),
                                                                      itemCount:
                                                                          5,
                                                                      itemSize:
                                                                          15.0,
                                                                      direction:
                                                                          Axis.horizontal,
                                                                    )
                                                                  ],
                                                                )
                                                              : Row(),
                                                          SizedBox(
                                                            height: 8.0,
                                                          ),
                                                          Consumer<double>(
                                                              builder: (context,
                                                                  meters,
                                                                  widget) {
                                                            return (meters !=
                                                                    null)
                                                                ? Text(
                                                                    '${places[index].vicinity} \u00b7 ${(meters / 1609).round()} mi')
                                                                : Container();
                                                          })
                                                        ],
                                                      ),
                                                      trailing: Row(
                                                        mainAxisSize:
                                                            MainAxisSize.min,
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: <Widget>[
                                                          //  child:
                                                          // Icon(
                                                          //   Icons.call,
                                                          //   color: Colors.red,

                                                          // ),
                                                          // Icon(Icons.directions)
                                                          // Consumer<double>(
                                                          //     builder: (context,
                                                          //         phone, widget) {
                                                          //   return (phone != null)
                                                          //       ? Text(
                                                          //           '${places[index].internationalPhoneNumber}')
                                                          //       : Container();
                                                          // }),
                                                          Ink(
                                                            decoration:
                                                                const ShapeDecoration(
                                                              color: Colors.red,
                                                              shape:
                                                                  CircleBorder(),
                                                            ),
                                                            // child: Icon(
                                                            //   Icons.call,
                                                            //   color: Colors.white,
                                                            // ),
                                                            child: IconButton(
                                                              // iconSize: 10.0,
                                                              icon: Icon(
                                                                  Icons.call),
                                                              color:
                                                                  Colors.white,
                                                              onPressed: () {},
                                                              splashColor:
                                                                  Colors.amber,
                                                            ),
                                                          ),
                                                          SizedBox(
                                                            width: 5.0,
                                                          ),
                                                          Ink(
                                                            decoration:
                                                                const ShapeDecoration(
                                                              color: Colors.red,
                                                              shape:
                                                                  CircleBorder(),
                                                            ),
                                                            child: IconButton(
                                                              icon: Icon(Icons
                                                                  .directions),
                                                              color:
                                                                  Colors.white,
                                                              onPressed: () {},
                                                            ),
                                                          )
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                );
                                              },
                                            ),
                                            decoration: BoxDecoration(
                                              color:
                                                  Theme.of(context).canvasColor,
                                              borderRadius: BorderRadius.only(
                                                topLeft:
                                                    const Radius.circular(20),
                                                topRight:
                                                    const Radius.circular(20),
                                              ),
                                            ),
                                          );
                                        },
                                      );
                                    },
                                  );
                                },
                                child: Container(
                                  padding:
                                      EdgeInsets.only(top: 8.0, left: 15.0),
                                  width: MediaQuery.of(context).size.width,
                                  height:
                                      MediaQuery.of(context).size.height * 0.07,
                                  child: Text(
                                    "Show List",
                                    style: TextStyle(color: Colors.blue),
                                  ),
                                  decoration: BoxDecoration(
                                      // color: Colors.amberAccent,
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.white.withOpacity(0.5),
                                          offset: Offset(0, 3),
                                        )
                                      ]),
                                ),
                              )
                            ],
                          )
                        : Center(
                            child: CircularProgressIndicator(),
                          );
                  },
                )
              : Center(
                  child: CircularProgressIndicator(),
                ),
        ));
  }
}
