import 'package:barber/core/common/constants/app_assets.dart';
import 'package:barber/core/common/constants/app_colors.dart';
import 'package:barber/core/common/constants/app_routes.dart';
import 'package:barber/core/common/extensions/widget_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    Future.delayed(2.seconds, () {
      Modular.to.pushNamedAndRemoveUntil(AppRoutes.auth, (p0) => false);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          child: SvgPicture.asset(
            AppAssets.logo,
            width: 200,
          )
              .hero('logo')
              .animate(
                onComplete: (controller) => controller.repeat(reverse: true),
              )
              .shimmer(
                color: AppColors.primary.withOpacity(0.5),
                duration: 1.seconds,
                size: 0.5,
              )
              .scaleXY(begin: 0.95, end: 1, duration: 2.seconds),
        )
            .animate()
            .fade(duration: 1.seconds)
            .scaleXY(begin: 0.9, end: 1)
            .shake(rotation: 0.05, duration: 1.seconds, hz: 2),
      ),
    );
  }
}
