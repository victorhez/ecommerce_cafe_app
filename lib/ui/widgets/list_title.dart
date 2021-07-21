import 'package:flutter/material.dart';

class ListTitleItem extends StatelessWidget {
  final Widget title;
  final double verticalPadding;
  final double horizontalPadding;
  final double leadingIconRightPadding;
  final Widget subtitle;
  final Widget middleTitle;
  final Widget trailing;
  final Widget leadingIcon;
  final Function clickFunction;
  final Function onLongPress;
  final CrossAxisAlignment startRow;
  final bool hasBadge;
  final Color backgroundColor;
  final bool showDivider;
  final double dividerHeight;
  final double dividerWidth;
  final double dividerThickness;
  final double iconSpace;

  ListTitleItem(
      {@required this.title,
      this.verticalPadding,
      this.horizontalPadding,
      this.leadingIconRightPadding,
      this.subtitle,
      this.middleTitle,
      this.trailing,
      this.leadingIcon,
      this.clickFunction,
      this.onLongPress,
      this.startRow,
      this.hasBadge = false,
      this.backgroundColor = Colors.transparent,
      this.showDivider = false,
      this.dividerHeight = 20.0,
      this.dividerWidth = 0.0,
      this.dividerThickness = 0.8,
      this.iconSpace = 15.0});
  @override
  Widget build(BuildContext context) {
    return Container(
      color: backgroundColor,
      child: Column(
        children: [
          GestureDetector(
            onTap: clickFunction != null ? clickFunction : null,
            onLongPress: onLongPress != null ? onLongPress : null,
            child: Container(
              decoration: BoxDecoration(color: backgroundColor),
              child: Padding(
                padding: EdgeInsets.symmetric(
                    horizontal:
                        horizontalPadding != null ? horizontalPadding : 20.0,
                    vertical: verticalPadding != null ? verticalPadding : 0.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment:
                      startRow != null ? startRow : CrossAxisAlignment.center,
                  children: <Widget>[
                    leadingIcon != null ? leadingIcon : Container(),
                    leadingIcon != null
                        ? SizedBox(width: iconSpace)
                        : Container(),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          title,
                          subtitle != null ? subtitle : Container(),
                        ],
                      ),
                    ),
                    trailing != null ? trailing : Container(),
                  ],
                ),
              ),
            ),
          ),
          showDivider
              ? Divider(
                  height: dividerHeight,
                  thickness: dividerThickness,
                  indent: dividerWidth,
                  endIndent: dividerWidth)
              : Container(),
        ],
      ),
    );
  }
}
