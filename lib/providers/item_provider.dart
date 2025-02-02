import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:food_ordering_application/utils/file_utils.dart';
import 'package:food_ordering_application/models/item.dart';

class MenuItemProvider with ChangeNotifier {
  List<MenuItem> _menuItems = [];

  List<MenuItem> get menuItems => _menuItems;

  Future<void> fetchMenuItemData() async {
    final String jsonString = await readDataFromFile('assets/data.json');

    final jsonData = jsonDecode(jsonString);
    final List<dynamic> menuItemsList = jsonData['Result']['Items'];

    _menuItems = menuItemsList
        .map((menuItemsJson) => MenuItem.fromJson(menuItemsJson))
        .toList();
    notifyListeners();
  }

  MenuItem getMenuItemById(String menuItemId) {
    return _menuItems.firstWhere((item) => item.menuItemId == menuItemId,
        orElse: () =>
            throw Exception('Menu item with ID: $menuItemId not found'));
  }
}
