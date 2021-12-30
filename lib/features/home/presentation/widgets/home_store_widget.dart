import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:way_to_success/common/app_colors.dart';
import 'package:way_to_success/features/home/domain/entities/home_entity.dart';

class HomeStoreWidget extends StatelessWidget {
  HomeStoreWidget({Key? key, required this.mainEntity}) : super(key: key);
  HomeEntity mainEntity;
  @override
  Widget build(BuildContext context) {
    final lenght = mainEntity.homeStore.length;
    final image = mainEntity.homeStore;
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: const [
            Text(
              'Hot sales',
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
        Container(
          child: CarouselSlider.builder(
              itemCount: lenght,
              options: CarouselOptions(
                height: 210,
                autoPlay: true,
                autoPlayInterval: const Duration(seconds: 3),
                autoPlayAnimationDuration: const Duration(milliseconds: 1100),
                viewportFraction: 1,
              ),
              itemBuilder: (context, index, realIndex) {
                return _buildImage(image[index].picture, index, mainEntity);
              }),
        ),
      ],
    );
  }
}

Widget _buildImage(String image, int index, HomeEntity mainEntity) {
  final array = mainEntity.homeStore;
  return Container(
    clipBehavior: Clip.hardEdge,
    decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(10))),
    child: Stack(children: [
      Image.network(
        image,
        height: 210,
        fit: BoxFit.cover,
      ),
      Padding(
        padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 25),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            array[index].isNew != null
                ? const _NewIconWidget()
                : const SizedBox(height: 30),
            const SizedBox(height: 25),
            Text(array[index].title,
                style: index != 1
                    ? const TextStyle(
                        color: Colors.white,
                        fontSize: 26,
                        fontWeight: FontWeight.bold)
                    : const TextStyle(
                        color: AppColors.darkBlue,
                        fontSize: 26,
                        fontWeight: FontWeight.bold)),
            Text(
              array[index].subtitle,
              style: index != 1
                  ? const TextStyle(color: Colors.white, fontSize: 13)
                  : const TextStyle(color: AppColors.darkBlue, fontSize: 13),
            ),
            const SizedBox(height: 25),
            SizedBox(
              width: 118,
              child: _BuyButtonWidget(index: index),
            ),
          ],
        ),
      ),
    ]),
  );
}

class _NewIconWidget extends StatelessWidget {
  const _NewIconWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 30,
      width: 30,
      decoration: const BoxDecoration(
        color: AppColors.orange,
        borderRadius: BorderRadius.all(
          Radius.circular(30),
        ),
      ),
      child: const Center(
        child: Text(
          'New',
          style: TextStyle(
            color: Colors.white,
            fontSize: 10,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}

class _BuyButtonWidget extends StatelessWidget {
  const _BuyButtonWidget({
    Key? key,
    required this.index,
  }) : super(key: key);
  final index;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
        minimumSize: MaterialStateProperty.all(Size(150, 30)),
        overlayColor: MaterialStateProperty.all(AppColors.orange),
        backgroundColor: index != 1
            ? MaterialStateProperty.all(Colors.white)
            : MaterialStateProperty.all(AppColors.darkBlue),
      ),
      onPressed: () {},
      child: index != 1
          ? const Text('Buy now!',
              style: TextStyle(
                  color: AppColors.darkBlue,
                  fontSize: 14,
                  fontWeight: FontWeight.bold))
          : const Text(
              'Buy now!',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                  fontWeight: FontWeight.bold),
            ),
    );
  }
}
