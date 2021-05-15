import 'package:flutter/material.dart';
import 'package:proyect/model/ServiceItemMoldel.dart';

class ServiceItem extends StatelessWidget {
  final ServiceItemModel serviceModel;
  ServiceItem({this.serviceModel});
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
                  child: Image.asset(this.serviceModel.srcLogo),
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
                          serviceModel.name,
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
                        child: Text(
                          serviceModel.description,
                          style: TextStyle(
                            fontSize: 18.0,
                            color: Colors.white70,
                          ),
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
