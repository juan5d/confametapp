class TaxesModel {
  TaxesModel({
    this.finDate,
    this.iniDate,
    this.subject,
    this.tax,
    this.value,
  });

  String finDate;
  String iniDate;
  String subject;
  int tax;
  int value;

  factory TaxesModel.fromJson(Map<String, dynamic> json) => TaxesModel(
        finDate: json["fin_date"],
        iniDate: json["ini_date"],
        subject: json["subject"],
        tax: json["tax"],
        value: json["value"],
      );

  Map<String, dynamic> toJson() => {
        "fin_date": finDate,
        "ini_date": iniDate,
        "subject": subject,
        "tax": tax,
        "value": value,
      };
}
