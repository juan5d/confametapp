import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:http/http.dart';

class PrincipalPage extends StatefulWidget {
  PrincipalPage({Key key}) : super(key: key);

  @override
  _PrincipalPageState createState() => _PrincipalPageState();
}

class _PrincipalPageState extends State<PrincipalPage> {
  void _inc() {
    _saveData(new Todo(false, "Todo"));
    _loadData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: FloatingActionButton(
        onPressed: _inc,
      )),
    );
  }
}

const jsonCodec = const JsonCodec();
final url = Uri.https('tenacious-crane-291714-default-rtdb.firebaseio.com',
    '/prueba/1121.json', {'q': '{http}'});
final httpClient = new Client();

_loadData() async {
  var response = await httpClient.get(url);
  print('response=' + response.body);
  var todos = jsonCodec.decode(response.body);

  print(todos.length.toString());
}

_saveData(Todo todo) async {
  var json = jsonCodec.encode(todo);
  print("json=$json");

  var response = await httpClient.patch(url, body: json);
  print('response=' + response.body);
}

class Todo {
  bool finished;
  String name;
  Todo(this.finished, this.name);

  Map toJson() {
    return {"finished": finished, "name": name};
  }
}
/* import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

class PrincipalPage extends StatefulWidget {
  @override
  _PrincipalPageState createState() => _PrincipalPageState();
}

class _PrincipalPageState extends State<PrincipalPage> {
  @override
  void initState() {
    super.initState();
    getUsers();
  }

  Future<void> getUsers() async {
    CollectionReference collectionReference =
        FirebaseFirestore.instance.collection("user");

    QuerySnapshot users = await collectionReference.get();
    if (users.docs.length != 0) {
      for (var doc in users.docs) {
        print(doc.data());
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(child: new Scaffold());
  }
}
 */
