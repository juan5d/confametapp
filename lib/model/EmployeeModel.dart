class TaxesModel {
  TaxesModel({this.name, this.numDoc, this.tipDoc, this.age, this.gender});

  String name;
  String numDoc;
  String tipDoc;
  String age;
  String gender;

  factory TaxesModel.fromJson(Map<String, dynamic> json) => TaxesModel(
        name: json["name"],
        numDoc: json["num_doc"],
        tipDoc: json["tip_doc"],
        age: json["age"],
        gender: json["gender"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "num_doc": numDoc,
        "tip_doc": tipDoc,
        "age": age,
        "gender": gender,
      };
}
