import 'package:flutter/material.dart';
import 'package:proyect/page/HomePage.dart';
import 'package:proyect/page/LoginPage.dart';
import 'package:proyect/page/RegistroEmplePage.dart';
import 'package:proyect/page/ServicePage.dart';

class MenuBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
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
                    child: Image.asset("assets/avatar-icon.png"),
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
                  Navigator.pop(context);
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
                title: Text('Mi cuenta', style: TextStyle(color: Colors.black)),
                onTap: () {
                  // Update the state of the app
                  // ...
                  // Then close the drawer
                  Navigator.pop(context);
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => RegistroEmplePage()),
                  );
                },
              ),
            ),
            Container(
              decoration: BoxDecoration(
                border: Border.all(width: 1, color: Colors.blue),
              ),
              child: Center(
                child: ListTile(
                  title:
                      Text('Beneficios', style: TextStyle(color: Colors.black)),
                  onTap: () {
                    // Update the state of the app
                    // ...
                    // Then close the drawer
                    Navigator.pop(context);
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => ServicePage()),
                    );
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
    );
  }
}
