import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:habit_breaking/core/config/app_routes.dart';
import 'package:habit_breaking/core/logic/theme_cubit.dart';
import 'package:habit_breaking/core/widgets/custom_snack_bar.dart';
import 'package:habit_breaking/features/home/domain/entities/category_entity.dart';
import 'package:habit_breaking/features/home/domain/entities/habit_entity.dart';
import 'package:habit_breaking/features/home/preseantation/logic/habit_cubit.dart';
import 'package:habit_breaking/features/home/preseantation/widgets/container_icon.dart';

import '../widgets/custom_button.dart';
import '../widgets/habit_card.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Habit Breaking"),
        centerTitle: true,
        actions: [
          BlocBuilder<ThemeCubit, ThemeMode>(
            builder: (context, themeMode) {
              return IconButton(
                icon: Icon(
                  themeMode == ThemeMode.dark
                      ? Icons.light_mode_outlined
                      : Icons.dark_mode_outlined,
                ),
                onPressed: () {
                  context.read<ThemeCubit>().toggleTheme();
                },
              );
            },
          ),
        ],
      ),
      body: BlocBuilder<HabitCubit, HabitState>(
        builder: (context, state) {
          if (state is HabitLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is HabitLoaded) {
            final habits = state.habits;
            final hasHabits = habits.isNotEmpty;

            return hasHabits
                ? Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 8.h),
                    child: CustomScrollView(
                      slivers: [
                        // Space between greeting and list
                        SliverToBoxAdapter(
                          child: SizedBox(height: 16.h),
                        ),

                        // Habit Cards List
                        SliverList(
                          delegate: SliverChildBuilderDelegate(
                            (context, index) {
                              final habit = habits[index];
                              return Padding(
                                padding: EdgeInsets.all(8.w),
                                child: HabitCard(
                                  habit: habit,
                                  icon: CategoryEntity.getIconByName(habit.category),
                                  statusText: "I Failed",
                                  statusColor: Colors.red,
                                  onDelete: () {
                                    context.read<HabitCubit>().deleteHabit(habit.key as int);
                                    CustomSnackBar.show(
                                        context,
                                        message: "Habit ${habit.name} Deleted Successfully",

                                    );
                                  },
                                  onStatusPressed: () {
                                    final resetHabit = HabitEntity(
                                      id: habit.id,
                                      name: habit.name,
                                      category: habit.category,
                                      days: 0,
                                      createdAt: DateTime.now(),
                                    );
                                    context.read<HabitCubit>().updateHabit(habit.key as int, resetHabit);
                                  },
                                ),
                              );
                            },
                            childCount: habits.length,
                          ),
                        ),

                        // Space between list and button
                        SliverToBoxAdapter(
                          child: SizedBox(height: 16.h),
                        ),

                        // Add Another Habit Button
                        SliverToBoxAdapter(
                          child: GestureDetector(
                            onTap: () {
                              GoRouter.of(context).push(AppRoutes.kAddHabit);
                            },
                            child: Container(
                              width: double.infinity,
                              padding: EdgeInsets.symmetric(vertical: 10.h),
                              decoration: BoxDecoration(
                                color: Theme.of(context).colorScheme.secondary,
                                borderRadius: BorderRadius.circular(12.r),
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    "Add Another Habit",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 14.sp,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),

                        // Extra bottom padding
                        SliverToBoxAdapter(
                          child: SizedBox(height: 16.h),
                        ),
                      ],
                    ),
                  )
                : Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              // Star Icon
                              ContainerIcon(
                                icon: Icons.star_border_outlined,
                                isSelected: true,
                                size: 60.r,
                              ),
                              SizedBox(height: 20.h),
                              // Main message
                              Text(
                                "No Habits Yet",
                                style: TextStyle(
                                  fontSize: 24.sp,
                                  fontWeight: FontWeight.bold,
                                  color: Theme.of(context).textTheme.displayMedium?.color,
                                ),
                                textAlign: TextAlign.center,
                              ),
                              SizedBox(height: 10.h),
                              // Sub-message
                              Text(
                                "Take the first step towards breaking free from bad habits",
                                style: TextStyle(
                                  fontSize: 16.sp,
                                  color: Theme.of(context).textTheme.bodyMedium?.color,
                                  height: 1.4,
                                ),
                                textAlign: TextAlign.center,
                              ),
                              SizedBox(height: 30.h),
                              // Button
                              CustomButton(
                                text: "Add Your First Habit",
                                onPressed: () {
                                  GoRouter.of(context).push(AppRoutes.kAddHabit);
                                },
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
          } else if (state is HabitError) {
            return Center(child: Text('Error: ${state.message}'));
          }
          return const Center(child: Text('Initializing...'));
        },
      ),
    );
  }
}


