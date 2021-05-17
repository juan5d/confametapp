import 'package:proyect/model/ServiceItemMoldel.dart';
import 'package:proyect/widget/ServiceItem.dart';

class ServicesProvider {
  List<ServiceItem> items = [];

  final List<ServiceItemModel> itemsModel = [
    ServiceItemModel(
        name: "Subsidios",
        description:
            "Consulte el estado de los subsidios a los que tiene derecho",
        srcLogo: "assets/img/Subsidy.png"),
    ServiceItemModel(
        name: "Vivienda",
        description:
            "Conozca el proceso o consulte información de su postulación",
        srcLogo: "assets/img/House.png"),
    ServiceItemModel(
        name: "Educación",
        description: "Consulte los cursos y programas de formación",
        srcLogo: "assets/img/Education.png"),
    ServiceItemModel(
        name: "Empleo",
        description: "Consulte las ofertas laborales disponibles",
        srcLogo: "assets/img/Job.png"),
    ServiceItemModel(
        name: "Crédito",
        description: "Consulte y solicite productos de crédito",
        srcLogo: "assets/img/Credit.png"),
    ServiceItemModel(
        name: "Cultura",
        description: "Consulte los concursos y talleres culturales",
        srcLogo: "assets/img/Culture.png"),
    ServiceItemModel(
        name: "Turismo",
        description: "Consulte los centros y planes turisticos",
        srcLogo: "assets/img/Tourism.png"),
    ServiceItemModel(
        name: "Recreación",
        description: "Consulte los programas y centros recreativos",
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
