import 'package:flutter/material.dart';
import 'package:proyect/helper/FormValidator.dart';
import 'package:proyect/model/EmployeeModel.dart';
import 'package:proyect/provider/TaxesProvider.dart';
import 'package:proyect/widget/MenuBar.dart';
import 'package:proyect/widget/TaxesItem.dart';

class ProveedorPage extends StatefulWidget {
  @override
  _ProveedorPageState createState() => _ProveedorPageState();
}

class _ProveedorPageState extends State<ProveedorPage> {
  GlobalKey<FormState> _keyForm = new GlobalKey();
  final nameCtrl = new TextEditingController();
  final numdoCtrl = new TextEditingController();
  final ageCtrl = new TextEditingController();
  List _tipDoc = ["CC", "NIT"];
  var _tipDocVal = "CC";

  final TaxesProvider taxesProvider = TaxesProvider();
  TaxesModel taxes;

  Future<List<TaxesModel>> listE;

  processData() {
    setState(() {
      numdoCtrl.clear();
      ageCtrl.clear();
      _tipDocVal = "CC";
      listE = taxesProvider.getTaxes();
    });
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MenuBar(),
      appBar: AppBar(
        title: Text("Consulta proveedores"),
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
                          child: Text("# de documento",
                              style: TextStyle(fontSize: 18.0)),
                        ),
                        TextFormField(
                          controller: numdoCtrl,
                          validator: FormValidator().validateDoc,
                          decoration: InputDecoration(
                            labelText: 'Ingrese # documento o NIT',
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
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Expanded(
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 10.0),
                                child: ElevatedButton(
                                  child: Text(
                                    "Consultar",
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
                                              ProveedorPage()),
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
                      List<TaxesItem> listView = [];
                      snapshot.data.forEach((element) {
                        listView.add(
                          TaxesItem(taxesModel: element),
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
