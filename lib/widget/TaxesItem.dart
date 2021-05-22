import 'package:flutter/material.dart';
import 'package:proyect/model/TaxesModel.dart';

class TaxesItem extends StatelessWidget {
  final TaxesModel taxesModel;

  TaxesItem({this.taxesModel});
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: 120,
      child: Container(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                decoration: BoxDecoration(
                  color: Colors.blueGrey,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Center(
                  child: Image.asset('assets/img/doc-icon.png'),
                ),
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: Container(
                        //color: Colors.blueGrey,
                        child: Text(
                          taxesModel.subject,
                          style: TextStyle(
                            fontSize: 18.0,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        //color: Colors.blueGrey,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(vertical: 2.0),
                              child: Text(
                                "Vigencia: ${taxesModel.iniDate} - ${taxesModel.finDate}",
                                style: TextStyle(
                                  fontSize: 16.0,
                                  color: Colors.white70,
                                ),
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(vertical: 2.0),
                              child: Text(
                                "Retención: ${(taxesModel.tax)}",
                                style: TextStyle(
                                  fontSize: 18.0,
                                  color: Colors.white70,
                                ),
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(vertical: 2.0),
                              child: Text(
                                "Valor: ${taxesModel.value}",
                                style: TextStyle(
                                  fontSize: 18.0,
                                  color: Colors.white70,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
