import 'package:barber/core/common/constants/app_colors.dart';
import 'package:barber/modules/home_user/home/cubit/auth_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeUserPage extends StatefulWidget {
  const HomeUserPage({super.key});

  @override
  State<HomeUserPage> createState() => _HomeUserPageState();
}

class _HomeUserPageState extends State<HomeUserPage> {
  final HomeUserCubit _cubit = HomeUserCubit();
  Color forgotPasswordColor = AppColors.grey;
  bool signup = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<HomeUserCubit, HomeUserState>(
        bloc: _cubit,
        builder: (context, state) {
          return Center(
            child: Text('home_user'),
          );
        },
      ),
    );
  }
}
