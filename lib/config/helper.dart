import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppHelper {

  // Save Data in Local Storage
  static prefsSaveString(String key, String value) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString(key, value);
  }

  // Save Data in Local Storage
  static prefsSaveInt(String key, int value) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setInt(key, value);
  }

  // Get Data from Local Storage
  static prefsGetString(String key) async {
    final pref = await SharedPreferences.getInstance();
    return pref.getString(key) ?? null;
  }

  // Get Data from Local Storage
  static prefsGetInt(String key) async {
    final pref = await SharedPreferences.getInstance();
    return pref.getInt(key) ?? null;
  }

  // Remove Data from Local Storage
  static prefsDeleteString(String key) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.remove(key);
  }

  static Future<void> prefsDeleteAll() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.clear();
  }

  // Check E-Mail Validity
  static bool isValidEmail(String email) {
    return RegExp(
        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(email);
  }

  // Check Password Validity
  static bool isValidPassword(String password) {
    return RegExp(
        r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9]).{8,}$')
        .hasMatch(password);
  }

  // Check Mobile Validity
  static bool isValidPhone(String phone) {
    return RegExp(r"^(?:[+0]9)?[0-9]{11}$").hasMatch(phone);
  }

  // Check Full Name Validity
  static bool isValidFullName(String name) {
    return RegExp(r"^([a-zA-Z]{2,}\s[a-zA-Z]{1,}'?-?[a-zA-Z]{2,}\s?([a-zA-Z]{1,})?)").hasMatch(name);
  }

  static logout(BuildContext context){

  }
}