import 'package:auto_route/auto_route.dart';
import 'package:mood_diary/presentation/calendar/view/calendar_page.dart';
import 'package:mood_diary/presentation/presentation.dart';

part 'router.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'Page,Route')
class AppRouter extends RootStackRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(
          page: HomeRoute.page,
          path: '/',
          initial: true,
        ),
        AutoRoute(
          page: CalendarRoute.page,
          path: '/calendar',
        ),
      ];
}
