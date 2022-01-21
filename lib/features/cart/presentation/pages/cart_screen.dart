import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:way_to_success/common/colors_and_icons/app_colors.dart';
import 'package:way_to_success/features/cart/domain/entities/cart_entity.dart';
import 'package:way_to_success/features/cart/presentation/bloc/cart_bloc.dart';
import 'package:way_to_success/features/cart/presentation/bloc/cart_event.dart';
import 'package:way_to_success/features/cart/presentation/bloc/cart_state.dart';
import 'package:way_to_success/features/cart/presentation/widgets/headline_widget.dart';
import 'package:way_to_success/features/cart/presentation/widgets/items_cart_widget.dart';
import 'package:way_to_success/generated/l10n.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<CartBloc>(context, listen: false).add(CartScreenEvent());
    return Scaffold(
      body: SafeArea(
        child: BlocBuilder<CartBloc, CartState>(
          builder: (context, state) {
            if (state is CartLoadingState) {
              return const Center(
                child: CircularProgressIndicator(
                  color: AppColors.orange,
                ),
              );
            }
            if (state is CartErrorState) {
              return _ErrorAndEmptyWidget(message: state.message);
            }
            if (state is CartEmptyState) {
              return _ErrorAndEmptyWidget(message: S.of(context).empty);
            }
            if (state is CartLoadedState) {
              return _CartWidgets(cartEntity: state.loadedItems);
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

class _CartWidgets extends StatelessWidget {
  const _CartWidgets({
    Key? key,
    required this.cartEntity,
  }) : super(key: key);

  final List<CartEntity> cartEntity;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          const HeadlineWidget(),
          ItemsCart(cartEntity: cartEntity.first),
        ],
      ),
    );
  }
}
