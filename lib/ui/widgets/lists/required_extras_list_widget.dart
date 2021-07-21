import 'package:ecommerce_cafe_app/ui/widgets/lists/available_extras_list_widget.dart';
import 'package:ecommerce_cafe_app/viewModel/ProductVM.dart';
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class RequiredExtrasListWidget extends StatefulWidget {
  final Function onChoose;
  RequiredExtrasListWidget({this.onChoose});

  @override
  _RequiredExtrasListWidgetState createState() =>
      _RequiredExtrasListWidgetState();
}

class _RequiredExtrasListWidgetState extends State<RequiredExtrasListWidget> {
  int extraID = 0;
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      padding: EdgeInsets.zero,
      separatorBuilder: (context, index) => SizedBox(height: 10.0),
      itemCount: context.read<ProductVM>().product.requiredExtras.length,
      itemBuilder: (context, index) {
        final extraItem =
            context.read<ProductVM>().product.requiredExtras[index];
        return ExpandableNotifier(
          child: Column(
            children: <Widget>[
              ScrollOnExpand(
                scrollOnExpand: true,
                scrollOnCollapse: true,
                child: ExpandablePanel(
                  theme: const ExpandableThemeData(
                      headerAlignment: ExpandablePanelHeaderAlignment.center,
                      tapBodyToCollapse: true,
                      hasIcon: false),
                  header: Container(
                    color: Theme.of(context).disabledColor.withOpacity(0.03),
                    padding:
                        EdgeInsets.symmetric(vertical: 20.0, horizontal: 20.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        RichText(
                          text: TextSpan(
                            text: extraItem.name.toUpperCase(),
                            style: Theme.of(context).textTheme.bodyText1,
                            children: <TextSpan>[
                              TextSpan(
                                text: ' (REQUIRED)',
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyText1
                                    .copyWith(
                                      color: Theme.of(context).disabledColor,
                                    ),
                              )
                            ],
                          ),
                        ),
                        Icon(Icons.keyboard_arrow_down)
                      ],
                    ),
                  ),
                  collapsed: Container(),
                  expanded: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      AvailableExtrasListWidget(
                        availableExtraItems: context
                            .read<ProductVM>()
                            .product
                            .availableExtrasItems
                            .where((item) => item.extraID == extraItem.id)
                            .toList(),
                        onChoose:
                            (int selectedExtraID, int selectedExtraPrice) {
                          if (selectedExtraID != null) {
                            setState(() {
                              extraItem.hasValue = true;
                              extraItem.selectedItemID = selectedExtraID;
                              extraItem.selectedItemPrice = selectedExtraPrice;
                              widget.onChoose(selectedExtraID, selectedExtraPrice);
                            });
                          }
                        },
                      ),
                    ],
                  ),
                  builder: (_, collapsed, expanded) {
                    return Expandable(
                      collapsed: collapsed,
                      expanded: expanded,
                      theme: const ExpandableThemeData(crossFadePoint: 0),
                    );
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
