import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:way_to_success/common/colors_and_icons/app_colors.dart';
import 'package:way_to_success/generated/l10n.dart';

class SelectSectionWidget extends StatelessWidget {
  const SelectSectionWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: SizedBox(
        height: 50,
        child: TabBar(
          indicatorPadding: const EdgeInsets.symmetric(
            horizontal: 14,
            vertical: 7,
          ),
          indicatorColor: AppColors.orange,
          indicatorWeight: 3,
          unselectedLabelColor: Colors.grey,
          labelColor: AppColors.darkBlue,
          tabs: [
            _TextWidget(name: S.of(context).shop_section),
            _TextWidget(name: S.of(context).details_section),
            _TextWidget(name: S.of(context).features_section),
          ],
        ),
      ),
    );
  }
}

class _TextWidget extends StatelessWidget {
  const _TextWidget({
    Key? key,
    required this.name,
  }) : super(key: key);
  final name;
  @override
  Widget build(BuildContext context) {
    return FittedBox(
      child: Text(
        name,
        style: const TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 18,
        ),
      ),
    );
  }
}
