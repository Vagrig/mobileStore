import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:way_to_success/common/app_colors.dart';
import 'package:way_to_success/features/detail/domain/entities/detail_entity.dart';
import 'package:way_to_success/resources/custom_icons.dart';

class NameAndRatingWidget extends StatelessWidget {
  NameAndRatingWidget({Key? key, required this.detailEntity}) : super(key: key);
  DetailEntity detailEntity;
  @override
  Widget build(BuildContext context) {
    final title = detailEntity.title!;
    final isFavorites = detailEntity.isFavorites!;
    final rating = detailEntity.rating!;
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: const TextStyle(
                color: AppColors.darkBlue,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
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
                onPressed: () {},
                icon: isFavorites
                    ? const Icon(
                        CustomIcons.favorite,
                        size: 15,
                        color: AppColors.orange,
                      )
                    : const Icon(
                        CustomIcons.noFavorite,
                        size: 15,
                        color: Colors.white,
                      ),
              ),
            ),
          ],
        ),
        _RatingWidget(rating: rating),
      ],
    );
  }
}

class _RatingWidget extends StatelessWidget {
  _RatingWidget({
    Key? key,
    required this.rating,
  }) : super(key: key);
  double rating;

  @override
  Widget build(BuildContext context) {
    int emptyStars = 5;
    int halfStar = 0;
    int whole = rating.toInt();
    var remainder = rating % 1;

    if (remainder > 0) {
      halfStar++;
    }
    return Row(
      children: [
        for (int i = 0; i < whole; i++, emptyStars--)
          const Icon(Icons.star, color: Colors.yellow),
        if (remainder > 0)
          const Icon(
            Icons.star_half,
            color: Colors.yellow,
          ),
        for (int i = 0; i <= emptyStars - halfStar - 1; i++)
          const Icon(
            Icons.star_border,
            color: Colors.yellow,
          ),
      ],
    );
  }
}
