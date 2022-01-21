import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:way_to_success/common/colors_and_icons/app_colors.dart';
import 'package:way_to_success/features/cart/domain/entities/cart_entity.dart';
import 'package:way_to_success/generated/l10n.dart';

class TotalAndDelivery extends StatelessWidget {
  TotalAndDelivery({Key? key, required this.cartEntity}) : super(key: key);
  CartEntity cartEntity;
  @override
  Widget build(BuildContext context) {
    final tempTotal = cartEntity.total.toString();
    final total = tempTotal.substring(0, 1) + "," + tempTotal.substring(1, 4);
    final delivery = cartEntity.delivery;

    return Column(
      children: [
        const SizedBox(height: 70),
        _LineWidget(context, 3),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(S.of(context).total,
                      style: const TextStyle(color: Colors.white)),
                  const SizedBox(height: 20),
                  Text(S.of(context).delivery,
                      style: const TextStyle(color: Colors.white))
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '\$$total us',
                    style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 16),
                  ),
                  const SizedBox(height: 20),
                  Text(
                    delivery,
                    style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 16),
                  ),
                ],
              ),
            ],
          ),
        ),
        _LineWidget(context, 1),
        const SizedBox(height: 30),
        Container(
          width: 350,
          height: 50,
          decoration: const BoxDecoration(
            color: AppColors.orange,
            borderRadius: BorderRadius.all(
              Radius.circular(10),
            ),
          ),
          child: Center(
            child: Text(
              S.of(context).checkout,
              style: const TextStyle(
                  color: Colors.white,
                  fontSize: 22,
                  fontWeight: FontWeight.bold),
            ),
          ),
        ),
      ],
    );
  }

  Container _LineWidget(BuildContext context, double? value) {
    return Container(
      height: value,
      width: MediaQuery.of(context).size.width,
      color: Colors.white24,
    );
  }
}
