import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:way_to_success/common/colors_and_icons/app_colors.dart';
import 'package:way_to_success/features/detail/domain/entities/detail_entity.dart';
import 'package:way_to_success/features/detail/presentation/bloc/detail_bloc.dart';
import 'package:way_to_success/features/detail/presentation/bloc/detail_event.dart';
import 'package:way_to_success/features/detail/presentation/bloc/detail_state.dart';
import 'package:way_to_success/features/detail/presentation/widgets/detail_info_widget.dart';
import 'package:way_to_success/features/detail/presentation/widgets/image_detail_widget.dart';
import 'package:way_to_success/generated/l10n.dart';

class DetailScreen extends StatelessWidget {
  const DetailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<DetailBloc>(context, listen: false)
        .add(DetailScreenEvent());
    return Scaffold(
      body: SafeArea(
        child: BlocBuilder<DetailBloc, DetailState>(
          builder: (context, state) {
            if (state is DetailLoadingState) {
              return const Center(
                child: CircularProgressIndicator(
                  color: AppColors.orange,
                ),
              );
            }
            if (state is DetailErrorState) {
              return _ErrorAndEmptyWidget(message: state.message);
            }
            if (state is DetailEmptyState) {
              return _ErrorAndEmptyWidget(message: S.of(context).empty);
            }
            if (state is DetailLoadedState) {
              return _DetailWidgets(detailEntity: state.loadedItems);
            } else {
              return _ErrorAndEmptyWidget(message: S.of(context).unknown_error);
            }
          },
        ),
      ),
    );
  }
}

class _ErrorAndEmptyWidget extends StatelessWidget {
  _ErrorAndEmptyWidget({
    Key? key,
    required this.message,
  }) : super(key: key);
  String message;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        message,
        style: const TextStyle(
          fontSize: 25,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}

class _DetailWidgets extends StatelessWidget {
  const _DetailWidgets({
    Key? key,
    required this.detailEntity,
  }) : super(key: key);

  final List<DetailEntity> detailEntity;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 15),
      child: SingleChildScrollView(
        child: Column(
          children: [
            ImageDetailWidget(
              detailEntity: detailEntity.first,
            ),
            DetailInfoWidget(
              detailEntity: detailEntity.first,
            ),
          ],
        ),
      ),
    );
  }
}
