import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:way_to_success/common/app_colors.dart';
import 'package:way_to_success/resources/custom_icons.dart';

class SearchWidget extends StatelessWidget {
  const SearchWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        children: [
          const Expanded(
            child: TextField(
              cursorColor: AppColors.orange,
              decoration: InputDecoration(
                contentPadding: EdgeInsets.all(8),
                filled: true,
                fillColor: Colors.white,
                hintText: 'Search',
                hintStyle:
                    TextStyle(color: Colors.grey, fontWeight: FontWeight.w500),
                prefixIcon: Icon(
                  CustomIcons.search,
                  color: AppColors.orange,
                  size: 18,
                ),
                border: OutlineInputBorder(
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
              CustomIcons.squares,
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
