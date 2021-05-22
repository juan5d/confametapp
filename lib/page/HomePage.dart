import 'package:flutter/material.dart';
import 'package:proyect/helper/SessioData.dart';
import 'package:proyect/page/RegistroEmplePage.dart';
import 'package:proyect/page/ServicePage.dart';
import 'package:proyect/widget/MenuBar.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("COMFAMETA")),
      drawer: MenuBar(),
      body: Column(
        children: [
          Container(
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/img/fondo.jpg'),
                    fit: BoxFit.fitWidth)),
            child: Container(
              height: 230.0,
              child: Center(
                  child: Padding(
                padding: const EdgeInsets.fromLTRB(10, 130, 10, 0),
                child: Text(
                  'BIENVENIDO A COMFAMETAPP',
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
                "En este portal podrá encontrar todo lo relacionado a su estado en la caja de compensación Comfameta"),
          ),
          Container(
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 80.0),
              child: RaisedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => (SessionData.userType == 1)
                            ? ServicePage()
                            : RegistroEmplePage()),
                  );
                },
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(24),
                ),
                padding: EdgeInsets.fromLTRB(100, 20, 100, 20),
                color: Colors.blue,
                child: Text('Consultar', style: TextStyle(color: Colors.white)),
              ),
            ),
          )
        ],
      ),
    );
  }
}
