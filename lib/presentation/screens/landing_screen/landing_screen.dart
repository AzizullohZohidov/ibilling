import 'package:flutter/material.dart';
import 'package:ibilling/core/constants/my_colors.dart';
import 'package:ibilling/presentation/screens/contracts_screen/contracts_screen.dart';

class LandingScreen extends StatefulWidget {
  LandingScreen({Key? key}) : super(key: key);

  @override
  State<LandingScreen> createState() => _LandingScreenState();
}

class _LandingScreenState extends State<LandingScreen> {
  var pageIndex = 0;

  final screens = [
    ContractsScreen(),
    ContractsScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: _buildBottomNavigationBar(),
      body: screens[pageIndex],
    );
  }

  BottomNavigationBar _buildBottomNavigationBar() {
    return BottomNavigationBar(
      currentIndex: pageIndex,
      onTap: (index) => setState(() {
        pageIndex = index;
      }),
      selectedFontSize: 14,
      unselectedFontSize: 14,
      backgroundColor: MyColors.bottomNavBarColor,
      selectedItemColor: MyColors.activeIconColor,
      unselectedItemColor: MyColors.notActiveIconColor,
      items: [
        BottomNavigationBarItem(
          icon: Image.asset('lib/assets/icons/contracts_outlined.png'),
          activeIcon: Image.asset('lib/assets/icons/contracts_filled.png'),
          label: 'Contracts',
        ),
        BottomNavigationBarItem(
          icon: Image.asset('lib/assets/icons/clock_outlined.png'),
          activeIcon: Image.asset('lib/assets/icons/clock_filled.png'),
          label: 'History',
        ),
      ],
    );
  }
}
