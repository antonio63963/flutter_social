import 'package:social/utils/constants.dart';

class Validators {
  static String? email(val) {
    if (val!.isEmpty) {
      return 'Please fill in this field';
    } else if (!Utils.emailRegExp.hasMatch(val)) {
      return 'Please enter a valid email';
    }
    return null;
  }
}
