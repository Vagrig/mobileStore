import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:way_to_success/common/app_colors.dart';
import 'package:way_to_success/features/home/presentation/widgets/filter_widget.dart';
import 'package:way_to_success/resources/custom_icons.dart';

class GeolocationAndFilter extends StatelessWidget {
  const GeolocationAndFilter({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          alignment: Alignment.center,
          children: [
            Align(
              alignment: Alignment.center,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Icon(
                    CustomIcons.location,
                    color: AppColors.orange,
                  ),
                  SizedBox(width: 10),
                  Text(
                    'Zihuatanejo, Gro',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: AppColors.darkBlue,
                    ),
                  ),
                  Icon(Icons.keyboard_arrow_down_outlined, color: Colors.grey),
                ],
              ),
            ),
            Align(
              alignment: Alignment.centerRight,
              child: IconButton(
                icon: const Icon(
                  CustomIcons.filter,
                  size: 16,
                ),
                onPressed: () {
                  showModalBottomSheet(
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.vertical(
                        top: Radius.circular(30),
                      ),
                    ),
                    context: context,
                    builder: (context) {
                      return const FilterWidget();
                    },
                  );
                },
              ),
            )
          ],
        ),
      ],
    );
  }
}
