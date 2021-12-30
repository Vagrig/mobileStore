import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:way_to_success/common/app_colors.dart';

class FilterWidget extends StatefulWidget {
  const FilterWidget({Key? key}) : super(key: key);

  @override
  State<FilterWidget> createState() => _FilterWidgetState();
}

class _FilterWidgetState extends State<FilterWidget> {
  final brands = ['iPhone', 'Samsung', 'Xiaomi'];
  final price = [
    '\$0 - \$300',
    '\$300 - \$500',
    '\$500 - \$1500',
    '\$1500 - \$10000',
  ];
  final size = ['4.5 to 5.5 inches', '5.5 to 6.5 inches'];

  String? firstBrand = 'iPhone';
  String? firstPrice = '\$300 - \$500';
  String? firstSize = '4.5 to 5.5 inches';

  @override
  Widget build(BuildContext context) {
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
              const _TextCategory(text: 'Brand'),
              const SizedBox(height: 5),
              _Filters(firstItem: firstBrand, category: brands),
              const SizedBox(height: 10),
              const _TextCategory(text: 'Price'),
              const SizedBox(height: 5),
              _Filters(firstItem: firstPrice, category: price),
              const SizedBox(height: 10),
              const _TextCategory(text: 'Size'),
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
        const Text(
          'Filter options',
          style: TextStyle(
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
          child: const Text(
            'Done',
            style: TextStyle(fontSize: 18),
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
