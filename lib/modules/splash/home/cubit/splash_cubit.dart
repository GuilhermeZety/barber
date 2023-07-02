import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';

part 'splash_state.dart';

class SplashCubit extends Cubit<SplashState> {
  SplashCubit() : super(SplashInitial());
  Future init() async {
    if (FirebaseAuth.instance.currentUser == null) {
      emit(SplashNotLogged());
    } else {
      emit(SplashLogged());
    }
  }
}
