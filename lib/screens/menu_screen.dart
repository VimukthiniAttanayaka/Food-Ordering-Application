import 'package:flutter/material.dart';
import 'package:food_ordering_application/providers/menu_provider.dart';
import 'package:provider/provider.dart';

class MenuScreen extends StatefulWidget {
  const MenuScreen({Key? key}) : super(key: key);

  @override
  State<MenuScreen> createState() => _MenuScreenState();
}

class _MenuScreenState extends State<MenuScreen> {

  @override
  void initState() {
    super.initState();
    context.read<MenuProvider>().fetchMenuData();
  }

  @override
  Widget build(BuildContext context) {
    final menuProvider = Provider.of<MenuProvider>(context);
    return Scaffold(
      body: ListView.builder(
        itemCount: menuProvider.menus.length,
        itemBuilder: (context, index) {
          final menu = menuProvider.menus[index];
          return ListTile(
            title: Text(menu.title['en'] ?? ''),
          );
        },
      ),
    );
  }
}
