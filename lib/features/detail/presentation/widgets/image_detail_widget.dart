import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:way_to_success/common/app_colors.dart';
import 'package:way_to_success/features/cart/presentation/pages/cart_screen.dart';
import 'package:way_to_success/features/detail/domain/entities/detail_entity.dart';
import 'package:way_to_success/resources/custom_icons.dart';

class ImageDetailWidget extends StatelessWidget {
  ImageDetailWidget({Key? key, required this.detailEntity}) : super(key: key);

  DetailEntity detailEntity;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          const SizedBox(height: 15),
          const _HeadlineWidget(),
          const SizedBox(height: 25),
          _CarouselWidget(detailEntity: detailEntity),
        ],
      ),
    );
  }
}

class _HeadlineWidget extends StatelessWidget {
  const _HeadlineWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          width: 35,
          height: 35,
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
              size: 15,
            ),
          ),
        ),
        const Text(
          'Product Details',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        Container(
          width: 35,
          height: 35,
          decoration: const BoxDecoration(
            color: AppColors.orange,
            borderRadius: BorderRadius.all(
              Radius.circular(10),
            ),
          ),
          child: IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const CartScreen(),
                ),
              );
            },
            icon: const Icon(
              CustomIcons.store,
              size: 15,
              color: Colors.white,
            ),
          ),
        ),
      ],
    );
  }
}

class _CarouselWidget extends StatelessWidget {
  const _CarouselWidget({
    Key? key,
    required this.detailEntity,
  }) : super(key: key);

  final DetailEntity detailEntity;

  @override
  Widget build(BuildContext context) {
    final length = detailEntity.images!.length;
    final image = detailEntity.images!;
    return CarouselSlider.builder(
      itemCount: length,
      options: CarouselOptions(
        height: 380,
        enlargeCenterPage: true,
        autoPlay: true,
        autoPlayInterval: const Duration(seconds: 3),
        autoPlayAnimationDuration: const Duration(milliseconds: 1100),
        viewportFraction: 1,
      ),
      itemBuilder: (context, index, realIndex) {
        return Container(
          margin: const EdgeInsets.symmetric(
            horizontal: 30,
            vertical: 20,
          ),
          width: 280,
          clipBehavior: Clip.hardEdge,
          decoration: const BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Colors.black12,
                spreadRadius: 1,
                blurRadius: 10,
                offset: Offset(0, 10),
              )
            ],
            borderRadius: BorderRadius.all(
              Radius.circular(15),
            ),
          ),
          child: Image.network(
            image[index],
            fit: BoxFit.cover,
          ),
        );
      },
    );
  }
}
