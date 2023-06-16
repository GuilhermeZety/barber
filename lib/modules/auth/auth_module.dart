import 'package:barber/modules/auth/home/presenter/auth_page.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AuthModule extends Module {
  @override
  List<Bind> get binds => [];

  @override
  List<ModularRoute> get routes => [
        ChildRoute(
          '/',
          child: (context, args) => AuthPage(),
          transition: TransitionType.fadeIn,
          duration: 300.ms,
        ),
      ];
}
