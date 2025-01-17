import 'package:flutter/material.dart';
import 'package:food_ordering_application/providers/theme_provider.dart';
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
        ],
        child: MaterialApp(
          title: 'Dream Date',
          initialRoute: '/menu',
          routes: {
            '/menu': (context) => MenuScreen(),
            // '/homePage': (context) => const HomePage(),
          },
        ));
  }
}