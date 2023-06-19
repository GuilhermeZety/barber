import 'package:barber/modules/home_user/home/presenter/home_user_page.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_modular/flutter_modular.dart';

class HomeUserModule extends Module {
  @override
  List<Bind> get binds => [];

  @override
  List<ModularRoute> get routes => [
        ChildRoute(
          '/',
          child: (context, args) => HomeUserPage(),
          transition: TransitionType.fadeIn,
          duration: 500.ms,
        ),
      ];
}
