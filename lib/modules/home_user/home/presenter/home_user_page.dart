import 'package:barber/modules/home_user/home/cubit/home_user_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeUserPage extends StatefulWidget {
  const HomeUserPage({super.key});

  @override
  State<HomeUserPage> createState() => _HomeUserPageState();
}

class _HomeUserPageState extends State<HomeUserPage> {
  final HomeUserCubit _cubit = HomeUserCubit();

  bool signup = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<HomeUserCubit, HomeUserState>(
        bloc: _cubit,
        builder: (context, state) {
          return Center(
            child: Text(_cubit.userType.name),
          );
        },
      ),
    );
  }
}
