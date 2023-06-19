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
  Color forgotPasswordColor = AppColors.grey;
  bool signup = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<AuthCubit, AuthState>(
        bloc: _cubit,
        builder: (context, state) {
          return SafeArea(
            child: LayoutBuilder(
              builder: (context, constraints) {
                return Stack(
                  children: [
                    if (constraints.layout == LayoutTypes.desktop)
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
                                      duration:
                                          const Duration(milliseconds: 300),
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
                                      duration:
                                          const Duration(milliseconds: 300),
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
                    LayoutBuilder(
                      builder: (context, constraints) {
                        return AnimatedContainer(
                          duration: 300.ms,
                          curve: Curves.easeInOutCubicEmphasized,
                          margin: EdgeInsets.only(
                            left: constraints.layout == LayoutTypes.desktop
                                ? signup
                                    ? context.widthPx * 0.5
                                    : 0
                                : 0,
                          ),
                          child: Container(
                            width: context.widthPct(
                              constraints.layout == LayoutTypes.desktop
                                  ? 0.5
                                  : 1,
                            ),
                            height: context.heightPx,
                            decoration: BoxDecoration(
                              color: AppColors.background,
                            ),
                            child: content,
                          ),
                        );
                      },
                    ),
                  ],
                );
              },
            ),
          );
        },
      ),
    );
  }

  Widget get content => Center(
        child: Container(
          constraints: BoxConstraints(
            maxWidth: 340,
          ),
          padding: EdgeInsets.all(20),
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Flexible(
                  child: SvgPicture.asset(
                    AppAssets.logo,
                    width: 200,
                    height: 130,
                  ).hero('logo'),
                ),
                Gap(80),
                AnimatedSize(
                  duration: 300.ms,
                  alignment: Alignment.topCenter,
                  child: Form(
                    child: signup ? register : login,
                  )
                      .animate()
                      .fade(begin: 0.0, end: 1, duration: 300.ms)
                      .slideY(begin: 0.05, end: 0, duration: 300.ms),
                )
              ],
            ),
          ),
        ),
      );
  Widget get login => Column(
        children: [
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
            _cubit.loginEmail,
            label: Text('Email'),
            hint: 'Insira seu email',
            prefixIcon: Icon(Icons.mail_outline),
          ),
          Gap(8),
          Input(
            _cubit.loginPassword,
            label: Text('Senha'),
            hint: 'Insira sua senha',
            prefixIcon: Icon(Icons.lock_outline_rounded),
          ),
          Gap(24),
          Button(
            onPressed: () async => _cubit.login(),
            child: Text(
              'Entrar',
              style: TextStyle(fontSize: 16),
            ),
          ).expandedH(),
          Gap(24),
          Builder(
            builder: (context) {
              return MouseRegion(
                cursor: SystemMouseCursors.click,
                onEnter: (event) {
                  forgotPasswordColor = AppColors.primary;
                  if (mounted) setState(() {});
                },
                onExit: (event) {
                  forgotPasswordColor = AppColors.grey;
                  if (mounted) setState(() {});
                },
                child: GestureDetector(
                  onTap: () {},
                  child: Container(
                    color: Colors.transparent,
                    padding: EdgeInsets.all(8),
                    child: Text(
                      'Esqueci minha senha',
                      style: TextStyle(color: forgotPasswordColor),
                    ),
                  ),
                ),
              );
            },
          ),
          Gap(80),
          MouseRegion(
            cursor: SystemMouseCursors.click,
            child: GestureDetector(
              onTap: () {
                signup = !signup;
                if (mounted) setState(() {});
              },
              child: Container(
                color: Colors.transparent,
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: const [
                    Icon(Icons.login, color: AppColors.primary),
                    Gap(8),
                    Text(
                      'Criar conta',
                      style: TextStyle(
                        fontSize: 16,
                        color: AppColors.primary,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ).animate().fade(duration: 702.ms, begin: 0.2, end: 1);

  Widget get register => Column(
        children: [
          Text(
            'Insira seus Dados',
            style: TextStyle(
              color: AppColors.white,
              fontSize: 24,
              fontWeight: FontWeight.w500,
            ),
          ),
          Gap(24),
          Input(
            _cubit.signupName,
            label: Text('Nome'),
            hint: 'Insira seu nome completo',
            prefixIcon: Icon(Icons.person_outline),
          ),
          Gap(8),
          Input(
            _cubit.signupEmail,
            label: Text('Email'),
            hint: 'Insira seu email',
            prefixIcon: Icon(Icons.mail_outline),
          ),
          Gap(8),
          Input(
            _cubit.signupPassword,
            label: Text('Senha'),
            hint: 'Insira sua senha',
            prefixIcon: Icon(Icons.lock_outline_rounded),
          ),
          Gap(24),
          Button(
            onPressed: () async => _cubit.login(),
            child: Text(
              'Cadastrar',
              style: TextStyle(fontSize: 16),
            ),
          ).expandedH(),
          Gap(80),
          MouseRegion(
            cursor: SystemMouseCursors.click,
            child: GestureDetector(
              onTap: () {
                signup = !signup;
                if (mounted) setState(() {});
              },
              child: Container(
                color: Colors.transparent,
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: const [
                    Icon(Icons.arrow_back, color: AppColors.white),
                    Gap(8),
                    Text(
                      'Voltar para o login',
                      style: TextStyle(
                        fontSize: 16,
                        color: AppColors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ).animate().fade(duration: 700.ms, begin: 0.2, end: 1);
}
