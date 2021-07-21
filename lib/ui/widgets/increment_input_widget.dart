import 'package:ecommerce_cafe_app/viewModel/GeneralVM.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class IncrementInputWidget extends StatefulWidget {
  final int minValue;
  final int maxValue;
  int counter;
  final ValueChanged<int> onChanged;

  IncrementInputWidget(
      {Key key,
      this.minValue = 0,
      this.maxValue = 10,
      this.onChanged,
      this.counter})
      : super(key: key);

  @override
  _IncrementInputWidgetState createState() => _IncrementInputWidgetState();
}

class _IncrementInputWidgetState extends State<IncrementInputWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          GestureDetector(
            onTap: widget.counter > 1 ? () {
              setState(() {
                if (widget.counter > widget.minValue) {
                  widget.counter--;
                }
                widget.onChanged(widget.counter);
              });
            } : () => context.read<GeneralVM>().showErrorPopup(context, message: 'Quantity cannot go below 1'),
            child: Icon(
              Icons.remove,
              size: 30.0,
              color: Theme.of(context).disabledColor.withOpacity(0.3),
            ),
          ),
          Expanded(
            child: Text(
              '${widget.counter}',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.black87,
                fontSize: 18.0,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              setState(() {
                if (widget.counter < widget.maxValue) {
                  widget.counter++;
                }
                widget.onChanged(widget.counter);
              });
            },
            child: Icon(
              Icons.add_circle,
              size: 30.0,
              color: Theme.of(context).accentColor,
            ),
          ),
        ],
      ),
    );
  }
}
