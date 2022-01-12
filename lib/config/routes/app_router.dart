import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:university_chat_app/config/routes/route_guards.dart';
import 'package:university_chat_app/core/authentication/login/login_page.dart';
import 'package:university_chat_app/core/authentication/profile/profile_page.dart';
import 'package:university_chat_app/core/pages/chats/chat_details_page.dart';
import 'package:university_chat_app/core/pages/init.dart';
import 'package:university_chat_app/core/side_drawer/init.dart';
import 'package:university_chat_app/shared/chat_settings_page.dart';
import 'package:university_chat_app/shared/sliver_chat_detail_page.dart';
import 'package:university_chat_app/shared/sliver_with_appbar.dart';

@MaterialAutoRouter(
  replaceInRouteName: 'Page,Route',
  routes: <AutoRoute>[
    // AutoRoute(path: '/chats/:id', page: ChatDetailsPage, guards: [AuthGuard]),
    AutoRoute(
      path: '/',
      page: MainPage,
      guards: [AuthGuard],
      children: [
        AutoRoute(
          path: 'home',
          name: 'HomeTab',
          page: EmptyRouterPage,
          children: [
            AutoRoute(path: '', page: HomePage, initial: true),
            RedirectRoute(path: '*', redirectTo: '/home'),
          ],
        ),
        AutoRoute(
          path: 'chats',
          name: 'ChatsTab',
          page: EmptyRouterPage,
          children: [
            AutoRoute(path: '', page: ChatsPage),
            AutoRoute(
              path: ':id',
              page: ChatDetailsPage,
              children: [
                AutoRoute(path: 'settings', page: ChatSettingsPage),
              ],
            ),
            // RedirectRoute(path: '*', redirectTo: ''),
          ],
        ),

        AutoRoute(
          path: 'departments',
          name: 'DepartmentsTab',
          page: EmptyRouterPage,
          children: [
            AutoRoute(path: '', page: DepartmentsPage),
            AutoRoute(
              path: ':id',
              page: SliverChatDetailsPage,
              children: [
                AutoRoute(path: 'settings', page: ChatSettingsPage),
              ],
            ),
            // AutoRoute(path: ':id', page: ChatDetailsPage),
            // RedirectRoute(path: '*', redirectTo: ''),
          ],
        ),
        AutoRoute(
          path: 'courses',
          name: 'CoursesTab',
          page: EmptyRouterPage,
          children: [
            AutoRoute(path: '', page: CoursesPage),
            AutoRoute(
              path: ':id',
              page: SliverChatDetailsPage,
              children: [
                AutoRoute(path: 'settings', page: ChatSettingsPage),
              ],
            ),
            // RedirectRoute(path: '*', redirectTo: ''),
          ],
        ),
        AutoRoute(
          path: 'discover',
          name: 'DiscoverTab',
          page: DiscoverPage,
          children: [
            AutoRoute(path: '', page: DiscoverPage),
            RedirectRoute(path: '*', redirectTo: '/discover'),
          ],
        ),
        // AutoRoute(
        //   page: DepartmentsPage,
        //   path: 'departments',
        //   guards: [AuthGuard],
        // ),
        // AutoRoute(page: CoursesPage, path: 'courses', guards: [AuthGuard]),
        // AutoRoute(page: DiscoverPage, path: 'discover', guards: [AuthGuard]),
      ],
    ),
    AutoRoute(page: SchedulePage, path: '/schedule', guards: [AuthGuard]),
    AutoRoute(page: GradesPage, path: '/grades', guards: [AuthGuard]),
    AutoRoute(page: NotesPage, path: '/notes', guards: [AuthGuard]),
    AutoRoute(page: SettingsPage, path: '/settings', guards: [AuthGuard]),
    AutoRoute(page: LoginPage, path: '/login', guards: [LoginGuard]),
    AutoRoute(page: SliverAppBarWithAppBarPage, path: '/test'),
    CustomRoute(
      page: ProfilePage,
      path: '/profile',
      guards: [AuthGuard],
      transitionsBuilder: TransitionsBuilders.slideTop,
    )
  ],
)
class $AppRouter {}
