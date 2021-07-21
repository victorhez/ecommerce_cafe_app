import 'package:ecommerce_cafe_app/models/ProductModel.dart';
import 'package:ecommerce_cafe_app/repositories/ProductRepository.dart';
import 'package:flutter/cupertino.dart';

class ProductVM with ChangeNotifier{

  final ProductRepository _productRepository = ProductRepository();
  bool isLoading = false;

  /*
   * @type Lists
   * Lists of Params
   */
  ProductModel product;

  // @type Void Function
  // Change Loading State
  // @params value
  // @return
  void setLoadingState(bool value) {
    isLoading = value;
    notifyListeners();
  }

  /*
   * Get Product Details
   * @type Function
   * @param int id
   * @param BuildContext context
   *
   * @return void
   */
  Future<void> getProductDetails(int id, BuildContext context) async{
    setLoadingState(true);
    product = await _productRepository.getProductDetails(id, context);
    notifyListeners();
    setLoadingState(false);
  }
}