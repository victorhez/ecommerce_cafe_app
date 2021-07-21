class ProductImagesModel {
  String fullSize;
  String thumbnail;

  ProductImagesModel.fromJson(Map<String, dynamic> json) {
    fullSize = json["full_size"];
    thumbnail = json["thumbnail"];
  }
}