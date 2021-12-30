import 'package:flutter/material.dart';
import 'package:way_to_success/common/app_colors.dart';
import 'package:way_to_success/resources/custom_icons.dart';

class BottomNavigationBarWidget extends StatelessWidget {
  const BottomNavigationBarWidget({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: AppColors.darkBlue,
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(40),
        ),
      ),
      height: 60,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Row(children: const [
            Icon(
              Icons.circle,
              color: Colors.white,
              size: 15,
            ),
            SizedBox(width: 10),
            Text(
              'Explorer',
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ]),
          const Icon(CustomIcons.store, color: Colors.white),
          const Icon(CustomIcons.noFavorite, color: Colors.white),
          const Icon(CustomIcons.person, color: Colors.white),
        ],
      ),
    );
  }
}
