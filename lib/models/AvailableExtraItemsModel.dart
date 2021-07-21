class AvailableExtraItemsModel {
  int id;
  String name;
  int extraID;
  int price;

  AvailableExtraItemsModel.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    name = json["name"];
    extraID = json["extra_id"];
    price = int.parse(json["price"]);
  }
}