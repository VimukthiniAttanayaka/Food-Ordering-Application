import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:food_ordering_application/file_utils.dart';
import 'package:food_ordering_application/models/menu.dart';

class MenuProvider with ChangeNotifier {
  List<Menu> _menus = [];
  String? _selectedMenu = 'lunch';

  List<Menu> get menus => _menus;
  String? get selectedMenu => _selectedMenu;

  Future<void> fetchMenuData() async {
    final String jsonString = await readDataFromFile('assets/data.json');

    final jsonData = jsonDecode(jsonString);
    final List<dynamic> menuList = jsonData['Result']['Menu'];

    _menus = menuList.map((menuJson) => Menu.fromJson(menuJson)).toList();
    notifyListeners();
  }

  void onMenuChanged(String? value) {
    _selectedMenu = value;
    notifyListeners(); // Notify listeners about the change
  }

}
