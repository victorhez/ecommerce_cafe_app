import 'package:ecommerce_cafe_app/config/app_currency_symbole.dart';
import 'package:ecommerce_cafe_app/models/AvailableExtraItemsModel.dart';
import 'package:ecommerce_cafe_app/ui/widgets/list_title.dart';
import 'package:flutter/material.dart';

class AvailableExtrasListWidget extends StatefulWidget {
  final Function onChoose;
  final List<AvailableExtraItemsModel> availableExtraItems;
  AvailableExtrasListWidget({this.onChoose, this.availableExtraItems});

  @override
  _AvailableExtrasListWidgetState createState() =>
      _AvailableExtrasListWidgetState();
}

class _AvailableExtrasListWidgetState extends State<AvailableExtrasListWidget> {
  int extraID = 0;
  int price = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTitleItem(
          title: Text(
            'Please select 1 item',
            style: Theme.of(context)
                .textTheme
                .bodyText2
                .copyWith(fontWeight: FontWeight.w600),
          ),
          backgroundColor: Theme.of(context).disabledColor.withOpacity(0.08),
          verticalPadding: 10.0,
        ),
        ListView.separated(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          separatorBuilder: (context, index) => SizedBox(height: 10.0),
          padding: EdgeInsets.symmetric(vertical: 10.0),
          itemCount: widget.availableExtraItems.length,
          itemBuilder: (context, index) {
            final extraItem = widget.availableExtraItems[index];
            return ListTitleItem(
              title: RichText(
                text: TextSpan(
                  text: extraItem.name,
                  // Note: Styles for TextSpans must be explicitly defined.
                  // Child text spans will inherit styles from parent
                  style: Theme.of(context).textTheme.bodyText1,
                  children: <TextSpan>[
                    extraItem.price > 0
                        ? TextSpan(
                            text:
                                ' (${AppCurrencySymbol.ThailandCurrencySymbol}${extraItem.price})',
                            style:
                                Theme.of(context).textTheme.bodyText1.copyWith(
                                      color: Theme.of(context).disabledColor,
                                    ),
                          )
                        : TextSpan()
                  ],
                ),
              ),
              clickFunction: () {
                onChangeCallback(extraItem.id, extraItem.price);
              },
              trailing: Radio(
                value: extraItem.id,
                groupValue: extraID,
                onChanged: (int value) {
                  onChangeCallback(value, extraItem.price);
                },
              ),
            );
          },
        ),
      ],
    );
  }

  /*
   * Callback Function
   * @type Function
   * @param int value
   * @param int price
   *
   * @return void
   */
  void onChangeCallback(int value, int price) {
    setState(() {
      extraID = value;
    });
    widget.onChoose(value, price);
  }
}
