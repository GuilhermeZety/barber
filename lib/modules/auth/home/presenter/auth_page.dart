import 'package:barber/core/common/constants/app_assets.dart';
import 'package:barber/core/common/constants/app_colors.dart';
import 'package:barber/core/common/enums/layout_types.dart';
import 'package:barber/core/common/extensions/context_extension.dart';
import 'package:barber/core/common/extensions/responsive_extension.dart';
import 'package:barber/core/common/extensions/widget_extension.dart';
import 'package:barber/modules/auth/home/cubit/auth_cubit.dart';
import 'package:barber/ui/components/button.dart';
import 'package:barber/ui/components/input.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({super.key});

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  final AuthCubit _cubit = AuthCubit();
  bool signup = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    // precacheImage(myImage.image, context);
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<AuthCubit, AuthState>(
        bloc: _cubit,
        builder: (context, state) {
          return LayoutBuilder(
            builder: (context, constraints) {
              if (constraints.layout == LayoutTypes.desktop) {
                return Stack(
                  children: [
                    Row(
                      children: [
                        SizedBox(
                          width: context.widthPct(0.5),
                          child: Stack(
                            children: [
                              Image.asset(
                                AppAssets.barberShop,
                                fit: BoxFit.cover,
                                width: context.widthPct(0.5),
                                height: context.heightPx,
                                frameBuilder: (
                                  context,
                                  child,
                                  frame,
                                  wasSynchronouslyLoaded,
                                ) {
                                  return AnimatedOpacity(
                                    opacity: frame == null ? 0 : 1,
                                    duration: const Duration(milliseconds: 300),
                                    child: child,
                                  );
                                },
                              ),
                              Positioned.fill(
                                child: Container(
                                  color: Colors.black45,
                                ),
                              )
                            ],
                          ),
                        ),
                        SizedBox(
                          width: context.widthPct(0.5),
                          child: Stack(
                            children: [
                              Image.asset(
                                AppAssets.barber,
                                fit: BoxFit.cover,
                                width: context.widthPct(0.5),
                                height: context.heightPx,
                                frameBuilder: (
                                  context,
                                  child,
                                  frame,
                                  wasSynchronouslyLoaded,
                                ) {
                                  return AnimatedOpacity(
                                    opacity: frame == null ? 0 : 1,
                                    duration: const Duration(milliseconds: 300),
                                    child: child,
                                  );
                                },
                              ),
                              Positioned.fill(
                                child: Container(
                                  color: Colors.black45,
                                ),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                    AnimatedContainer(
                      duration: 300.ms,
                      curve: Curves.easeInOutCubicEmphasized,
                      margin: EdgeInsets.only(
                        left: !signup ? 0 : context.widthPct(0.5),
                      ),
                      child: Container(
                        width: context.widthPct(0.5),
                        height: context.heightPx,
                        decoration: BoxDecoration(
                          color: AppColors.background,
                          boxShadow: const [
                            BoxShadow(
                              color: Colors.black,
                            ),
                            BoxShadow(
                              color: Colors.black,
                              spreadRadius: -12.0,
                              blurRadius: 12.0,
                            ),
                          ],
                        ),
                        child: content,
                      ),
                    ),
                  ],
                );
              }
              return Container();
            },
          );
        },
      ),
    );
  }

  Widget get content => Center(
        child: Container(
          constraints: BoxConstraints(
            maxWidth: 340,
            minHeight: 200,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SvgPicture.asset(AppAssets.logo).hero('logo'),
              Gap(80),
              Text(
                'Faça seu login',
                style: TextStyle(
                  color: AppColors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.w500,
                ),
              ),
              Gap(24),
              Input(
                TextEditingController(),
                label: Text('Email'),
                hint: 'Insira seu email',
                prefixIcon: Icon(Icons.mail_outline),
              ),
              Gap(8),
              Input(
                TextEditingController(),
                label: Text('Senha'),
                hint: 'Insira sua senha',
                prefixIcon: Icon(Icons.lock_outline_rounded),
              ),
              Gap(24),
              Button(
                onPressed: () async {},
                child: Text(
                  'Entrar',
                  style: TextStyle(fontSize: 16),
                ),
              ).expandedH(),
              Gap(24),
              Text('Esqueci minha senha'),
              Gap(80),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: const [
                  Icon(Icons.login, color: AppColors.primary),
                  Gap(8),
                  Text(
                    'Criar conta',
                    style: TextStyle(fontSize: 16, color: AppColors.primary),
                  ),
                ],
              ),
            ],
          ),
        ),
      );
}
