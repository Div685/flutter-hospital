import 'package:flutter/material.dart';

class DashBoard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Home"),
      ),
      drawer: Drawer(),
      body: GridView.count(
        crossAxisCount: 2,
        primary: false,
        crossAxisSpacing: 10.0,
        mainAxisSpacing: 10.0,
        padding: EdgeInsets.all(20.0),
        children: <Widget>[
          GestureDetector(
            onTap: () {},
            child: new Container(
              color: Colors.red[700],
              padding: EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Icon(
                    Icons.local_hospital,
                    size: 40.0,
                    color: Colors.white,
                  ),
                  Text(
                    "Donate Blood",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold,
                    ),
                  )
                ],
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, 'search');
            },
            child: new Container(
              color: Colors.red[700],
              padding: EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Icon(
                    Icons.zoom_out_map,
                    size: 40.0,
                    color: Colors.white,
                  ),
                  Text(
                    "Near Hospital",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold,
                    ),
                  )
                ],
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              // Navigator.pushNamed(context, 'place');
            },
            child: Container(
                color: Colors.red[700],
                padding: EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Icon(
                      Icons.local_hospital,
                      size: 40.0,
                      color: Colors.white,
                    ),
                    Text(
                      "List Of Hospital",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold,
                      ),
                    )
                  ],
                )),
          ),
          GestureDetector(
            onTap: () {},
            child: Container(
                color: Colors.red[700],
                padding: EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Icon(
                      Icons.local_hospital,
                      size: 40.0,
                      color: Colors.white,
                    ),
                    Text(
                      "Symptoms",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold,
                      ),
                    )
                  ],
                )),
          ),
          GestureDetector(
            onTap: () {
              // Navigator.pushNamed(context, 'pharmacy');
            },
            child: Container(
                color: Colors.red[700],
                padding: EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Icon(
                      Icons.local_pharmacy,
                      size: 40.0,
                      color: Colors.white,
                    ),
                    Text(
                      "Near By Pharmacy",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold,
                      ),
                    )
                  ],
                )),
          )
        ],
      ),
    );
  }
}
