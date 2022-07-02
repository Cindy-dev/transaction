import 'package:flutter/material.dart';
import '../utility/color.dart';

class BottomNavigationBarWidget extends StatelessWidget {
  const BottomNavigationBarWidget(
      {Key? key,
      BottomNavigationBarType? type,
      MaterialColor? unselectedItemColor,
      Color? selectedItemColor,
      List<BottomNavigationBarItem>? items})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      unselectedItemColor: AppColors.navigationBarColor,
      selectedItemColor: AppColors.selectedItemColor,
      unselectedLabelStyle: const TextStyle(
        color: AppColors.navibationBarTextColor,
      ),
      selectedLabelStyle: const TextStyle(
        color: AppColors.navibationBarTextColor,
      ),
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.phone_android_sharp),
          label: 'Transaction',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.category_outlined),
          label: 'Category',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.payment),
          label: 'Payments',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.money),
          label: 'Piggy Bank',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.more_vert_rounded),
          label: 'More',
        ),
      ],
    );
  }
}
