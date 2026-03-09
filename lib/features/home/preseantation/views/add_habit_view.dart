import 'package:flutter/material.dart';
import '../widgets/add_view_habit_body.dart';

class AddHabitView extends StatelessWidget {
  const AddHabitView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: AppBar(
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Add New Habit'),
            Text(
              'What habit do you want to break?',
              style: TextStyle(fontSize: 12, color: Theme.of(context).textTheme.bodyMedium?.color),
            ),
          ],
        ),
      ),
      body: const AddHabitViewBody(),
    );
  }
}


