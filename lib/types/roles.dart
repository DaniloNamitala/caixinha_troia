enum Roles {
  user,
  admin,
  god;

  static fromInt(int value) {
    switch (value) {
      case 0:
        return user;
      case 1:
        return admin;
      case 2:
        return god;
    }
  }

  int toInt() {
    switch (this) {
      case user:
        return 0;
      case admin:
        return 1;
      case god:
        return 2;
    }
  }
}
