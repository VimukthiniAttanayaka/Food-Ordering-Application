import 'package:flutter/services.dart';

Future<String> readDataFromFile(String filePath) async {
  try {
    final String response = await rootBundle.loadString(filePath);
    return response;
  } catch (error) {
    // Handle errors (e.g., file not found)
    print(error);
    return '';
  }
}