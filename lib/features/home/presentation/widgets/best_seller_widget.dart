import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:way_to_success/common/app_colors.dart';
import 'package:way_to_success/features/detail/presentation/pages/detail_screen.dart';
import 'package:way_to_success/features/home/domain/entities/home_entity.dart';
import 'package:way_to_success/resources/custom_icons.dart';

class BestSellerWidget extends StatelessWidget {
  BestSellerWidget({Key? key, required this.mainEntity}) : super(key: key);
  HomeEntity mainEntity;
  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: const [
          Text(
            'Best Seller',
            style: TextStyle(
                fontSize: 27,
                color: AppColors.darkBlue,
                fontWeight: FontWeight.bold),
          ),
          Text(
            'see more',
            style: TextStyle(color: AppColors.orange),
          ),
        ],
      ),
      const SizedBox(height: 10),
      Column(children: [
        Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
          _myContainer(context, mainEntity, 0),
          _myContainer(context, mainEntity, 1),
        ]),
        const SizedBox(height: 13),
        Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
          _myContainer(context, mainEntity, 2),
          _myContainer(context, mainEntity, 3),
        ])
      ]),
    ]);
  }
}

Widget _myContainer(BuildContext context, HomeEntity mainArray, int index) {
  final array = mainArray.bestSeller;
  return GestureDetector(
    onTap: () {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const DetailScreen(),
        ),
      );
    },
    child: Stack(
      children: [
        _InfoWidget(array: array, index: index),
        _FavoritesWidget(array: array, index: index),
      ],
    ),
  );
}

class _FavoritesWidget extends StatelessWidget {
  const _FavoritesWidget({
    Key? key,
    required this.index,
    required this.array,
  }) : super(key: key);

  final List<BestSellerEntity> array;
  final index;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 7,
      left: 140,
      child: Container(
        width: 28,
        height: 28,
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(
            Radius.circular(15),
          ),
        ),
        child: array[index].isFavorites
            ? const Icon(CustomIcons.favorite,
                size: 13, color: AppColors.orange)
            : const Icon(CustomIcons.noFavorite,
                size: 13, color: AppColors.orange),
      ),
    );
  }
}

class _InfoWidget extends StatelessWidget {
  const _InfoWidget({
    Key? key,
    required this.index,
    required this.array,
  }) : super(key: key);

  final List<BestSellerEntity> array;
  final index;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 250,
      width: 175,
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(
          Radius.circular(15),
        ),
      ),
      clipBehavior: Clip.hardEdge,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 190,
            width: 175,
            child: Image.network(
              array[index].picture,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(height: 5),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Row(
              children: [
                Text(
                  '\$${array[index].discountPrice}',
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: AppColors.darkBlue,
                  ),
                ),
                const SizedBox(width: 10),
                Text(
                  '\$${array[index].price}',
                  style: const TextStyle(
                    color: Colors.grey,
                    fontSize: 12,
                    decoration: TextDecoration.lineThrough,
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Text(
              array[index].title,
              style: const TextStyle(
                  color: AppColors.darkBlue,
                  fontSize: 12,
                  overflow: TextOverflow.ellipsis),
            ),
          ),
        ],
      ),
    );
  }
}
