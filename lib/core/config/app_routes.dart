import 'package:go_router/go_router.dart';
import 'package:habit_breaking/features/home/preseantation/views/add_habit_view.dart';
import 'package:habit_breaking/features/home/preseantation/views/home_view.dart';


class AppRoutes {


  static const String kHome = '/';
  static const String kAddHabit = '/addHabit';

  static final GoRouter router = GoRouter(
    initialLocation: kHome,
    debugLogDiagnostics: true,
    routes: <GoRoute>[
      GoRoute(
        path: kHome,
        builder: (context, state) => const HomeView(),
      ),
      GoRoute(
        path: kAddHabit,
        builder: (context, state) => const AddHabitView(),
      )

    ],
  );
}
