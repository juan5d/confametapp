import 'package:flutter/material.dart';

import 'package:proyect/model/EmployeeModel.dart';

class EmployeeItem extends StatelessWidget {
  final EmployeeModel employeeModel;
  EmployeeItem({this.employeeModel});
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
                  child: Image.asset((employeeModel.gender == 'M')
                      ? 'assets/img/Man.png'
                      : 'assets/img/Woman.png'),
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
                          employeeModel.name,
                          style: TextStyle(
                            fontSize: 20.0,
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
                                "${employeeModel.tipDoc} \t ${employeeModel.numDoc}",
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
                                "Genero: ${(employeeModel.gender)}",
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
                                "Edad: ${employeeModel.age}",
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
