import 'package:bloc/bloc.dart';
import 'package:habit_breaking/features/home/domain/entities/habit_entity.dart';
import 'package:hive/hive.dart';
import 'package:meta/meta.dart';

import '../../../../core/config/app_constants.dart';

part 'habit_state.dart';

class HabitCubit extends Cubit<HabitState> {
  HabitCubit() : super(HabitInitial());

  final Box<HabitEntity> _habitBox = Hive.box<HabitEntity>(AppConstants.boxName);

  void getHabits() {
    try {
      emit(HabitLoading());
      final List<HabitEntity> habits = _habitBox.values.toList();
      emit(HabitLoaded(habits: habits));
    } catch (e) {
      emit(HabitError(message: e.toString()));
    }
  }

  Future<void> addHabit(HabitEntity habit) async {
    try {
      emit(HabitLoading());
      // Use auto-increment key to avoid integer limit
      await _habitBox.add(habit);
      getHabits();
    } catch (e) {
      emit(HabitError(message: e.toString()));
    }
  }

  Future<void> deleteHabit(int key) async {
    try {
      emit(HabitLoading());
      // If you used auto-increment keys, pass the Hive key, not habit.id
      await _habitBox.delete(key);
      getHabits();
    } catch (e) {
      emit(HabitError(message: e.toString()));
    }
  }

  Future<void> updateHabit(int key, HabitEntity habit) async {
    try {
      emit(HabitLoading());
      // Update by Hive key
      await _habitBox.put(key, habit);
      getHabits();
    } catch (e) {
      emit(HabitError(message: e.toString()));
    }
  }
}