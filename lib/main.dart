import 'package:flutter/material.dart';
import 'package:mapbox_gl/mapbox_gl.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Map',
        theme: ThemeData(

          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: fullsecreen()
    );
  }
}

//sk.eyJ1IjoiaW5vdWJsaWxlaXRoMTQiLCJhIjoiY2x1OGl1Mjl4MGZzNzJybnN6cHg1YWhnNCJ9.rvuyhnhRcTySjP-MhWY1pw





class fullsecreen extends StatefulWidget {
  fullsecreen ({super.key});

  @override
  State<fullsecreen> createState() => _fullsecreenState();
}

class _fullsecreenState extends State<fullsecreen> {
  MapboxMapController? mapController;

  var isLight = true;
  final center =  LatLng(41.385063, 2.173404) ;
  final oscuro = "mapbox://styles/inoublileith14/clu8jq0h300ad01pfcpp51kz7";
  final srtreet = "mapbox://styles/inoublileith14/clu8kg8eu00r701pr32oqfjw3";
  String selctedStyle =  "mapbox://styles/inoublileith14/clu8kg8eu00r701pr32oqfjw3";

  _onMapCreated(MapboxMapController controller) {
    mapController = controller;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:buildMapboxMap(),
      floatingActionButton: buildColumn(),

    );
  }

  Column buildColumn() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: <Widget>[
        FloatingActionButton(
            child: Icon(Icons.sentiment_dissatisfied),
            onPressed: (){
              mapController!.addSymbol(SymbolOptions(
                  geometry: center,
                  textField: "Barcelona here  ",

                  iconImage: "attraction-15",
                  iconSize: 3,
                  textOffset: Offset(0,1)

              ));
            }
        ),
        SizedBox(height: 5,),
        FloatingActionButton(
            child: Icon(Icons.zoom_in),
            onPressed: (){
              mapController!.animateCamera(CameraUpdate.zoomIn());
            }
        ),
        SizedBox(height: 5,),
        FloatingActionButton(
            child: Icon(Icons.zoom_out),
            onPressed: (){
              mapController!.animateCamera(CameraUpdate.zoomOut());
            }
        ),
        SizedBox(height: 5,),
        FloatingActionButton(
            child: Icon(Icons.add_to_home_screen),
            onPressed:(){
              if(selctedStyle == oscuro){
                selctedStyle = srtreet ;
              }
              else {
                selctedStyle = oscuro;
              }
              setState(() {

              });


            })
      ],
    );
  }

  MapboxMap buildMapboxMap() {
    return MapboxMap(
      styleString: selctedStyle,
      initialCameraPosition:
      CameraPosition(
        zoom: 14,
        target:center,),
      onMapCreated: _onMapCreated,


    );
  }
}
