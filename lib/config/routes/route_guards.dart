import 'package:auto_route/auto_route.dart';
import 'package:university_chat_app/utils/services/fire_auth_service.dart';

import 'app_router.gr.dart';

class AuthGuard extends AutoRouteGuard {
  AuthGuard(this.authService);

  final FireAuthService authService;
  @override
  void onNavigation(NavigationResolver resolver, StackRouter router) {
    // final context = router.navigatorKey.currentContext;
    if (authService.isEmailVerified) return resolver.next(true);
    if (router.current.path == '/login') return resolver.next(false);
    router
        .pushAndPopUntil(
          const LoginRoute(),
          predicate: (route) => false,
        )
        .then((_) => null);
  }
}

class LoginGuard extends AutoRouteGuard {
  LoginGuard(this.authService);

  final FireAuthService authService;
  @override
  void onNavigation(NavigationResolver resolver, StackRouter router) {
    if (authService.isEmailVerified) {
      return resolver.next(false);
    } else {
      return resolver.next(true);
    }
  }
}
