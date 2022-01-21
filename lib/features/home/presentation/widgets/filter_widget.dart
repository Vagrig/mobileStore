import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:way_to_success/common/colors_and_icons/app_colors.dart';
import 'package:way_to_success/common/variables/app_variables.dart';
import 'package:way_to_success/generated/l10n.dart';

class FilterWidget extends StatefulWidget {
  const FilterWidget({Key? key}) : super(key: key);

  @override
  State<FilterWidget> createState() => _FilterWidgetState();
}

final brand = [
  AppVariables.iphone,
  AppVariables.samsung,
  AppVariables.xiaomi,
];

final price = [
  AppVariables.veryLowPrice,
  AppVariables.lowPrice,
  AppVariables.mediumPrice,
  AppVariables.highPrice,
];

class _FilterWidgetState extends State<FilterWidget> {
  @override
  Widget build(BuildContext context) {
    final size = [
      S.of(context).small_diagonal,
      S.of(context).big_diagonal,
    ];

    String? firstBrand = AppVariables.iphone;
    String? firstPrice = AppVariables.veryLowPrice;
    String? firstSize = S.of(context).small_diagonal;

    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 25,
        horizontal: 40,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const _HeadlineWidget(),
          const SizedBox(height: 20),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _TextCategory(text: S.of(context).brand),
              const SizedBox(height: 5),
              _Filters(firstItem: firstBrand, category: brand),
              const SizedBox(height: 10),
              _TextCategory(text: S.of(context).price),
              const SizedBox(height: 5),
              _Filters(firstItem: firstPrice, category: price),
              const SizedBox(height: 10),
              _TextCategory(text: S.of(context).size),
              const SizedBox(height: 5),
              _Filters(firstItem: firstSize, category: size),
            ],
          )
        ],
      ),
    );
  }
}

class _HeadlineWidget extends StatelessWidget {
  const _HeadlineWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          width: 40,
          height: 40,
          decoration: const BoxDecoration(
            color: AppColors.darkBlue,
            borderRadius: BorderRadius.all(
              Radius.circular(10),
            ),
          ),
          child: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.close,
              color: Colors.white,
            ),
          ),
        ),
        Text(
          S.of(context).filter_options,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            primary: AppColors.orange,
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(10),
              ),
            ),
          ),
          onPressed: () {
            Navigator.pop(context);
          },
          child: Text(
            S.of(context).done,
            style: const TextStyle(fontSize: 18),
          ),
        )
      ],
    );
  }
}

class _TextCategory extends StatelessWidget {
  const _TextCategory({
    Key? key,
    required this.text,
  }) : super(key: key);
  final text;
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: const TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}

class _Filters extends StatefulWidget {
  _Filters({
    Key? key,
    required this.firstItem,
    required this.category,
  }) : super(key: key);
  String? firstItem;
  List<String> category;

  @override
  State<_Filters> createState() => _FiltersState();
}

class _FiltersState extends State<_Filters> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<String>(
          icon: const Icon(Icons.keyboard_arrow_down_sharp),
          isExpanded: true,
          value: widget.firstItem,
          items: widget.category.map(_buildBrandsItem).toList(),
          onChanged: (value) {
            setState(() {
              widget.firstItem = value;
            });
          },
        ),
      ),
    );
  }
}

DropdownMenuItem<String> _buildBrandsItem(String item) {
  return DropdownMenuItem(value: item, child: Text(item));
}
