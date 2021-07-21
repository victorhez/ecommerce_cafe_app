import 'package:ecommerce_cafe_app/models/AvailableExtraItemsModel.dart';
import 'package:ecommerce_cafe_app/models/CategoryModel.dart';
import 'package:ecommerce_cafe_app/models/ProductImagesModel.dart';
import 'package:ecommerce_cafe_app/models/ProductRequiredExtrasModel.dart';

class ProductModel {
  int id;
  String name;
  int price;
  String description;
  String fullDescription;
  int order;
  CategoryModel category;
  ProductImagesModel images;
  List<ProductRequiredExtrasModel> requiredExtras = [];
  List<AvailableExtraItemsModel> availableExtrasItems = [];

  ProductModel.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    name = json["name"];
    price = json["price"];
    description = json["description"];
    fullDescription = json["full_description"];
    order = json["order"];
    category = CategoryModel.fromJson(json["category"]);
    images = ProductImagesModel.fromJson(json["images"]);
    if(json["extras"] != null) {
      for(var extra in json["extras"]){
        requiredExtras.add(new ProductRequiredExtrasModel.fromJson(extra));
      }
    }
    if(json["extra_items"] != null) {
      for(var extra in json["extra_items"]){
        availableExtrasItems.add(new AvailableExtraItemsModel.fromJson(extra));
      }
    }
  }
}