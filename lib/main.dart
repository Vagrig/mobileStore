import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:way_to_success/common/variables/app_variables.dart';
import 'package:way_to_success/features/cart/presentation/bloc/cart_bloc.dart';
import 'package:way_to_success/features/cart/presentation/pages/cart_screen.dart';
import 'package:way_to_success/features/detail/presentation/pages/detail_screen.dart';
import 'package:way_to_success/locator_services.dart' as di;
import 'features/detail/presentation/bloc/detail_bloc.dart';
import 'features/home/presentation/bloc/home_bloc.dart';
import 'features/home/presentation/pages/home_screen.dart';
import 'generated/l10n.dart';
import 'locator_services.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<HomeBloc>(
          create: (context) => sl<HomeBloc>(),
        ),
        BlocProvider<DetailBloc>(
          create: (context) => sl<DetailBloc>(),
        ),
        BlocProvider<CartBloc>(
          create: (context) => sl<CartBloc>(),
        )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        localizationsDelegates: const [
          S.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: S.delegate.supportedLocales,
        theme: ThemeData(
          fontFamily: AppVariables.fontStyle,
        ),
        home: const HomeScreen(),
        routes: {
          AppVariables.homeRoute: (_) => const HomeScreen(),
          AppVariables.detailRoute: (_) => const DetailScreen(),
          AppVariables.cartRoute: (_) => const CartScreen(),
        },
      ),
    );
  }
}
