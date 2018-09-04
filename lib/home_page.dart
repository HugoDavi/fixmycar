import 'package:flutter/material.dart';
import 'constants.dart';

class HomePage extends StatelessWidget {
  static String homePage;

  @override
  Widget build(BuildContext context) {
    final mediaQueryData = MediaQuery.of(context).size.width / 400;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
        home: Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal, 
        title: const Text('Fix My car'),
        actions: <Widget>[
          IconButton(
            icon: new Icon(Icons.search),
            onPressed: () {},
          ),
          PopupMenuButton<String>( //onde aparece Settings/Help
            onSelected: choiceAction,
            itemBuilder: (BuildContext context) {
              return Constants.choices.map((String choice) { 
                return PopupMenuItem<String>(
                  value: choice,
                  child: Text(choice),
                );
              }).toList();
            },
          )
        ],
      ),
      drawer: new Drawer(
        child: new ListView(
          children: <Widget>[
            new UserAccountsDrawerHeader( // parte superior do Drawer onde se localiza dados do perfil
              accountName: new Text("Capetão Flag"),
              accountEmail: new Text("capetaoflag@vaca.com"),
              onDetailsPressed: () {},
              currentAccountPicture: new GestureDetector(
                onTap: () => print("This is your photo profile"),
                child: new CircleAvatar(
                  backgroundImage:
                      new NetworkImage("https://i.imgur.com/4Pr50fl.png"),
                ),
              ),
              decoration: new BoxDecoration(
                  image: new DecorationImage(
                      fit: BoxFit.fill,
                      image: new NetworkImage(
                          "https://img00.deviantart.net/35f0/i/2015/018/2/6/low_poly_landscape__the_river_cut_by_bv_designs-d8eib00.jpg"))),
            ),
            new ListTile(
              title: new Text("Home Page"),
              leading: new Icon(Icons.home),
              onTap: () => Navigator.of(context).push(new MaterialPageRoute(
                  builder: (BuildContext context) => new HomePage())),
            ),
            new ListTile(
              title: new Text("Bookings page"),
              leading: new Icon(Icons.event_note),
              onTap: () {},
              trailing: new Chip(
                backgroundColor: Colors.teal,
                label: new Text(
                  '3',
                ),
              ),
            ),
            new ListTile(
              title: new Text("Profile"),
              leading: new Icon(Icons.account_circle),
              onTap: () {},
            ),
            new Divider(),
            new ListTile(
              title: new Text("Sign Out"),
              leading: new Icon(Icons.power_settings_new),
              onTap: () => Navigator.of(context).pushNamed('/loginScreen'), // Rota que leva de volta a "LoginPage"
            ),
          ],
        ),
      ),
      body: new Column(
        children: <Widget>[
          new Container(
              padding: new EdgeInsets.symmetric(
                  vertical: 30.0), //padding vertical
              child: new Text(
                'Select The Service',
                style: TextStyle(
                  fontSize: mediaQueryData * 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey[800],
                ),
              )),
          new Expanded(child: TheGridView().build(context)),
        ],
      ),
    ));
  }
}

class TheGridView { 
  makeGridCell(String name, String image, Function callback) {
    return GestureDetector(
      onTap: callback,
      child: Card(
        margin: EdgeInsets.all(12.0),
        elevation: 5.0,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch, //alinhamento da coluna para o centro da tela
          mainAxisSize: MainAxisSize.min, //tamanho vertical mínimo
          verticalDirection: VerticalDirection.down,
          children: <Widget>[
            new SizedBox(height: 30.0), 
            Center(
              child: Image.asset(image, width: 80.0, height: 80.0), //tamanho da imagem do card
            ),
            new SizedBox(height: 15.0),
            Center(
                child: Text(
              name,
              textAlign: TextAlign.end, //alinhamento do texto na parte inferior
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.grey[800],
              ),
            )),
          ],
        ),
      ),
    );
  }

  GridView build(context) { //construção e utilização da classe GridView criada
    final mediaQueryData = MediaQuery.of(context).size.width / 400;
    return GridView.count(
      primary: true,
      padding: EdgeInsets.all(mediaQueryData * 1),
      crossAxisCount: 2,
      childAspectRatio: mediaQueryData * 1,
      mainAxisSpacing: mediaQueryData * 1,
      crossAxisSpacing: mediaQueryData * 1,
      children: <Widget>[
        makeGridCell("Motor", "assets/motor.png",
            () => Navigator.of(context).pushNamed('/serviceScreen')),
        makeGridCell("Tire Shop", "assets/borracharia.png",
            () => Navigator.of(context).pushNamed('/serviceScreen')),
        makeGridCell("Eletric", "assets/eletrico.png",
            () => Navigator.of(context).pushNamed('/serviceScreen')),
        makeGridCell("Wash", "assets/lavagem.png",
            () => Navigator.of(context).pushNamed('/serviceScreen')),
        makeGridCell("Upholstered", "assets/estofado.png",
            () => Navigator.of(context).pushNamed('/serviceScreen')),
        makeGridCell("BodyWork", "assets/lataria.png",
            () => Navigator.of(context).pushNamed('/serviceScreen')),
      ],
    );
  }
}

void choiceAction(String choice) { //PopUpMenuButton
  if (choice == Constants.Settings) {
    print('Settings');
  } else if (choice == Constants.Help) {
    print('Help');
  }
}
