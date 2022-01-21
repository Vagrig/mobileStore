import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:way_to_success/common/colors_and_icons/app_colors.dart';
import 'package:way_to_success/common/generated_icons/app_generated_icons.dart';
import 'package:way_to_success/generated/l10n.dart';

class HeadlineWidget extends StatelessWidget {
  const HeadlineWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(40.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const _CloseAndLocationWidget(),
          const SizedBox(height: 50),
          Text(
            S.of(context).my_cart,
            style: const TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}

class _CloseAndLocationWidget extends StatelessWidget {
  const _CloseAndLocationWidget({
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
              Icons.arrow_back_ios_outlined,
              color: Colors.white,
              size: 20,
            ),
          ),
        ),
        Row(
          children: [
            Text(
              S.of(context).add_address,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            const SizedBox(width: 10),
            Container(
              width: 40,
              height: 40,
              decoration: const BoxDecoration(
                color: AppColors.orange,
                borderRadius: BorderRadius.all(
                  Radius.circular(10),
                ),
              ),
              child: IconButton(
                onPressed: () {},
                icon: const Icon(
                  AppGeneratedIcons.location,
                  color: Colors.white,
                  size: 20,
                ),
              ),
            ),
          ],
        )
      ],
    );
  }
}
