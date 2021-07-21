import 'package:ecommerce_cafe_app/ui/widgets/simpleAppBar_widget.dart';
import 'package:flutter/material.dart';

class ProductsScreen extends StatelessWidget {
  static const String routeName = 'products_screen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SimpleAppBarWidget(
        title: 'Products',
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(),
        ),
      ),
    );
  }
}
