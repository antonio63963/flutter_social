class Validators {
  static RegExp emailRegExp = RegExp(r'/^((([0-9A-Za-z]{1}[-0-9A-z\.]{1,}[0-9A-Za-z]{1})|([0-9А-Яа-я]{1}[-0-9А-я\.]{1,}[0-9А-Яа-я]{1}))@([-A-Za-z]{1,}\.){1,2}[-A-Za-z]{2,})$/u');
  // static RegExp emailRegExp = RegExp(r'^[\w-\.]+@([\w-]+.)+[\w-]{2,4}$');
  // 8 char, one uppercase, num, and one special character
  static RegExp passwordRexExp = RegExp(
      r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~`)\%\-(_+=;:,.<>/?"[{\]}\|^]).{8,}$');
  // is existing special char
  static RegExp specialCharRexExp =
      RegExp(r'^(?=.*?[!@#$&*~`)\%\-(_+=;:,.<>/?"[{\]}\|^])');

  static String? email(val) {
    if (val!.isEmpty) {
      return 'Please fill in this field';
    } else if (emailRegExp.hasMatch(val)) {
      return 'Please enter a valid email';
    }
    return null;
  }

  static String? password(val) {
    if (val!.isEmpty) {
      return 'Please fill in this field';
    } else if (val.length < 6) {
      return 'Please enter a valid password min 6 symbols';
    }
    return null;
  }

  static String? name(val) {
    if (val!.isEmpty) {
      return 'Please fill in this field';
    } else if (val.length > 30) {
      return 'Name too long';
    }
    return null;
  }
}
