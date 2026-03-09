import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:habit_breaking/core/config/app_theme.dart';
import 'package:habit_breaking/core/logic/theme_cubit.dart';
import 'package:habit_breaking/features/home/preseantation/logic/habit_cubit.dart';
import 'package:hive_flutter/adapters.dart';

import 'core/config/app_constants.dart';
import 'core/config/app_routes.dart';
import 'features/home/domain/entities/habit_entity.dart';

Future<void> main() async {


  // Initialize Hive for Flutter
  await Hive.initFlutter();


  Hive.registerAdapter(HabitEntityAdapter());

  // Open the Hive box to store items
  await Hive.openBox<HabitEntity>(AppConstants.boxName);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => HabitCubit()..getHabits()),
        BlocProvider(create: (context) => ThemeCubit()),
      ],
      child: ScreenUtilInit(
        designSize: const Size(375, 812),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, child) {
          return BlocBuilder<ThemeCubit, ThemeMode>(
            builder: (context, themeMode) {
              return MaterialApp.router(
                title: 'Flutter Demo',
                debugShowCheckedModeBanner: false,
                theme: AppTheme.lightTheme,
                darkTheme: AppTheme.darkTheme,
                themeMode: themeMode,
                routerConfig: AppRoutes.router,
              );
            },
          );
        },
      ),
    );
  }
}
