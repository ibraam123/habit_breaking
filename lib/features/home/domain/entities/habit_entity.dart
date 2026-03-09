import 'package:equatable/equatable.dart';
import 'package:hive/hive.dart';

part 'habit_entity.g.dart'; // generated adapter file

@HiveType(typeId: 0)
// ignore: must_be_immutable
class HabitEntity extends HiveObject with EquatableMixin {
  @HiveField(0)
  final int id;

  @HiveField(1)
  final String name;

  @HiveField(2)
  final int days;

  @HiveField(3)
  final String category;

  @HiveField(4)
  final DateTime createdAt;

  HabitEntity({
    required this.id,
    required this.name,
    required this.category,
    this.days = 0,
    required this.createdAt,
  });

  @override
  List<Object?> get props => [id, name, days, category, createdAt];
}