import 'package:ecommerce_cafe_app/config/app_api_endpoints.dart';
import 'package:ecommerce_cafe_app/models/ProductModel.dart';
import 'package:ecommerce_cafe_app/repositories/BaseRepository.dart';
import 'package:flutter/material.dart';

class ProductRepository extends BaseRepository {
  /*
   * Get Product Details
   * @type Function
   * @param int id
   * @param BuildContext context
   *
   * @return ProductModel
   */
  Future<ProductModel> getProductDetails(int id, BuildContext context) async {
    final response = await getRequest(
        context, '${AppApiEndPoints.productDetailsApiEndPoint}');
    return ProductModel.fromJson(response);
  }
}
