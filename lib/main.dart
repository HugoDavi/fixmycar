import 'package:flutter/material.dart';
import 'home_page.dart';
import 'service_page.dart';
import 'map_page.dart';
import 'login_page.dart';
import 'package:map_view/map_view.dart'; //importação das páginas utilizadas

void main() {
  MapView.setApiKey(
      "AIzaSyD9gSbGRg1lGZ6-g71FWs3c1MX9LDipiHw"); //api key utilizada na construção do mapa
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Fix My Car', //titulo da aplicação
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.lightBlue,
        fontFamily: 'Nunito',
      ),
      home: LoginPage(),
      routes: <String, WidgetBuilder>{
        //definição das rotas
        '/loginScreen': (context) => new LoginPage(),
        '/homeScreen': (context) => new HomePage(),
        '/serviceScreen': (context) => new ServicePage(),
        '/mapScreen': (context) => new MapPage(),
      },
    );
  }
}
