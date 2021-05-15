import 'package:proyect/model/ServiceItemMoldel.dart';
import 'package:proyect/widget/ServiceItem.dart';

class ServicesProvider {
  List<ServiceItem> items = [];

  final List<ServiceItemModel> itemsModel = [
    ServiceItemModel(
        name: "Subsidios",
        description: "Descripción de Subsidios...",
        srcLogo: "assets/img/Subsidy.png"),
    ServiceItemModel(
        name: "Vivienda",
        description: "Descripción de Vivienda...",
        srcLogo: "assets/img/House.png"),
    ServiceItemModel(
        name: "Educación",
        description: "Descripción de Educación...",
        srcLogo: "assets/img/Education.png"),
    ServiceItemModel(
        name: "Empleo",
        description: "Descripción de Empleo...",
        srcLogo: "assets/img/Job.png"),
    ServiceItemModel(
        name: "Crédito",
        description: "Descripción de Crédito...",
        srcLogo: "assets/img/Credit.png"),
    ServiceItemModel(
        name: "Cultura",
        description: "Descripción de Cultura...",
        srcLogo: "assets/img/Culture.png"),
    ServiceItemModel(
        name: "Turismo",
        description: "Descripción de Turismo...",
        srcLogo: "assets/img/Tourism.png"),
    ServiceItemModel(
        name: "Recreación",
        description: "Descripción de Recreación...",
        srcLogo: "assets/img/Recreation.png"),
  ];

  getServicesList() {
    this.itemsModel.forEach((serviceModel) {
      this.items.add(
            ServiceItem(serviceModel: serviceModel),
          );
    });

    return items;
  }
}
