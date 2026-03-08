import 'package:go_router/go_router.dart';
import 'package:habit_breaking/features/home/preseantation/views/add_habit_view.dart';

import '../screens/main_screen.dart';

class AppRoutes {


  static const String kMain = '/';
  static const String kAddHabit = '/addHabit';

  static final GoRouter router = GoRouter(
    initialLocation: kMain,
    debugLogDiagnostics: true,
    routes: <GoRoute>[
      GoRoute(
        path: kMain,
        builder: (context, state) => const MainScreen(),
      ),
      GoRoute(
        path: kAddHabit,
        builder: (context, state) => const AddHabitView(),
      )

    ],
  );
}
