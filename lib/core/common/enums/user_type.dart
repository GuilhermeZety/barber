enum UserType {
  admin,
  user,
  barber;

  String get name {
    switch (this) {
      case UserType.admin:
        return 'admin';
      case UserType.user:
        return 'user';
      case UserType.barber:
        return 'barber';
      default:
        return 'user';
    }
  }

  factory UserType.fromName(String name) {
    switch (name) {
      case 'admin':
        return UserType.admin;
      case 'user':
        return UserType.user;
      case 'barber':
        return UserType.barber;
      default:
        return UserType.user;
    }
  }
  factory UserType.fromInt(int id) {
    switch (id) {
      case 0:
        return UserType.admin;
      case 1:
        return UserType.user;
      case 2:
        return UserType.barber;
      default:
        return UserType.user;
    }
  }
}
