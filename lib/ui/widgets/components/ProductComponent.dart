import 'package:ecommerce_cafe_app/config/app_currency_symbole.dart';
import 'package:ecommerce_cafe_app/models/ProductModel.dart';
import 'package:ecommerce_cafe_app/ui/widgets/button_widget.dart';
import 'package:ecommerce_cafe_app/ui/widgets/increment_widget.dart';
import 'package:ecommerce_cafe_app/ui/widgets/lists/required_extras_list_widget.dart';
import 'package:ecommerce_cafe_app/viewModel/GeneralVM.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProductComponent extends StatefulWidget {
  final ProductModel product;
  ProductComponent({@required this.product});

  @override
  _ProductComponentState createState() => _ProductComponentState();
}

class _ProductComponentState extends State<ProductComponent> {
  int _orderCount = 1;
  int total = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      setState(() {
        total = widget.product.price;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            expandedHeight: 240.0,
            elevation: 0.0,
            backgroundColor: Colors.white,
            flexibleSpace: FlexibleSpaceBar(
                centerTitle: true,
                background: Image.network(widget.product.images.fullSize,
                    height: 300.0, width: double.infinity,
                    loadingBuilder: (context, child, progress) {
                  return progress == null
                      ? child
                      : Center(
                          child: SizedBox(
                            child: CircularProgressIndicator(),
                            height: 50.0,
                            width: 50.0,
                          ),
                        );
                }, fit: BoxFit.cover)),
            leading: Padding(
              padding: const EdgeInsets.all(10.0),
              child: RawMaterialButton(
                onPressed: () {},
                elevation: 0.0,
                fillColor: Colors.white,
                child: Icon(
                  Icons.arrow_back,
                  size: 25.0,
                  color: Theme.of(context).disabledColor,
                ),
                shape: CircleBorder(),
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildListDelegate(
              <Widget>[
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 30.0),
                      child: Column(
                        children: [
                          Text(
                            widget.product.name,
                            style: Theme.of(context).textTheme.headline2,
                          ),
                          SizedBox(
                            height: 15.0,
                          ),
                          Text(widget.product.description,
                              style: Theme.of(context).textTheme.bodyText2),
                        ],
                      ),
                    ),
                    Divider(
                        height: 10.0,
                        thickness: 0.8,
                        indent: 20.0,
                        endIndent: 20.0),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: IncrementWidget(
                        title:
                            '${AppCurrencySymbol.ThailandCurrencySymbol} ${widget.product.price.toString()}',
                        counter: _orderCount,
                        onChanged: (counter) {
                          setState(() {
                            _orderCount = counter;
                            calculateTotalPrice();
                          });
                        },
                      ),
                    ),
                    RequiredExtrasListWidget(
                      onChoose: (int selectedExtraID, int selectedExtraPrice) {
                        setState(() {
                          calculateTotalPrice();
                        });
                      },
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20.0, vertical: 20.0),
                      child: ButtonWidget(
                        labelText: 'ADD $_orderCount TO CART',
                        labelColor: Colors.white,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        buttonIcon: Icon(
                          Icons.add_shopping_cart,
                          color: Colors.white,
                        ),
                        trailing: Text(
                          '${AppCurrencySymbol.ThailandCurrencySymbol} ${total.toString()}',
                          style: Theme.of(context)
                              .textTheme
                              .bodyText1
                              .copyWith(color: Colors.white),
                        ),
                        radius: 5.0,
                        buttonClick: () => submitOrder(),
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  /*
   * Calculate Total Price
   * @type Function
   *
   * @return int
   */
  int calculateTotalPrice() {
    total = _orderCount * widget.product.price;
    for (var extraItem in widget.product.requiredExtras) {
      total = total + extraItem.selectedItemPrice;
    }
    return total;
  }

  /*
   * Submit Order Function
   * @type Function
   *
   * @return int
   */
  void submitOrder() {
    for (var extraItem in widget.product.requiredExtras) {
      if (!extraItem.hasValue && extraItem.min == 1) {
        context.read<GeneralVM>().showErrorPopup(context,
            message: 'Please select 1 item from ${extraItem.name}');
        return;
      }

      //TODO:: Add item to the cart
      context.read<GeneralVM>().showErrorPopup(context,
          message: '${widget.product.name} added successfully', title: 'Success');
    }
  }
}
