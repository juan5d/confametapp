import 'package:flutter/material.dart';
import 'package:proyect/provider/ServicesProvider.dart';
import 'package:proyect/widget/MenuBar.dart';
import 'package:proyect/widget/ServiceItem.dart';

class RegEmplePage extends StatefulWidget {
  @override
  _RegEmplePageState createState() => _RegEmplePageState();
}

class _RegEmplePageState extends State<RegEmplePage> {
  GlobalKey<FormState> keyForm = new GlobalKey();
  List _tipDoc = ["CC", "TI", "PE", "PA"];
  var _tipDocVal = "CC";
  final ServicesProvider provider = ServicesProvider();
  List<ServiceItem> list = [];
  @override
  void initState() {
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
              child: Form(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 18.0, vertical: 8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Nombre"),
                      TextFormField(
                        decoration: InputDecoration(
                          labelText: 'Nombre',
                          fillColor: Colors.white,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(32.0),
                          ),
                        ),
                      ),
                      Text("Tipo de identificación"),
                      InputDecorator(
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          contentPadding: EdgeInsets.only(left: 8.0),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(32.0),
                          ),
                        ),
                        child: DropdownButtonHideUnderline(
                          child: DropdownButton(
                            dropdownColor: Colors.white,
                            icon: Icon(
                              Icons.arrow_drop_down,
                              color: Colors.black,
                            ),
                            style: TextStyle(color: Colors.black),
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
                      Text("# de identificación"),
                      TextFormField(
                        decoration: InputDecoration(
                          labelText: 'Ingrese identificación',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(32.0),
                          ),
                        ),
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Expanded(
                            child: ElevatedButton(
                              child: Text(
                                "Registrar",
                                style: TextStyle(),
                              ),
                              onPressed: () {},
                              style: ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(32.0),
                                ),
                                padding:
                                    const EdgeInsets.symmetric(vertical: 20.0),
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
            Expanded(
              child: Container(
                color: Colors.grey[900],
                child: ListView(
                  children: list,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
