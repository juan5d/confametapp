import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';

class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

String _id = '1121';

class _RegisterPageState extends State<RegisterPage> {
  // void _inc() {
  //   _loadData();
  // }

  GlobalKey<FormState> keyForm = new GlobalKey();
  TextEditingController nameCtrl = new TextEditingController();
  TextEditingController nameECtrl = new TextEditingController();
  TextEditingController nitCtrl = new TextEditingController();
  TextEditingController idCtrl = new TextEditingController();
  TextEditingController emailCtrl = new TextEditingController();
  TextEditingController mobileCtrl = new TextEditingController();
  TextEditingController passwordCtrl = new TextEditingController();
  TextEditingController repeatPassCtrl = new TextEditingController();
  String _currentSelectedItem = "CC";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: new Text('Registrarse'),
      ),
      body: new SingleChildScrollView(
        child: new Container(
          margin: new EdgeInsets.all(10.0),
          child: new Form(
            key: keyForm,
            child: formUI(),
          ),
        ),
      ),
    );
  }

  formItemsDesign(icon, item) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 0),
      child: Card(child: ListTile(leading: Icon(icon), title: item)),
    );
  }

  String gender = 'hombre';
  bool _isVisible = false;
  var your_list = ["CC", "TI"];

  Widget formUI() {
    return Column(
      children: <Widget>[
        formItemsDesign(
            Icons.person,
            TextFormField(
              controller: nameCtrl,
              decoration: new InputDecoration(
                labelText: 'Nombre',
              ),
              validator: validateName,
            )),
/*         formItemsDesign(
            Icons.phone,
            TextFormField(
              controller: mobileCtrl,
              decoration: new InputDecoration(
                labelText: 'Numero de telefono',
              ),
              keyboardType: TextInputType.phone,
              maxLength: 10,
              validator: validateMobile,
            )), */
        if (_isVisible)
          formItemsDesign(
              Icons.work,
              TextFormField(
                controller: nameECtrl,
                decoration: new InputDecoration(
                  labelText: 'Nombre de la Empresa',
                ),
                validator: validateName,
              )),
        formItemsDesign(
            null,
            Column(children: <Widget>[
              RadioListTile<String>(
                title: const Text('Empleado'),
                value: 'hombre',
                groupValue: gender,
                onChanged: (value) {
                  setState(() {
                    gender = value;
                  });
                  _isVisible = false;
                  your_list = ["CC", "TI"];
                  _currentSelectedItem = "CC";
                },
              ),
              RadioListTile<String>(
                title: const Text('Empresa'),
                value: 'mujer',
                groupValue: gender,
                onChanged: (value) {
                  setState(() {
                    gender = value;
                  });
                  _isVisible = true;
                  your_list = ["Sociedad Anónima", "Sociedad Limitada"];
                  _currentSelectedItem = "Sociedad Anónima";
                },
              )
            ])),
        formItemsDesign(
          Icons.person,
          Stack(
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(top: 0, left: 56.0, right: 0.0),
                child: DropdownButton(
                  isExpanded: true,
                  items: your_list.map(
                    (val) {
                      return DropdownMenuItem(
                        value: val,
                        child: Text(val),
                      );
                    },
                  ).toList(),
                  value: _currentSelectedItem,
                  onChanged: (value) {
                    setState(() {
                      _currentSelectedItem = value;
                    });
                  },
                ),
              )
            ],
          ),
        ),
        if (!_isVisible)
          formItemsDesign(
              Icons.work,
              TextFormField(
                controller: idCtrl,
                decoration: new InputDecoration(
                  labelText: '# de identificacion',
                ),
                validator: validateMobile,
              )),
        if (_isVisible)
          formItemsDesign(
              Icons.work,
              TextFormField(
                controller: idCtrl,
                decoration: new InputDecoration(
                  labelText: 'Nit',
                ),
                maxLength: 10,
                validator: validateMobile,
              )),
        formItemsDesign(
            Icons.email,
            TextFormField(
              controller: emailCtrl,
              decoration: new InputDecoration(
                labelText: 'Email',
              ),
              keyboardType: TextInputType.emailAddress,
              maxLength: 32,
              validator: validateEmail,
            )),
        formItemsDesign(
            Icons.remove_red_eye,
            TextFormField(
              controller: passwordCtrl,
              obscureText: true,
              decoration: InputDecoration(
                labelText: 'Contraseña',
              ),
            )),
        formItemsDesign(
            Icons.remove_red_eye,
            TextFormField(
              controller: repeatPassCtrl,
              obscureText: true,
              decoration: InputDecoration(
                labelText: 'Repetir la Contraseña',
              ),
              validator: validatePassword,
            )),
        GestureDetector(
            onTap: () {
              save();
            },
            child: Container(
              margin: new EdgeInsets.all(30.0),
              alignment: Alignment.center,
              decoration: ShapeDecoration(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0)),
                gradient: LinearGradient(colors: [
                  Color(0xFF0EDED2),
                  Color(0xFF03A0FE),
                ], begin: Alignment.topLeft, end: Alignment.bottomRight),
              ),
              child: Text("Guardar",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.w500)),
              padding: EdgeInsets.only(top: 16, bottom: 16),
            ))
      ],
    );
  }

  String validatePassword(String value) {
    print("valorrr $value passsword ${passwordCtrl.text}");
    if (value != passwordCtrl.text) {
      return "Las contraseñas no coinciden";
    }
    return null;
  }

  String validateName(String value) {
    String pattern = r'(^[a-zA-Z ]*$)';
    RegExp regExp = new RegExp(pattern);
    if (value.length == 0) {
      return "El nombre es necesario";
    } else if (!regExp.hasMatch(value)) {
      return "El nombre debe de ser a-z y A-Z";
    }
    return null;
  }

  String validateMobile(String value) {
    _id = value;
    //String patttern = r'(^[0-9]*$)';
    // RegExp regExp = new RegExp(patttern);
    if (value.length == 0) {
      return "El id es necesariod";
    }
    /* else if (value.length != 10) {
      return "El id debe tener 10 digitos";
    } */
    return null;
  }

  String validateEmail(String value) {
    String pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regExp = new RegExp(pattern);
    if (value.length == 0) {
      return "El correo es necesario";
    } else if (!regExp.hasMatch(value)) {
      return "Correo invalido";
    } else {
      return null;
    }
  }

  save() {
    if (keyForm.currentState.validate()) {
      print("Nombre ${nameCtrl.text}");
      /* print("Telefono ${mobileCtrl.text}"); */
      print("Correo ${emailCtrl.text}");
      print("Correo ${passwordCtrl.text}");
      _saveData(new Todo(
          nameCtrl.text.toString(),
          nameECtrl.text.toString(),
          _currentSelectedItem,
          idCtrl.text.toString(),
          emailCtrl.text.toString(),
          passwordCtrl.text.toString()));
      keyForm.currentState.reset();
    }
  }
}

const jsonCodec = const JsonCodec();
final url = Uri.https('tenacious-crane-291714-default-rtdb.firebaseio.com',
    '/prueba/usuarios/' + _id.toString() + '.json', {'q': '{http}'});
final httpClient = new Client();

// _loadData() async {
//   var response = await httpClient.get(url);
//   print('response=' + response.body);
//   var todos = jsonCodec.decode(response.body);

//   print(todos.length.toString());
// }

_saveData(Todo todo) async {
  var json = jsonCodec.encode(todo);
  print("json=$json");

  var response = await httpClient.patch(url, body: json);
  print('response=' + response.body);
}

class Todo {
  bool finished;
  String name, nameCompany, typeId, id, nit, email, password;
  Todo(this.name, this.nameCompany, this.typeId, this.id, this.email,
      this.password);

  Map toJson() {
    return {
      "name": name,
      "name_company": nameCompany,
      "type_id": typeId,
      "id": id,
      "email": email,
      "password": password
    };
  }
}
