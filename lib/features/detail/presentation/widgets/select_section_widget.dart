import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:way_to_success/common/app_colors.dart';

class SelectSectionWidget extends StatelessWidget {
  const SelectSectionWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const DefaultTabController(
      length: 3,
      child: SizedBox(
        height: 50,
        child: TabBar(
          indicatorPadding: EdgeInsets.symmetric(
            horizontal: 14,
            vertical: 7,
          ),
          indicatorColor: AppColors.orange,
          indicatorWeight: 3,
          unselectedLabelColor: Colors.grey,
          labelColor: AppColors.darkBlue,
          tabs: [
            _TextWidget(name: 'Shop'),
            _TextWidget(name: 'Details'),
            _TextWidget(name: 'Features'),
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
    return Text(
      name,
      style: const TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 18,
      ),
    );
  }
}
