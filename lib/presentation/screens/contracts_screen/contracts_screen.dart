import 'package:flutter/material.dart';
import 'package:ibilling/presentation/screens/contracts_screen/widgets/calendar.dart';

class ContractsScreen extends StatelessWidget {
  const ContractsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(height: 100),
          Calendar(),
        ],
      ),
    );
  }
}
