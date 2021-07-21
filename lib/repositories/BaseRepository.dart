import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:ecommerce_cafe_app/config/dio.dart';
import 'package:ecommerce_cafe_app/config/helper.dart';
import 'package:provider/provider.dart';
import 'package:ecommerce_cafe_app/viewModel/GeneralVM.dart';
import 'package:flutter/material.dart';

class BaseRepository {
  /*
   * Get Request Function
   */
  getRequest(BuildContext context, String apiUrl,
      {bool enableToken = false}) async {
    try {
      if (enableToken) {
        // Get Stored Token
        String token = await AppHelper.prefsGetString('token');
        DioRequest.options.headers['authorization'] = 'Bearer $token';
      }

      Response response = await Dio(DioRequest.options).get(apiUrl);
      final Map<String, dynamic> responseBody = json.decode(response.toString());
      if (response.statusCode == 200) {
        return responseBody;
      } else {
        if (response.statusCode == 401) {
          // sign out if unauthenticated
          AppHelper.logout(context);
        }
        if (responseBody.containsKey("errors")) {
          context.read<GeneralVM>().showErrorPopup(context, errors: responseBody["errors"]);
        } else if (responseBody.containsKey("message")) {
          context.read<GeneralVM>().showErrorPopup(context, message: responseBody["message"]);
        } else {
          context.read<GeneralVM>().showErrorPopup(context, message: "Something wrong, Please try again.");
        }
      }
    } catch (e) {
      throw Exception(e);
    }
  }
}
