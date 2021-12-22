import 'package:flutter/material.dart';
import 'package:ibilling/presentation/screens/contracts_screen/widgets/calendar.dart';

class ContractsScreen extends StatelessWidget {
  const ContractsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Image.asset("lib/assets/icons/app_bar_logo.png"),
        title: const Text("Contracts"),
      ),
      body: Column(
        children: [
          Calendar(),
        ],
      ),
    );
  }
}
