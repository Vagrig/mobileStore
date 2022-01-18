import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:way_to_success/common/app_colors.dart';
import 'package:way_to_success/core/firebase/local_notification_service.dart';
import 'package:way_to_success/features/home/domain/entities/home_entity.dart';
import 'package:way_to_success/features/home/presentation/widgets/best_seller_widget.dart';
import 'package:way_to_success/features/home/presentation/widgets/bottom_navigation_bar.dart';
import 'package:way_to_success/features/home/presentation/widgets/home_store_widget.dart';
import 'package:way_to_success/features/home/presentation/widgets/search_widget.dart';
import 'package:way_to_success/features/home/presentation/bloc/home_bloc.dart';
import 'package:way_to_success/features/home/presentation/bloc/home_event.dart';
import 'package:way_to_success/features/home/presentation/bloc/home_state.dart';
import 'package:way_to_success/features/home/presentation/widgets/geo_and_filter_widget.dart';
import 'package:way_to_success/features/home/presentation/widgets/select_category_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    LocalNotificationService.initialize(context);
    FirebaseMessaging.instance.getInitialMessage();
    FirebaseMessaging.onMessage.listen((message) {
      LocalNotificationService.display(message);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<HomeBloc>(context, listen: false).add(HomeScreenEvent());
    return Scaffold(
      bottomNavigationBar: const BottomNavigationBarWidget(),
      body: SafeArea(
        child: BlocBuilder<HomeBloc, HomeState>(
          builder: (context, state) {
            if (state is HomeLoadingState) {
              return const Center(
                child: CircularProgressIndicator(
                  color: AppColors.orange,
                ),
              );
            }
            if (state is HomeErrorState) {
              return _ErrorAndEmptyWidget(message: state.message);
            }
            if (state is HomeEmptyState) {
              return _ErrorAndEmptyWidget(message: 'Empty');
            }
            if (state is HomeLoadedState) {
              return MainWidgets(mainEntity: state.loadedItems);
            } else {
              return _ErrorAndEmptyWidget(message: 'Unknown error!');
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

  final message;

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

class MainWidgets extends StatelessWidget {
  const MainWidgets({
    Key? key,
    required this.mainEntity,
  }) : super(key: key);

  final List<HomeEntity> mainEntity;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        top: 15,
        right: 15,
        left: 15,
      ),
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(
          parent: AlwaysScrollableScrollPhysics(),
        ),
        child: Column(
          children: [
            const GeolocationAndFilter(),
            const SelectCategory(),
            const SizedBox(height: 15),
            const SearchWidget(),
            const SizedBox(height: 10),
            HomeStoreWidget(mainEntity: mainEntity.first),
            const SizedBox(height: 15),
            BestSellerWidget(mainEntity: mainEntity.first),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
