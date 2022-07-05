import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:simple_calculator/providers/calculator_provider.dart';
import 'package:simple_calculator/shared/theme.dart';

import 'screens/calculator_screen.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => CalculatorProvider()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: context.watch<CalculatorProvider>().isDarkTheme ? dark : light,
      home: const CalculatorScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
