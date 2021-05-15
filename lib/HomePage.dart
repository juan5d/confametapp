import 'dart:html';

import 'package:flutter/material.dart';
import 'package:proyect/LoginPage.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("title")),
      body: Column(
        children: [
          Container(
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('/fondo.jpg'), fit: BoxFit.fitWidth)),
            child: Container(
              height: 230.0,
              child: Center(
                  child: Padding(
                padding: const EdgeInsets.fromLTRB(10, 130, 10, 0),
                child: Text(
                  'BIENVENIDO A CONFAMETAPP',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 35.0,
                      fontWeight: FontWeight.bold),
                ),
              )),
            ),
          ),
          Container(
            padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
            child: Text(
                "En este portal podrá encontrar todo lo relacionado a su estado en la caja de compensación Condameta"),
          ),
          Container(
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 80.0),
              child: RaisedButton(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(24),
                ),
                /* onPressed: _sendToServer, */
                padding: EdgeInsets.fromLTRB(100, 20, 100, 20),
                color: Colors.blue,
                child: Text('Consultar', style: TextStyle(color: Colors.white)),
              ),
            ),
          )
        ],
      ),
      drawer: Drawer(
        // Add a ListView to the drawer. This ensures the user can scroll
        // through the options in the drawer if there isn't enough vertical
        // space to fit everything.
        child: Container(
          width: MediaQuery.of(context).size.width / 2,
          color: Colors.white,
          child: ListView(
            // Important: Remove any padding from the ListView.
            padding: EdgeInsets.zero,
            children: <Widget>[
              Container(
                height: 140.0,
                child: DrawerHeader(
                  decoration: BoxDecoration(
                    color: Colors.white,
                  ),
                  child: CircleAvatar(
                    radius: 50,
                    child: ClipOval(
                      child: Image.network(
                        'assets/avatar-icon-images-4.png',
                      ),
                    ),
                  ),
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  border: Border.all(width: 1, color: Colors.blue),
                ),
                child: ListTile(
                  title: Text('Inicio', style: TextStyle(color: Colors.black)),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => HomePage()),
                    );
                    // Update the state of the app
                    // ...
                    // Then close the drawer
                  },
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  border: Border.all(width: 1, color: Colors.blue),
                ),
                child: ListTile(
                  title:
                      Text('Mi cuenta', style: TextStyle(color: Colors.black)),
                  onTap: () {
                    // Update the state of the app
                    // ...
                    // Then close the drawer
                    Navigator.pop(context);
                  },
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  border: Border.all(width: 1, color: Colors.blue),
                ),
                child: Center(
                  child: ListTile(
                    title: Text('Beneficios',
                        style: TextStyle(color: Colors.black)),
                    onTap: () {
                      // Update the state of the app
                      // ...
                      // Then close the drawer
                      Navigator.pop(context);
                    },
                  ),
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  border: Border.all(width: 1, color: Colors.blue),
                ),
                child: Center(
                  child: ListTile(
                    title: Text('Cerrar Sesión',
                        style: TextStyle(color: Colors.black)),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => LoginPage()),
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
