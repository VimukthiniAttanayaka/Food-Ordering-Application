import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:food_ordering_application/utils/file_utils.dart';
import 'package:food_ordering_application/models/categories.dart';

class CategoryProvider with ChangeNotifier {
  List<Category> _categories = [];
  Set<String> _selectedCategoryIDsP = {};
  List<Category> _selectedCategories = [];

  List<Category> get categories => _categories;

  Set<String> get selectedCategoryIDs => _selectedCategoryIDsP;

  List<Category> get selectedCategories => _selectedCategories;

  Future<void> fetchCategorieData() async {
    final String jsonString = await readDataFromFile('assets/data.json');

    final jsonData = jsonDecode(jsonString);
    final List<dynamic> categorieList = jsonData['Result']['Categories'];

    _categories = categorieList
        .map((categorieJson) => Category.fromJson(categorieJson))
        .toList();
    notifyListeners();
  }

  void toggleCategorySelection(Set<String> categoryIDs) {
    _selectedCategoryIDsP = Set.from(categoryIDs);
    _updateSelectedCategories(categoryIDs);
    notifyListeners();
  }

  void _updateSelectedCategories(Set<String> categoryIDs) {
    _selectedCategories = _categories
        .where((category) => categoryIDs.contains(category.menuCategoryID))
        .toList();
    notifyListeners();
  }

  List<String> getMenuEntitiesIdsByMenuCategoryId(String menuCategoryId) {
    List<String> entityIds = [];

    for (var category in _categories) {
      if (category.menuCategoryID == menuCategoryId) {
        entityIds.addAll(category.menuEntities!.map((e) => e.id));
      }
    }

    return entityIds;
  }
}
