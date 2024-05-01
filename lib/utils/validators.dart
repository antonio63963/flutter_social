class Validators {
  static RegExp emailRegExp = RegExp(r'^[\w-\.]+@([\w-]+.)+[\w-]{2,4}$');
  // 8 char, one uppercase, num, and one special character
  static RegExp passwordRexExp = RegExp(
      r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~`)\%\-(_+=;:,.<>/?"[{\]}\|^]).{8,}$');
  // is existing special char
  static RegExp specialCharRexExp = RegExp(r'^(?=.*?[!@#$&*~`)\%\-(_+=;:,.<>/?"[{\]}\|^])');

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
}
