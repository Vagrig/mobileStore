import 'package:flutter/material.dart';
import 'package:way_to_success/common/colors_and_icons/app_colors.dart';
import 'package:way_to_success/common/generated_icons/app_generated_icons.dart';
import 'package:way_to_success/generated/l10n.dart';

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
          Row(children: [
            const Icon(
              Icons.circle,
              color: Colors.white,
              size: 15,
            ),
            const SizedBox(width: 10),
            Text(
              S.of(context).explorer,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ]),
          const Icon(AppGeneratedIcons.store, color: Colors.white),
          const Icon(AppGeneratedIcons.noFavorite, color: Colors.white),
          const Icon(AppGeneratedIcons.person, color: Colors.white),
        ],
      ),
    );
  }
}
