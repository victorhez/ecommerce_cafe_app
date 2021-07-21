import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ButtonWidget extends StatelessWidget {
  final String labelText;
  final Color labelColor;
  final Widget buttonIcon;
  final Color buttonColor;
  final Function buttonClick;
  final double labelFontSize;
  final double radius;
  final double iconMargin;
  final MainAxisAlignment mainAxisAlignment;
  final RoundedRectangleBorder buttonShape;
  final Color disableColor;
  final bool showBorder;
  final Color borderColor;
  final Widget trailing;

  ButtonWidget(
      {@required this.labelText,
      this.labelColor,
      this.buttonColor,
      this.buttonClick,
      this.buttonIcon,
      this.labelFontSize,
      this.radius,
      this.iconMargin,
      this.mainAxisAlignment,
      this.buttonShape,
      this.disableColor,
      this.showBorder = false,
      this.borderColor,
      this.trailing});
  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      elevation: 0,
      shape: buttonShape != null
          ? buttonShape
          : RoundedRectangleBorder(
              borderRadius:
                  BorderRadius.circular(radius != null ? radius : 100.0)),
      onPressed: buttonClick != null ? buttonClick : null,
      color: buttonColor != null ? buttonColor : Theme.of(context).primaryColor,
      disabledColor: disableColor != null ? disableColor : null,
      child: Container(
        decoration: showBorder
            ? BoxDecoration(
                border: Border.all(
                    color: borderColor != null
                        ? borderColor
                        : Theme.of(context).primaryColor,
                    width: 2.0),
              )
            : null,
        child: Row(
          mainAxisAlignment: mainAxisAlignment != null
              ? mainAxisAlignment
              : MainAxisAlignment.center,
          children: <Widget>[
            buttonIcon != null
                ? Padding(
                    padding:
                        EdgeInsets.symmetric(vertical: 13.0, horizontal: 20.0),
                    child: buttonIcon,
                  )
                : Container(),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 9.0),
              child: Text(labelText,
                  style: Theme.of(context).textTheme.bodyText1.copyWith(
                      color: labelColor != null
                          ? labelColor
                          : Theme.of(context).accentColor)),
            ),
            trailing != null ? trailing : Container()
          ],
        ),
      ),
    );
  }
}
