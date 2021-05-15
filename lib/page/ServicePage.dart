import 'package:flutter/material.dart';
import 'package:proyect/widget/MenuBar.dart';
import 'package:proyect/widget/ServiceItem.dart';
import 'package:proyect/provider/ServicesProvider.dart';

class ServicePage extends StatefulWidget {
  @override
  _ServicePageState createState() => _ServicePageState();
}

class _ServicePageState extends State<ServicePage> {
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
      appBar: AppBar(
        title: Center(child: Text("Mis servicios")),
      ),
      drawer: MenuBar(),
      body: ListView(
        children: list,
      ),
    );
  }
}
