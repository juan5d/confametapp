import 'package:flutter/material.dart';
import 'package:proyect/helper/FormValidator.dart';
import 'package:proyect/model/EmployeeModel.dart';
import 'package:proyect/provider/EmployerProvider.dart';
import 'package:proyect/provider/ServicesProvider.dart';
import 'package:proyect/widget/EmployeeItem.dart';
import 'package:proyect/widget/MenuBar.dart';
import 'package:proyect/widget/ServiceItem.dart';

class RegistroEmplePage extends StatefulWidget {
  @override
  _RegistroEmplePageState createState() => _RegistroEmplePageState();
}

class _RegistroEmplePageState extends State<RegistroEmplePage> {
  GlobalKey<FormState> _keyForm = new GlobalKey();
  final nameCtrl = new TextEditingController();
  final numdoCtrl = new TextEditingController();
  final ageCtrl = new TextEditingController();
  List _tipDoc = ["CC", "TI", "PE", "PA"];
  var _tipDocVal = "CC";
  var _selectedGender = '';
  final ServicesProvider provider = ServicesProvider();
  final EmployerProvider employerProvider = EmployerProvider();
  EmployeeModel employee;

  List<ServiceItem> list = [];
  Future<List<EmployeeModel>> listE;

  processData() {
    employee = EmployeeModel(
        name: nameCtrl.text,
        tipDoc: _tipDocVal,
        numDoc: numdoCtrl.text,
        age: ageCtrl.text,
        gender: _selectedGender);

    employerProvider.saveEmployee(employee);

    setState(() {
      nameCtrl.clear();
      numdoCtrl.clear();
      ageCtrl.clear();
      _selectedGender = '';
      _tipDocVal = "CC";
      listE = employerProvider.getEmployees();
    });
  }

  @override
  void initState() {
    listE = employerProvider.getEmployees();
    list = provider.getServicesList();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MenuBar(),
      appBar: AppBar(
        title: Text("Registro de empleados"),
      ),
      body: Container(
        alignment: Alignment.center,
        child: Column(
          children: [
            Container(
              height: 400,
              child: SingleChildScrollView(
                child: Form(
                  key: _keyForm,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 18.0, vertical: 8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8.0),
                          child:
                              Text("Nombre", style: TextStyle(fontSize: 18.0)),
                        ),
                        TextFormField(
                          controller: nameCtrl,
                          validator: FormValidator().validateName,
                          decoration: InputDecoration(
                            labelText: 'Ingrese nombre',
                            fillColor: Colors.white,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(18.0),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8.0),
                          child: Text("Tipo de identificación",
                              style: TextStyle(fontSize: 18.0)),
                        ),
                        InputDecorator(
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.white,
                            contentPadding: EdgeInsets.fromLTRB(8, 3, 8, 3),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(18.0),
                            ),
                          ),
                          child: DropdownButtonHideUnderline(
                            child: DropdownButton(
                              dropdownColor: Colors.white,
                              icon: Icon(
                                Icons.arrow_drop_down,
                                color: Colors.black,
                              ),
                              style: TextStyle(
                                  color: Colors.black, fontSize: 18.0),
                              isExpanded: true,
                              value: _tipDocVal,
                              onChanged: (value) {
                                setState(() {
                                  _tipDocVal = value;
                                });
                              },
                              items: _tipDoc
                                  .map(
                                    (element) => DropdownMenuItem(
                                      value: element,
                                      child: Text(element),
                                    ),
                                  )
                                  .toList(),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8.0),
                          child: Text("# de identificación",
                              style: TextStyle(fontSize: 18.0)),
                        ),
                        TextFormField(
                          controller: numdoCtrl,
                          validator: FormValidator().validateDoc,
                          decoration: InputDecoration(
                            labelText: 'Ingrese identificación',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(18.0),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8.0),
                          child: Text("Sexo", style: TextStyle(fontSize: 18.0)),
                        ),
                        Row(children: [
                          Expanded(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Radio(
                                  value: 'M',
                                  groupValue: _selectedGender,
                                  onChanged: (value) {
                                    setState(() {
                                      _selectedGender = value;
                                    });
                                  },
                                ),
                                Text("Masculino",
                                    style: TextStyle(fontSize: 18.0)),
                              ],
                            ),
                          ),
                          Expanded(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Radio(
                                  value: 'F',
                                  groupValue: _selectedGender,
                                  onChanged: (value) {
                                    setState(() {
                                      _selectedGender = value;
                                    });
                                  },
                                ),
                                Text("Femenino",
                                    style: TextStyle(fontSize: 18.0)),
                              ],
                            ),
                          )
                        ]),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8.0),
                          child: Text("Edad", style: TextStyle(fontSize: 18.0)),
                        ),
                        TextFormField(
                          controller: ageCtrl,
                          validator: FormValidator().validateAge,
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            labelText: 'Ingrese la edad',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(18.0),
                            ),
                          ),
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Expanded(
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 10.0),
                                child: ElevatedButton(
                                  child: Text(
                                    "Registrar",
                                    style: TextStyle(
                                        fontSize: 18.0,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  style: ElevatedButton.styleFrom(
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(32.0),
                                    ),
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 22.0),
                                  ),
                                  onPressed: () {
                                    if (_keyForm.currentState.validate())
                                      processData();

                                    Navigator.pop(context);
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              RegistroEmplePage()),
                                    );
                                  },
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              child: Container(
                color: Colors.grey[900],
                child: FutureBuilder(
                  future: listE,
                  builder: (BuildContext context, AsyncSnapshot snapshot) {
                    if (snapshot.hasData) {
                      List<EmployeeItem> listView = [];
                      snapshot.data.forEach((element) {
                        listView.add(
                          EmployeeItem(employeeModel: element),
                        );
                      });

                      return ListView(
                        children: listView,
                      );
                    }

                    return Center(
                      child: CircularProgressIndicator(),
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
