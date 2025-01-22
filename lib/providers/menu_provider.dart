import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:food_ordering_application/file_utils.dart';
import 'package:food_ordering_application/models/menu.dart';

class MenuProvider with ChangeNotifier {
  List<Menu> _menus = [];

  List<Menu> get menus => _menus;

  Future<void> fetchMenuData() async {
    final String jsonString = await readDataFromFile('assets/data.json');

    final jsonData = jsonDecode(jsonString);
    final List<dynamic> menuList = jsonData['Result']['Menu'];

    _menus = menuList.map((menuJson) => Menu.fromJson(menuJson)).toList();
    notifyListeners();
  }
}
