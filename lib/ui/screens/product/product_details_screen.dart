import 'package:ecommerce_cafe_app/ui/widgets/loading_widget.dart';
import 'package:ecommerce_cafe_app/viewModel/ProductVM.dart';
import 'package:provider/provider.dart';
import 'package:ecommerce_cafe_app/ui/widgets/components/ProductComponent.dart';
import 'package:flutter/material.dart';

class ProductDetailsScreen extends StatefulWidget {
  static const String routeName = 'product_details_screen';

  @override
  _ProductDetailsScreenState createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      context.read<ProductVM>().getProductDetails(14557, context);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: context.watch<ProductVM>().isLoading
            ? LoadingWidget()
            : ProductComponent(product: context.read<ProductVM>().product),
      ),
    );
  }
}
