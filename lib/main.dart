import 'package:flutter/material.dart';
import 'package:ibilling/core/constants/my_colors.dart';
import 'package:ibilling/presentation/screens/contracts_screen/contracts_screen.dart';
import 'package:ibilling/presentation/screens/landing_screen/landing_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'iBilling',
      debugShowCheckedModeBanner: false,
      scrollBehavior: const ScrollBehavior().copyWith(overscroll: false),
      theme: ThemeData(
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: Colors.black,
        appBarTheme: const AppBarTheme(
          backgroundColor: MyColors.black,
        ),
        textTheme: const TextTheme(
          bodyText2: TextStyle(color: Colors.white),
        ),
      ),
      //home: ContractsScreen(),
      home: LandingScreen(),
    );
  }
}
