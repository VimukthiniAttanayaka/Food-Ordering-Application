import 'package:flutter/material.dart';
import 'package:food_ordering_application/providers/category_provider.dart';
import 'package:food_ordering_application/providers/item_provider.dart';
import 'package:food_ordering_application/providers/menu_provider.dart';
import 'package:food_ordering_application/screens/menu_screen.dart';
import 'package:provider/provider.dart';

class Layout extends StatefulWidget {
  const Layout({super.key});

  @override
  State<Layout> createState() => _LayoutState();
}

class _LayoutState extends State<Layout> {
  @override
  void initState() {
    super.initState();
    context.read<MenuProvider>().fetchMenuData();
    context.read<CategoryProvider>().fetchCategorieData();
    context.read<MenuItemProvider>().fetchMenuItemData();
  }

  @override
  Widget build(BuildContext context) {
    final menuProvider = Provider.of<MenuProvider>(context);
    final categoryProvider = Provider.of<CategoryProvider>(context);
    return Scaffold(
      body: menuProvider.menus.isNotEmpty
          ? MenuScreen(
              menuList: menuProvider.menus,
              categoryList: categoryProvider.selectedCategories,
            )
          : const Center(child: Text('No menus available')),
    );
  }
}
