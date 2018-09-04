import 'package:flutter/material.dart';
import 'constants.dart';

class ServicePage extends StatelessWidget {
  static String servicePage;
  @override
  Widget build(BuildContext context) {
    final mediaQueryData = MediaQuery.of(context).size.width / 400;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          leading: new IconButton(
            icon: new Icon(Icons.arrow_back, color: Colors.white),
            onPressed: () => Navigator.pop(context),
          ),
          backgroundColor: Colors.teal,
          title: const Text('Service'),
          actions: <Widget>[
            IconButton(
              icon: new Icon(Icons.search),
              onPressed: () {},
            ),
            PopupMenuButton<String>(
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
        body: new Column(
          children: <Widget>[
            new SizedBox(height: mediaQueryData * 30),
            new Container(
                child: new Text(
              'Select The Type of Help',
              style: TextStyle(
                fontSize: mediaQueryData * 24,
                fontWeight: FontWeight.bold,
                color: Colors.grey[800],
              ),
            )),
            new SizedBox(height: mediaQueryData * 30),
            new Expanded(child: TheGridView().build(context)),
          ],
        ),
      ),
    );
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
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisSize: MainAxisSize.min,
          verticalDirection: VerticalDirection.down,
          children: <Widget>[
            new SizedBox(height: 30.0),
            Center(child: Image.asset(image, width: 80.0, height: 80.0)),
            new SizedBox(height: 15.0),
            Center(
                child: Text(
              name,
              textAlign: TextAlign.end,
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

  GridView build(context) {
    final mediaQueryData = MediaQuery.of(context).size.width / 400;
    return GridView.count(
      primary: true,
      padding: EdgeInsets.all(mediaQueryData * 1),
      crossAxisCount: 2,
      childAspectRatio: mediaQueryData * 1,
      mainAxisSpacing: mediaQueryData * 1,
      crossAxisSpacing: mediaQueryData * 1,
      children: <Widget>[
        makeGridCell("Solve Alone", "assets/resolver.png",
            () => Navigator.of(context).pushNamed('/homeScreen')),
        makeGridCell("Request Mechanic", "assets/mecanico.png",
            () => Navigator.of(context).pushNamed('/mapScreen')),
      ],
    );
  }
}

void choiceAction(String choice) {
  if (choice == Constants.Settings) {
    print('Settings');
  } else if (choice == Constants.Help) {
    print('Help');
  }
}
