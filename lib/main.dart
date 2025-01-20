import 'package:flutter/material.dart';
import 'package:food_ordering_application/providers/item_provider.dart';
import 'package:food_ordering_application/providers/menu_provider.dart';
import 'package:food_ordering_application/providers/theme_provider.dart';
import 'package:food_ordering_application/screens/item_screen.dart';
import 'package:food_ordering_application/screens/menu_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(ChangeNotifierProvider(
    create: (context) => ThemeProvider(),
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => ThemeProvider()),
          ChangeNotifierProvider(create: (_) => MenuProvider()),
          ChangeNotifierProvider(create: (_) => MenuItemProvider()),
        ],
        child: MaterialApp(
          title: 'Dream Date',
          initialRoute: '/menu',
          routes: {
            '/menu': (context) => MenuScreen(),
            '/item': (context) => const ItemScreen(),
          },
        ));
  }
}