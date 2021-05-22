import 'dart:convert' as convert;
import 'package:http/http.dart' as http;
import 'package:proyect/helper/SessioData.dart';
import 'package:proyect/model/EmployeeModel.dart';

class EmployerProvider {
  List<TaxesModel> listEmployee = [];
  Future<List<TaxesModel>> getEmployees() async {
    String _id = SessionData.id;
    var url = Uri.https('comfameta-default-rtdb.firebaseio.com',
        '/Employer/$_id/Employee.json', {"print": "pretty"});

    var response = await http.get(url);

    if (response.statusCode == 200) {
      var jsonResponse =
          convert.jsonDecode(response.body) as Map<String, dynamic>;
      jsonResponse.forEach((key, value) => listEmployee.add(
            TaxesModel.fromJson(value),
          ));
    }
    return listEmployee;
  }

  Future<bool> saveEmployee(TaxesModel employee) async {
    String _id = SessionData.id;
    String _ide = employee.numDoc;
    var _body = convert.jsonEncode(employee.toJson());
    var url = Uri.https('comfameta-default-rtdb.firebaseio.com',
        '/Employer/$_id/Employee/$_ide.json');

    var response = await http.put(url, body: _body);

    if (response.hashCode == 200) {
      print("Success!");
      return true;
    }
    print(response.reasonPhrase);
    return false;
  }
}
