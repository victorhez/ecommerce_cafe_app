import 'package:ecommerce_cafe_app/ui/screens/product/products_screen.dart';
import 'package:flutter/material.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';

class SimpleAppBarWidget extends StatelessWidget with PreferredSizeWidget {
  // Widget Params
  final String title;
  final Widget titleWidget;
  final Color color;
  final List trailing;
  final Function backButton;
  final Widget leadingIcon;
  final Key appBarKey;
  final bool showLeadingIcon;
  final double elevation;

  // Widget Constructor
  SimpleAppBarWidget(
      {this.title,
      this.titleWidget,
      this.color,
      this.trailing,
      this.backButton,
      this.leadingIcon,
      this.appBarKey,
      this.showLeadingIcon = true,
      this.elevation = 0.0});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      key: appBarKey != null ? appBarKey : null,
      brightness: Brightness.light,
      elevation: elevation,
      centerTitle: true,
      backgroundColor: color != null ? color : Colors.white,
      leading: showLeadingIcon
          ? GestureDetector(
              child: leadingIcon != null
                  ? leadingIcon
                  : Icon(LineAwesomeIcons.angle_left,
                      size: 30, color: Theme.of(context).primaryColorDark),
              onTap: backButton != null
                  ? backButton
                  : () => Navigator.canPop(context)
                      ? Navigator.pop(context)
                      : Navigator.pushNamed(context, ProductsScreen.routeName),
            )
          : null,
      actions: trailing != null ? trailing : null,
      title: titleWidget != null
          ? titleWidget
          : Text(
              title,
              style: Theme.of(context).textTheme.headline3.copyWith(
                  color: Theme.of(context).accentColor,
                  fontWeight: FontWeight.w500),
            ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
