import 'package:ecommerce_cafe_app/ui/widgets/increment_input_widget.dart';
import 'package:flutter/material.dart';

class IncrementWidget extends StatelessWidget {
  final String title;
  final int counter;
  final ValueChanged<int> onChanged;

  IncrementWidget({@required this.title, this.counter, this.onChanged});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 15.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                flex: 2,
                child: Text(
                  title,
                  maxLines: 2,
                  style: Theme.of(context).textTheme.bodyText1,
                ),
              ),
              Expanded(
                flex: 1,
                child: IncrementInputWidget(
                  minValue: 0,
                  maxValue: 10,
                  onChanged: onChanged,
                  counter: counter,
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
