class ProductRequiredExtrasModel {
  int id;
  String name;
  int min;
  int max;
  bool hasValue = false;
  int selectedItemID;
  int selectedItemPrice = 0;

  ProductRequiredExtrasModel.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    name = json["name"];
    min = int.parse(json["min"]);
    max = int.parse(json["max"]);
  }
}