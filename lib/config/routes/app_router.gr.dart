// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

import 'package:auto_route/auto_route.dart' as _i6;
import 'package:flutter/material.dart' as _i10;

import '../../core/authentication/login/login_page.dart' as _i3;
import '../../core/authentication/profile/profile_page.dart' as _i5;
import '../../core/pages/chats/chat_details_page.dart' as _i7;
import '../../core/pages/init.dart' as _i1;
import '../../core/side_drawer/init.dart' as _i2;
import '../../shared/chat_settings_page.dart' as _i8;
import '../../shared/sliver_chat_detail_page.dart' as _i9;
import '../../shared/sliver_with_appbar.dart' as _i4;
import 'route_guards.dart' as _i11;

class AppRouter extends _i6.RootStackRouter {
  AppRouter(
      {_i10.GlobalKey<_i10.NavigatorState>? navigatorKey,
      required this.authGuard,
      required this.loginGuard})
      : super(navigatorKey);

  final _i11.AuthGuard authGuard;

  final _i11.LoginGuard loginGuard;

  @override
  final Map<String, _i6.PageFactory> pagesMap = {
    MainRoute.name: (routeData) {
      return _i6.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i1.MainPage());
    },
    ScheduleRoute.name: (routeData) {
      return _i6.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i2.SchedulePage());
    },
    GradesRoute.name: (routeData) {
      return _i6.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i2.GradesPage());
    },
    NotesRoute.name: (routeData) {
      return _i6.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i2.NotesPage());
    },
    SettingsRoute.name: (routeData) {
      return _i6.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i2.SettingsPage());
    },
    LoginRoute.name: (routeData) {
      return _i6.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i3.LoginPage());
    },
    SliverAppBarWithAppBarRoute.name: (routeData) {
      return _i6.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i4.SliverAppBarWithAppBarPage());
    },
    ProfileRoute.name: (routeData) {
      return _i6.CustomPage<dynamic>(
          routeData: routeData,
          child: const _i5.ProfilePage(),
          transitionsBuilder: _i6.TransitionsBuilders.slideTop,
          opaque: true,
          barrierDismissible: false);
    },
    HomeTab.name: (routeData) {
      return _i6.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i6.EmptyRouterPage());
    },
    ChatsTab.name: (routeData) {
      return _i6.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i6.EmptyRouterPage());
    },
    DepartmentsTab.name: (routeData) {
      return _i6.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i6.EmptyRouterPage());
    },
    CoursesTab.name: (routeData) {
      return _i6.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i6.EmptyRouterPage());
    },
    DiscoverTab.name: (routeData) {
      return _i6.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i1.DiscoverPage());
    },
    HomeRoute.name: (routeData) {
      return _i6.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i1.HomePage());
    },
    ChatsRoute.name: (routeData) {
      return _i6.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i1.ChatsPage());
    },
    ChatDetailsRoute.name: (routeData) {
      final pathParams = routeData.inheritedPathParams;
      final args = routeData.argsAs<ChatDetailsRouteArgs>(
          orElse: () =>
              ChatDetailsRouteArgs(chatID: pathParams.getString('id')));
      return _i6.MaterialPageX<dynamic>(
          routeData: routeData,
          child: _i7.ChatDetailsPage(key: args.key, chatID: args.chatID));
    },
    ChatSettingsRoute.name: (routeData) {
      return _i6.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i8.ChatSettingsPage());
    },
    DepartmentsRoute.name: (routeData) {
      return _i6.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i1.DepartmentsPage());
    },
    SliverChatDetailsRoute.name: (routeData) {
      final pathParams = routeData.inheritedPathParams;
      final args = routeData.argsAs<SliverChatDetailsRouteArgs>(
          orElse: () =>
              SliverChatDetailsRouteArgs(chatID: pathParams.getString('id')));
      return _i6.MaterialPageX<dynamic>(
          routeData: routeData,
          child: _i9.SliverChatDetailsPage(key: args.key, chatID: args.chatID));
    },
    CoursesRoute.name: (routeData) {
      return _i6.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i1.CoursesPage());
    },
    DiscoverRoute.name: (routeData) {
      return _i6.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i1.DiscoverPage());
    }
  };

  @override
  List<_i6.RouteConfig> get routes => [
        _i6.RouteConfig(MainRoute.name, path: '/', guards: [
          authGuard
        ], children: [
          _i6.RouteConfig(HomeTab.name,
              path: 'home',
              parent: MainRoute.name,
              children: [
                _i6.RouteConfig(HomeRoute.name, path: '', parent: HomeTab.name),
                _i6.RouteConfig('*#redirect',
                    path: '*',
                    parent: HomeTab.name,
                    redirectTo: '/home',
                    fullMatch: true)
              ]),
          _i6.RouteConfig(ChatsTab.name,
              path: 'chats',
              parent: MainRoute.name,
              children: [
                _i6.RouteConfig(ChatsRoute.name,
                    path: '', parent: ChatsTab.name),
                _i6.RouteConfig(ChatDetailsRoute.name,
                    path: ':id',
                    parent: ChatsTab.name,
                    children: [
                      _i6.RouteConfig(ChatSettingsRoute.name,
                          path: 'settings', parent: ChatDetailsRoute.name)
                    ])
              ]),
          _i6.RouteConfig(DepartmentsTab.name,
              path: 'departments',
              parent: MainRoute.name,
              children: [
                _i6.RouteConfig(DepartmentsRoute.name,
                    path: '', parent: DepartmentsTab.name),
                _i6.RouteConfig(SliverChatDetailsRoute.name,
                    path: ':id',
                    parent: DepartmentsTab.name,
                    children: [
                      _i6.RouteConfig(ChatSettingsRoute.name,
                          path: 'settings', parent: SliverChatDetailsRoute.name)
                    ])
              ]),
          _i6.RouteConfig(CoursesTab.name,
              path: 'courses',
              parent: MainRoute.name,
              children: [
                _i6.RouteConfig(CoursesRoute.name,
                    path: '', parent: CoursesTab.name),
                _i6.RouteConfig(SliverChatDetailsRoute.name,
                    path: ':id',
                    parent: CoursesTab.name,
                    children: [
                      _i6.RouteConfig(ChatSettingsRoute.name,
                          path: 'settings', parent: SliverChatDetailsRoute.name)
                    ])
              ]),
          _i6.RouteConfig(DiscoverTab.name,
              path: 'discover',
              parent: MainRoute.name,
              children: [
                _i6.RouteConfig(DiscoverRoute.name,
                    path: '', parent: DiscoverTab.name),
                _i6.RouteConfig('*#redirect',
                    path: '*',
                    parent: DiscoverTab.name,
                    redirectTo: '/discover',
                    fullMatch: true)
              ])
        ]),
        _i6.RouteConfig(ScheduleRoute.name,
            path: '/schedule', guards: [authGuard]),
        _i6.RouteConfig(GradesRoute.name, path: '/grades', guards: [authGuard]),
        _i6.RouteConfig(NotesRoute.name, path: '/notes', guards: [authGuard]),
        _i6.RouteConfig(SettingsRoute.name,
            path: '/settings', guards: [authGuard]),
        _i6.RouteConfig(LoginRoute.name, path: '/login', guards: [loginGuard]),
        _i6.RouteConfig(SliverAppBarWithAppBarRoute.name, path: '/test'),
        _i6.RouteConfig(ProfileRoute.name,
            path: '/profile', guards: [authGuard])
      ];
}

/// generated route for [_i1.MainPage]
class MainRoute extends _i6.PageRouteInfo<void> {
  const MainRoute({List<_i6.PageRouteInfo>? children})
      : super(name, path: '/', initialChildren: children);

  static const String name = 'MainRoute';
}

/// generated route for [_i2.SchedulePage]
class ScheduleRoute extends _i6.PageRouteInfo<void> {
  const ScheduleRoute() : super(name, path: '/schedule');

  static const String name = 'ScheduleRoute';
}

/// generated route for [_i2.GradesPage]
class GradesRoute extends _i6.PageRouteInfo<void> {
  const GradesRoute() : super(name, path: '/grades');

  static const String name = 'GradesRoute';
}

/// generated route for [_i2.NotesPage]
class NotesRoute extends _i6.PageRouteInfo<void> {
  const NotesRoute() : super(name, path: '/notes');

  static const String name = 'NotesRoute';
}

/// generated route for [_i2.SettingsPage]
class SettingsRoute extends _i6.PageRouteInfo<void> {
  const SettingsRoute() : super(name, path: '/settings');

  static const String name = 'SettingsRoute';
}

/// generated route for [_i3.LoginPage]
class LoginRoute extends _i6.PageRouteInfo<void> {
  const LoginRoute() : super(name, path: '/login');

  static const String name = 'LoginRoute';
}

/// generated route for [_i4.SliverAppBarWithAppBarPage]
class SliverAppBarWithAppBarRoute extends _i6.PageRouteInfo<void> {
  const SliverAppBarWithAppBarRoute() : super(name, path: '/test');

  static const String name = 'SliverAppBarWithAppBarRoute';
}

/// generated route for [_i5.ProfilePage]
class ProfileRoute extends _i6.PageRouteInfo<void> {
  const ProfileRoute() : super(name, path: '/profile');

  static const String name = 'ProfileRoute';
}

/// generated route for [_i6.EmptyRouterPage]
class HomeTab extends _i6.PageRouteInfo<void> {
  const HomeTab({List<_i6.PageRouteInfo>? children})
      : super(name, path: 'home', initialChildren: children);

  static const String name = 'HomeTab';
}

/// generated route for [_i6.EmptyRouterPage]
class ChatsTab extends _i6.PageRouteInfo<void> {
  const ChatsTab({List<_i6.PageRouteInfo>? children})
      : super(name, path: 'chats', initialChildren: children);

  static const String name = 'ChatsTab';
}

/// generated route for [_i6.EmptyRouterPage]
class DepartmentsTab extends _i6.PageRouteInfo<void> {
  const DepartmentsTab({List<_i6.PageRouteInfo>? children})
      : super(name, path: 'departments', initialChildren: children);

  static const String name = 'DepartmentsTab';
}

/// generated route for [_i6.EmptyRouterPage]
class CoursesTab extends _i6.PageRouteInfo<void> {
  const CoursesTab({List<_i6.PageRouteInfo>? children})
      : super(name, path: 'courses', initialChildren: children);

  static const String name = 'CoursesTab';
}

/// generated route for [_i1.DiscoverPage]
class DiscoverTab extends _i6.PageRouteInfo<void> {
  const DiscoverTab({List<_i6.PageRouteInfo>? children})
      : super(name, path: 'discover', initialChildren: children);

  static const String name = 'DiscoverTab';
}

/// generated route for [_i1.HomePage]
class HomeRoute extends _i6.PageRouteInfo<void> {
  const HomeRoute() : super(name, path: '');

  static const String name = 'HomeRoute';
}

/// generated route for [_i1.ChatsPage]
class ChatsRoute extends _i6.PageRouteInfo<void> {
  const ChatsRoute() : super(name, path: '');

  static const String name = 'ChatsRoute';
}

/// generated route for [_i7.ChatDetailsPage]
class ChatDetailsRoute extends _i6.PageRouteInfo<ChatDetailsRouteArgs> {
  ChatDetailsRoute(
      {_i10.Key? key,
      required String chatID,
      List<_i6.PageRouteInfo>? children})
      : super(name,
            path: ':id',
            args: ChatDetailsRouteArgs(key: key, chatID: chatID),
            rawPathParams: {'id': chatID},
            initialChildren: children);

  static const String name = 'ChatDetailsRoute';
}

class ChatDetailsRouteArgs {
  const ChatDetailsRouteArgs({this.key, required this.chatID});

  final _i10.Key? key;

  final String chatID;

  @override
  String toString() {
    return 'ChatDetailsRouteArgs{key: $key, chatID: $chatID}';
  }
}

/// generated route for [_i8.ChatSettingsPage]
class ChatSettingsRoute extends _i6.PageRouteInfo<void> {
  const ChatSettingsRoute() : super(name, path: 'settings');

  static const String name = 'ChatSettingsRoute';
}

/// generated route for [_i1.DepartmentsPage]
class DepartmentsRoute extends _i6.PageRouteInfo<void> {
  const DepartmentsRoute() : super(name, path: '');

  static const String name = 'DepartmentsRoute';
}

/// generated route for [_i9.SliverChatDetailsPage]
class SliverChatDetailsRoute
    extends _i6.PageRouteInfo<SliverChatDetailsRouteArgs> {
  SliverChatDetailsRoute(
      {_i10.Key? key,
      required String chatID,
      List<_i6.PageRouteInfo>? children})
      : super(name,
            path: ':id',
            args: SliverChatDetailsRouteArgs(key: key, chatID: chatID),
            rawPathParams: {'id': chatID},
            initialChildren: children);

  static const String name = 'SliverChatDetailsRoute';
}

class SliverChatDetailsRouteArgs {
  const SliverChatDetailsRouteArgs({this.key, required this.chatID});

  final _i10.Key? key;

  final String chatID;

  @override
  String toString() {
    return 'SliverChatDetailsRouteArgs{key: $key, chatID: $chatID}';
  }
}

/// generated route for [_i1.CoursesPage]
class CoursesRoute extends _i6.PageRouteInfo<void> {
  const CoursesRoute() : super(name, path: '');

  static const String name = 'CoursesRoute';
}

/// generated route for [_i1.DiscoverPage]
class DiscoverRoute extends _i6.PageRouteInfo<void> {
  const DiscoverRoute() : super(name, path: '');

  static const String name = 'DiscoverRoute';
}
