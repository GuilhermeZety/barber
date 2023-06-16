// ignore_for_file: unnecessary_getters_setters

class CurrentSession {
  //SingleTon
  CurrentSession._();
  static final CurrentSession _instance = CurrentSession._();
  factory CurrentSession() => CurrentSession._instance;
  //

  // UserEntity? get user => _user;
  // UserEntity? _user;

  // String? get token => _token;
  // String? _token;
}
