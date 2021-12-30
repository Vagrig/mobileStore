import 'package:flutter/material.dart';
import 'package:way_to_success/features/detail/domain/entities/detail_entity.dart';
import 'package:way_to_success/features/detail/presentation/widgets/hardware_widget.dart';
import 'package:way_to_success/features/detail/presentation/widgets/select_specifications_and_buy.dart';
import 'package:way_to_success/features/detail/presentation/widgets/select_section_widget.dart';
import 'package:way_to_success/features/detail/presentation/widgets/name_and_rating_widget.dart';

class DetailInfoWidget extends StatelessWidget {
  DetailInfoWidget({Key? key, required this.detailEntity}) : super(key: key);
  DetailEntity detailEntity;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 435,
      decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(40),
            topRight: Radius.circular(40),
          ),
          color: Colors.white),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            NameAndRatingWidget(detailEntity: detailEntity),
            const SizedBox(height: 20),
            const SelectSectionWidget(),
            const SizedBox(height: 25),
            HardwareWidget(detailEntity: detailEntity),
            const SizedBox(height: 30),
            SelectSpecificationsAndBuy(detailEntity: detailEntity),
          ],
        ),
      ),
    );
  }
}
