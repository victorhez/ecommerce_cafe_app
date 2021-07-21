import 'package:ecommerce_cafe_app/ui/widgets/error_popup_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class GeneralVM with ChangeNotifier{

  /*
   * Show Error Popup
   * @param BuildContext context
   * @param String message
   * @param Map<String, dynamic> errors
   */
  showErrorPopup(BuildContext context,
      {String message, Map<String, dynamic> errors, String title = 'Error'}) {
    showDialog(
      context: context,
      barrierDismissible: true,
      builder: (context) => ErrorPopupWidget(
          title: title,
          message: message != null ? message : null,
          errors: errors != null ? errors : null),
    );
  }

}