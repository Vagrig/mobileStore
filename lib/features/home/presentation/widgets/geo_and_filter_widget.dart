import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:way_to_success/common/colors_and_icons/app_colors.dart';
import 'package:way_to_success/core/geolocation/geolocation.dart';
import 'package:way_to_success/features/home/presentation/widgets/filter_widget.dart';
import 'package:way_to_success/common/generated_icons/app_generated_icons.dart';
import 'package:way_to_success/generated/l10n.dart';

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
                children: [
                  const Icon(
                    AppGeneratedIcons.location,
                    color: AppColors.orange,
                  ),
                  const SizedBox(width: 10),
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const MyGeolocation(),
                        ),
                      );
                    },
                    child: Text(
                      S.of(context).current_location,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        color: AppColors.darkBlue,
                      ),
                    ),
                  ),
                  const Icon(Icons.keyboard_arrow_down_outlined,
                      color: Colors.grey),
                ],
              ),
            ),
            Align(
              alignment: Alignment.centerRight,
              child: IconButton(
                icon: const Icon(
                  AppGeneratedIcons.filter,
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
