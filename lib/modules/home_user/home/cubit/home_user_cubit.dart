import 'dart:developer';

import 'package:barber/core/common/enums/user_type.dart';
import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';

part 'home_user_state.dart';

class HomeUserCubit extends Cubit<HomeUserState> {
  HomeUserCubit() : super(HomeUserInitial());

  UserType userType = UserType.user;

  CollectionReference users = FirebaseFirestore.instance.collection('users');
  Future init() async {
    try {
      var resp = await users.get();
      var data = resp.docs.first.data() as Map<String, dynamic>;
      userType = UserType.fromInt(data['type']);
    } catch (err) {
      log('err: $err');
    }
    emit(HomeUserInitial());
  }
}
