import 'package:barber/core/common/constants/app_routes.dart';
import 'package:barber/modules/auth/auth_module.dart';
import 'package:barber/modules/home_user/home_user_module.dart';
import 'package:barber/modules/splash/home/presenter/splash_page.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AppModule extends Module {
  @override
  List<ModularRoute> get routes => [
        // ChildRoute(
        //   AppRoutes.notConnection,
        //   child: (context, args) => NotConnectionPage(),
        //   transition: TransitionType.fadeIn,
        //   duration: 500.ms,
        // ),
        ChildRoute(
          AppRoutes.splash,
          child: (context, args) => SplashPage(),
          transition: TransitionType.fadeIn,
          duration: 500.ms,
        ),
        ModuleRoute(
          AppRoutes.auth,
          module: AuthModule(),
          transition: TransitionType.fadeIn,
          duration: 500.ms,
        ),
        ModuleRoute(
          AppRoutes.homeUser,
          module: HomeUserModule(),
          transition: TransitionType.fadeIn,
          duration: 500.ms,
        )
        // ChildRoute(
        //   AppRoutes.auth,
        //   child: (context, args) => AuthPage(),
        //   transition: TransitionType.fadeIn,
        //   duration: 500.ms,
        // ),
        // WildcardRoute(child: (context, args) => NotFoundPage()),
      ];

  @override
  List<Bind<Object>> get binds => [];
}
