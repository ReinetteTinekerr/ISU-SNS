import 'package:auto_route/auto_route.dart';
import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:university_chat_app/config/routes/app_router.gr.dart';
import 'package:university_chat_app/config/routes/route_guards.dart';
import 'package:university_chat_app/config/routes/route_observer.dart';
import 'package:university_chat_app/provider/providers.dart';

class MyApp extends ConsumerStatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyApp createState() => _MyApp();
}

class _MyApp extends ConsumerState<MyApp> {
  late final AppRouter _appRouter;

  @override
  void initState() {
    super.initState();
    final _authService = ref.read(fireAuthServiceProvider);
    _appRouter = AppRouter(
      authGuard: AuthGuard(_authService),
      loginGuard: LoginGuard(_authService),
    );
  }

  @override
  Widget build(BuildContext context) {
    final _appTheme = ref.watch(settingsControllerProvider);

    ref.watch(authUserNotifierProvider.notifier).addListener((state) {
      state.maybeWhen(
        orElse: () {},
        authenticated: () async {
          if (_appRouter.current.name == const MainRoute().routeName) return;
          if (_appRouter.current.name == 'Root') return;
          if (_appRouter.current.name != const LoginRoute().routeName) return;
          await _appRouter.pushAndPopUntil(
            const MainRoute(),
            predicate: (route) => false,
          );
        },
        unauthenticated: () async {
          if (_appRouter.current.name == const LoginRoute().routeName) return;
          if (_appRouter.current.name == 'Root') return;
          await _appRouter.pushAndPopUntil(
            const LoginRoute(),
            predicate: (route) => false,
          );
        },
        initial: () async {
          ref
              .watch(authUserNotifierProvider.notifier)
              .checkAndUpdateAuthStatus();
        },
      );
    });

    const appScheme = FlexScheme.bigStone;
    return MaterialApp.router(
      title: 'university_chat_app',
      restorationScopeId: 'app',
      debugShowCheckedModeBanner: false,
      // theme: ThemeConfig.light,
      // darkTheme: ThemeConfig.dark,
      theme: FlexThemeData.light(
        scheme: appScheme,
        surfaceMode: FlexSurfaceMode.level,
        blendLevel: 25,
        appBarStyle: FlexAppBarStyle.primary,
        appBarOpacity: 0.94,
        appBarElevation: 0,
        // transparentStatusBar: false,
        tabBarStyle: FlexTabBarStyle.forBackground,
        tooltipsMatchBackground: true,
        swapColors: false,
        lightIsWhite: true,
        useSubThemes: true,
        visualDensity: FlexColorScheme.comfortablePlatformDensity,
        subThemesData: const FlexSubThemesData(
          useTextTheme: true,
          fabUseShape: true,
          interactionEffects: true,
          bottomNavigationBarOpacity: 1,
          bottomNavigationBarElevation: 0,
          inputDecoratorIsFilled: true,
          inputDecoratorBorderType: FlexInputBorderType.outline,
          inputDecoratorUnfocusedHasBorder: true,
          blendOnColors: true,
          blendTextTheme: true,
          popupMenuOpacity: 0.95,
          cardElevation: 10,
        ),
      ),
      darkTheme: FlexThemeData.dark(
        // scaffoldBackground: Color.fromRGBO(32, 35, 42, 1),
        // appBarBackground: Color.fromRGBO(32, 35, 42, 1),
        scheme: appScheme,
        surfaceMode: FlexSurfaceMode.level,
        blendLevel: 40,
        appBarStyle: FlexAppBarStyle.background,
        appBarOpacity: 0.94,
        appBarElevation: 0,
        transparentStatusBar: false,
        tabBarStyle: FlexTabBarStyle.forAppBar,
        tooltipsMatchBackground: true,
        swapColors: false,
        darkIsTrueBlack: false,
        useSubThemes: true,
        visualDensity: FlexColorScheme.comfortablePlatformDensity,
        // To use this font, add GoogleFonts package and uncomment:
        // fontFamily: GoogleFonts.notoSans().fontFamily,
        subThemesData: const FlexSubThemesData(
          useTextTheme: true,
          fabUseShape: true,
          interactionEffects: true,
          bottomNavigationBarOpacity: 1,
          bottomNavigationBarElevation: 0,
          // inputDecoratorIsFilled: true,
          inputDecoratorBorderType: FlexInputBorderType.outline,
          inputDecoratorUnfocusedHasBorder: true,
          blendOnColors: true,
          blendTextTheme: true,
          popupMenuOpacity: 0.95,
          cardElevation: 1,
        ),
      ),
      themeMode: _appTheme,
      routeInformationParser: _appRouter.defaultRouteParser(),
      routerDelegate: AutoRouterDelegate(
        _appRouter,
        navigatorObservers: () => [MyObserver()],
      ),
    );
  }
}
