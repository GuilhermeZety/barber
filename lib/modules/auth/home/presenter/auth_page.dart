import 'dart:developer';

import 'package:barber/core/common/constants/app_assets.dart';
import 'package:barber/core/common/extensions/context_extension.dart';
import 'package:barber/core/common/extensions/responsive_extension.dart';
import 'package:barber/core/common/extensions/widget_extension.dart';
import 'package:barber/modules/auth/home/cubit/auth_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({super.key});

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  final AuthCubit _cubit = AuthCubit();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<AuthCubit, AuthState>(
        bloc: _cubit,
        builder: (context, state) {
          return LayoutBuilder(
            builder: (context, constraints) {
              log(constraints.toString());
              log(constraints.layout.name);
              if (constraints.isDesktop) {
                return Row(
                  children: [
                    Container().expanded(),
                    Stack(
                      children: [
                        Image.asset(
                          AppAssets.barber,
                          fit: BoxFit.cover,
                          height: context.heightPx,
                        ),
                        Positioned.fill(
                          child: Container(
                            color: Colors.black45,
                          ),
                        )
                      ],
                    ).expanded(),
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
}
