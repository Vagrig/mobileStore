import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:way_to_success/common/colors_and_icons/app_colors.dart';
import 'package:way_to_success/common/generated_icons/app_generated_icons.dart';
import 'package:way_to_success/generated/l10n.dart';

class SearchWidget extends StatelessWidget {
  const SearchWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              cursorColor: AppColors.orange,
              decoration: InputDecoration(
                contentPadding: const EdgeInsets.all(8),
                filled: true,
                fillColor: Colors.white,
                hintText: S.of(context).search,
                hintStyle: const TextStyle(
                    color: Colors.grey, fontWeight: FontWeight.w500),
                prefixIcon: const Icon(
                  AppGeneratedIcons.search,
                  color: AppColors.orange,
                  size: 18,
                ),
                border: const OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.all(
                    Radius.circular(40),
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(width: 15),
          Container(
            child: const Icon(
              AppGeneratedIcons.squares,
              color: Colors.white,
              size: 18,
            ),
            height: 45,
            width: 45,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(
                Radius.circular(40),
              ),
              color: AppColors.orange,
            ),
          ),
        ],
      ),
    );
  }
}
