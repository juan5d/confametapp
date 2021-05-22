import 'dart:convert' as convert;
import 'package:http/http.dart' as http;
import 'package:proyect/model/TaxesModel.dart';

class TaxesProvider {
  List<TaxesModel> listTaxes = [];

  Future<List<TaxesModel>> getTaxes() async {
    var url = Uri.https('comfameta-default-rtdb.firebaseio.com',
        '/Supplier/1121/Services.json', {"print": "pretty"});

    var response = await http.get(url);

    if (response.statusCode == 200) {
      var jsonResponse =
          convert.jsonDecode(response.body) as Map<String, dynamic>;
      jsonResponse.forEach((key, value) => listTaxes.add(
            TaxesModel.fromJson(value),
          ));
      print(listTaxes);
    }
    return listTaxes;
  }
}
