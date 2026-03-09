import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/widgets/custom_snack_bar.dart';
import '../../domain/entities/category_entity.dart';
import '../../domain/entities/habit_entity.dart';
import '../logic/habit_cubit.dart';
import 'custom_button.dart';
import 'custom_text_field.dart';
import 'habit_list.dart';

class AddHabitViewBody extends StatefulWidget {
  const AddHabitViewBody({super.key});

  @override
  State<AddHabitViewBody> createState() => _AddHabitViewBodyState();
}

class _AddHabitViewBodyState extends State<AddHabitViewBody> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  CategoryEntity? _selectedCategory;

  @override
  void dispose() {
    _nameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Habit Name',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Theme.of(context).textTheme.bodyLarge?.color),
            ),
            SizedBox(height: 8),
            CustomTextFormField(
              controller: _nameController,

              hintText: 'e.g. Smoking, Nail Biting',
              validator: (value) {
                if(value != null && value.isNotEmpty){
                  return null;
                }
                return "Please Enter Habit Name";
              },
            ),
            SizedBox(height: 24),
            Text(
              'Choose an icon that represents your habit',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Theme.of(context).textTheme.bodyLarge?.color),
            ),
            SizedBox(height: 8),
            Expanded(child: HabitsList(
              onSelected: (category) {
                _selectedCategory = category;
              },
            )),
            SizedBox(height: 16),
            Align(
              alignment: AlignmentGeometry.center,
              child: CustomButton(
                  text: "Start Tracking",
                  onPressed: () {
                    if(_formKey.currentState!.validate()){
                      if (_selectedCategory == null) {
                        CustomSnackBar.show(
                            context,
                            message: "Please select a habit icon",
                            backgroundColor: Colors.red
                        );
                        return;
                      }

                      final newHabit = HabitEntity(
                        id: DateTime.now().millisecondsSinceEpoch,
                        name: _nameController.text.trim(),
                        category: _selectedCategory!.name,
                        createdAt: DateTime.now(),
                      );

                      context.read<HabitCubit>().addHabit(newHabit);
                      GoRouter.of(context).pop();

                    } else {
                      CustomSnackBar.show(
                          context,
                          message: "Habit name is missing",
                          backgroundColor: Colors.red
                      );
                    }
                  }
              ),
            ),
            SizedBox(height: 36),
            Align(
              alignment: AlignmentGeometry.center,
              child: Text(
                "You're about to start an amazing journey! 🌟\n Every day counts, and we'll be here to support you.",
                style: TextStyle(color: Theme.of(context).textTheme.bodyMedium?.color),
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
}

