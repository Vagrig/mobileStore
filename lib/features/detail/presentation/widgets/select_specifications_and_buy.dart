import 'dart:developer';
import 'dart:ui';
import 'package:carousel_slider/utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:way_to_success/common/app_colors.dart';
import 'package:way_to_success/features/cart/presentation/pages/cart_screen.dart';
import 'package:way_to_success/features/detail/domain/entities/detail_entity.dart';
import 'package:way_to_success/resources/custom_icons.dart';

class SelectSpecificationsAndBuy extends StatefulWidget {
  SelectSpecificationsAndBuy({Key? key, required this.detailEntity})
      : super(key: key);

  DetailEntity detailEntity;

  @override
  State<SelectSpecificationsAndBuy> createState() =>
      _SelectSpecificationsAndBuyState();
}

class _SelectSpecificationsAndBuyState
    extends State<SelectSpecificationsAndBuy> {
  bool firstFlag = true;
  @override
  Widget build(BuildContext context) {
    var brownColor = _colorFromHex(widget.detailEntity.color.first);
    var darkBlueColor = _colorFromHex(widget.detailEntity.color.last);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Select color and capacity',
          style: TextStyle(
            color: AppColors.darkBlue,
            fontSize: 17,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 13),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Row(
              children: [
                Container(
                  width: 40,
                  height: 40,
                  padding: const EdgeInsets.only(right: 4, top: 2),
                  decoration: BoxDecoration(
                      color: brownColor,
                      borderRadius:
                          const BorderRadius.all(Radius.circular(30))),
                  child: firstFlag
                      ? IconButton(
                          icon: const Icon(
                            CustomIcons.ok,
                            size: 12,
                            color: Colors.white,
                          ),
                          onPressed: () {},
                        )
                      : IconButton(
                          onPressed: () {
                            setState(() {
                              firstFlag = !firstFlag;
                            });
                          },
                          icon: Container()),
                ),
                const SizedBox(width: 20),
                Container(
                  width: 40,
                  height: 40,
                  padding: const EdgeInsets.only(right: 4, top: 2),
                  decoration: BoxDecoration(
                      color: darkBlueColor,
                      borderRadius:
                          const BorderRadius.all(Radius.circular(30))),
                  child: !firstFlag
                      ? IconButton(
                          icon: const Icon(
                            CustomIcons.ok,
                            size: 12,
                            color: Colors.white,
                          ),
                          onPressed: () {},
                        )
                      : IconButton(
                          onPressed: () {
                            setState(() {
                              firstFlag = !firstFlag;
                            });
                          },
                          icon: Container()),
                ),
              ],
            ),
            _CapacityWidget(detailEntity: widget.detailEntity),
          ],
        ),
        const SizedBox(height: 20),
        _BuyWidget(
          detailEntity: widget.detailEntity,
        ),
      ],
    );
  }

  Color _colorFromHex(String hexColor) {
    final hexCode = hexColor.replaceAll('#', '');
    return Color(int.parse('FF$hexCode', radix: 16));
  }
}

class _CapacityWidget extends StatelessWidget {
  _CapacityWidget({
    Key? key,
    required this.detailEntity,
  }) : super(key: key);
  DetailEntity detailEntity;

  @override
  Widget build(BuildContext context) {
    final smallCapacity = detailEntity.capacity.first;
    final bigCapacity = detailEntity.capacity.last;

    return DefaultTabController(
      length: 2,
      child: SizedBox(
        height: 35,
        width: 200,
        child: TabBar(
          indicator: const BoxDecoration(
              color: AppColors.orange,
              borderRadius: BorderRadius.all(Radius.circular(10))),
          indicatorPadding: const EdgeInsets.symmetric(horizontal: 10),
          labelPadding: const EdgeInsets.only(top: 3),
          unselectedLabelColor: Colors.grey,
          labelColor: Colors.white,
          tabs: [
            Text(
              smallCapacity,
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              bigCapacity.toUpperCase(),
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _BuyWidget extends StatelessWidget {
  _BuyWidget({
    Key? key,
    required this.detailEntity,
  }) : super(key: key);
  DetailEntity detailEntity;

  @override
  Widget build(BuildContext context) {
    final tempPrice = detailEntity.price.toString();
    final price = tempPrice.substring(0, 1) + "," + tempPrice.substring(1, 4);
    return InkWell(
      child: Container(
        decoration: const BoxDecoration(
            color: AppColors.orange,
            borderRadius: BorderRadius.all(Radius.circular(10))),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text('Add to Cart',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 22,
                    color: Colors.white,
                  )),
              Text(
                '\$' + price + '.00',
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 22,
                  color: Colors.white,
                ),
              )
            ],
          ),
        ),
      ),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const CartScreen(),
          ),
        );
      },
    );
  }
}
