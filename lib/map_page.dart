import 'package:flutter/material.dart';
import 'package:map_view/map_view.dart';

void main() {
  MapView.setApiKey(
      "AIzaSyD9gSbGRg1lGZ6-g71FWs3c1MX9LDipiHw"); //api que possibilita utilização do mapa no android pelo google play services
  runApp(new MaterialApp(
    debugShowCheckedModeBanner: false,
    home: new MapPage(),
  ));
}

class MapPage extends StatefulWidget {
  //definindo o estado padrão da página
  @override
  _MapPageState createState() => new _MapPageState();
}

class _MapPageState extends State<MapPage> {
  MapView mapView = new MapView();
  CameraPosition
      cameraPosition; //posição inicial da camera definida abaixo no código
  var staticMapProvider = new StaticMapProvider(
      "AIzaSyD9gSbGRg1lGZ6-g71FWs3c1MX9LDipiHw"); // api key necessária
  Uri staticMapUri;

  List<Marker> markers = <Marker>[
    new Marker("1", "Premium Office", -9.644311,
        -35.711940, //marcador vermelho que aparece quando a tela do mapa é clicada
        color: Colors.redAccent),
  ];

  showMap() {
    mapView.show(new MapOptions(
        mapViewType:
            MapViewType.normal, //definição do tipo de visualização do mapa
        initialCameraPosition: //posição inicial da camera
            new CameraPosition(new Location(-9.644534, -35.711822),
                15.0), //latitude e longitude da posição da camera
        showUserLocation: true, //permissões do android
        showMyLocationButton: true,
        showCompassButton: true,
        title: "Where Are you?"));
    mapView.setMarkers(
        markers); //mostra na tela os marcadores quando a tela é clicada
    mapView.zoomToFit(padding: 100);

    mapView.onMapTapped.listen((_) {
      //o que acontece quando a tela é clicada
      setState(() {
        mapView.setMarkers(markers);
        mapView.zoomToFit(padding: 100);
      });
    });
  }

  @override
  void initState() {
    //estado inicial da posição da "camera"
    super.initState();
    cameraPosition =
        new CameraPosition(new Location(-9.644633, -35.711686), 2.0);
    staticMapUri = staticMapProvider.getStaticUri(
        new Location(-9.644633, -35.711686), 12,
        height: 400, width: 900, mapType: StaticMapViewType.roadmap);
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        leading: new IconButton(
          icon: new Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator
              .pop(context), //icone com rota para fechar a parte do mapa
        ),
        backgroundColor: Colors.teal,
        title: Text(
          "Google Maps",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
      body: new Column(
        mainAxisAlignment:
            MainAxisAlignment.start, //alinhamento vertical no topo
        children: <Widget>[
          new Container(
            height: 300.0,
            child: new Stack(
              children: <Widget>[
                new Center(
                  child: Container(
                    child: new Text(
                      "Map should show here",
                      textAlign: TextAlign.center,
                    ),
                    padding: const EdgeInsets.all(20.0),
                  ),
                ),
                new InkWell(
                  child: new Center(
                    child: new Image.network(staticMapUri.toString()),
                  ),
                  onTap: showMap,
                )
              ],
            ),
          ),
          new Container(
            padding: new EdgeInsets.only(top: 10.0),
            child: new Text(
              "Tap the map to position your location",
              style: new TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          new Container(
            padding: new EdgeInsets.only(top: 25.0),
            child: new Text(
                "Camera Position: \n\nLat: ${cameraPosition.center.latitude}\n\nLng:${cameraPosition.center.longitude}\n\nZoom: ${cameraPosition.zoom}"),
          ),
        ],
      ),
    );
  }
}
