import 'package:flutter/material.dart';
import 'package:way_to_success/common/colors_and_icons/app_colors.dart';
import 'package:way_to_success/features/cart/domain/entities/cart_entity.dart';
import 'package:way_to_success/features/cart/presentation/widgets/total_and_delivery_widget.dart';
import 'package:way_to_success/common/generated_icons/app_generated_icons.dart';

class ItemsCart extends StatelessWidget {
  ItemsCart({Key? key, required this.cartEntity}) : super(key: key);
  CartEntity cartEntity;
  @override
  Widget build(BuildContext context) {
    final title = cartEntity.basket.first.title;
    final price = cartEntity.basket.first.price;
    final image = cartEntity.basket.first.images;
    return Container(
      height: 595,
      width: MediaQuery.of(context).size.width,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
        color: AppColors.darkBlue,
      ),
      child: Column(
        children: [
          const SizedBox(height: 80),
          _ProductWidget(price: price, title: title, image: image),
          const SizedBox(height: 50),
          _ProductWidget(price: price, title: title, image: image),
          TotalAndDelivery(cartEntity: cartEntity),
        ],
      ),
    );
  }
}

class _ProductWidget extends StatelessWidget {
  const _ProductWidget({
    Key? key,
    required this.image,
    required this.price,
    required this.title,
  }) : super(key: key);
  final title, price, image;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 25,
      ),
      child: Row(
        children: [
          _ItemImages(),
          const SizedBox(width: 20),
          _TitleAndPrice(),
          const SizedBox(width: 20),
          _AddAndDelete(),
          const SizedBox(width: 15),
          const Icon(
            AppGeneratedIcons.delete,
            size: 17,
            color: Colors.white24,
          )
        ],
      ),
    );
  }

  Container _AddAndDelete() {
    return Container(
      width: 25,
      height: 70,
      decoration: const BoxDecoration(
        color: Colors.white30,
        borderRadius: BorderRadius.all(
          Radius.circular(20),
        ),
      ),
      child: Column(
        children: [
          _OperatorsAndNumber('–'),
          _OperatorsAndNumber('2'),
          _OperatorsAndNumber('+'),
        ],
      ),
    );
  }

  Text _OperatorsAndNumber(String text) {
    return Text(
      text,
      style: const TextStyle(
        fontSize: 18,
        color: Colors.white,
      ),
    );
  }

  Expanded _TitleAndPrice() {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 20,
            ),
          ),
          const SizedBox(height: 10),
          Text(
            '\$$price.00',
            style: const TextStyle(
              color: AppColors.orange,
              fontSize: 20,
            ),
          ),
        ],
      ),
    );
  }

  Container _ItemImages() {
    return Container(
      alignment: Alignment.center,
      width: 100,
      height: 100,
      clipBehavior: Clip.hardEdge,
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(
          Radius.circular(10),
        ),
      ),
      child: Image.network(
        image,
        height: 90,
        fit: BoxFit.cover,
      ),
    );
  }
}
