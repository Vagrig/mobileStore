import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:way_to_success/common/colors_and_icons/app_colors.dart';
import 'package:way_to_success/common/generated_icons/app_generated_icons.dart';
import 'package:way_to_success/generated/l10n.dart';

class SelectCategory extends StatefulWidget {
  const SelectCategory({Key? key}) : super(key: key);

  @override
  State<SelectCategory> createState() => _SelectCategoryState();
}

class _SelectCategoryState extends State<SelectCategory> {
  final items = [
    AppGeneratedIcons.phone,
    AppGeneratedIcons.computer,
    AppGeneratedIcons.health,
    AppGeneratedIcons.books,
  ];

  int temp = 0;

  @override
  Widget build(BuildContext context) {
    final itemsName = [
      S.of(context).phones,
      S.of(context).computer,
      S.of(context).health,
      S.of(context).books
    ];
    return Column(
      children: [
        const _HeadlineWidget(),
        const SizedBox(height: 20),
        FittedBox(
          child: Wrap(
            spacing: 30,
            children: List.generate(4, (int index) {
              return Column(
                children: [
                  ChoiceChip(
                      backgroundColor: Colors.white,
                      selectedColor: AppColors.orange,
                      labelPadding: const EdgeInsets.all(10),
                      label: Container(
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(
                            Radius.circular(40),
                          ),
                        ),
                        height: 40,
                        width: 40,
                        child: temp == index
                            ? Icon(
                                items[index],
                                color: Colors.white,
                              )
                            : Icon(items[index], color: Colors.grey),
                      ),
                      selected: temp == index,
                      onSelected: (bool selected) {
                        setState(() {
                          temp = index;
                        });
                      }),
                  const SizedBox(height: 10),
                  Text(
                    itemsName[index],
                    style: TextStyle(
                        color: temp == index
                            ? AppColors.orange
                            : AppColors.darkBlue,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              );
            }),
          ),
        ),
      ],
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
        Text(
          S.of(context).select_category,
          style: const TextStyle(
              fontSize: 27,
              color: AppColors.darkBlue,
              fontWeight: FontWeight.bold),
        ),
        Text(
          S.of(context).view_all,
          style: const TextStyle(color: AppColors.orange),
        ),
      ],
    );
  }
}
