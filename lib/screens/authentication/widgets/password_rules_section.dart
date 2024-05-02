import 'package:flutter/material.dart';

class PasswordRulesSection extends StatelessWidget {
  final bool containsUpperCase;
  final bool containsLowerCase;
  final bool containsNumber;
  final bool containsSpecialChar;
  final bool contains8Length;

  const PasswordRulesSection({
    super.key,
    required this.containsUpperCase,
    required this.containsLowerCase,
    required this.containsNumber,
    required this.containsSpecialChar,
    required this.contains8Length,
  });
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        bottom: MediaQuery.of(context).size.height * 0.02,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "⚈ 1 uppercase",
                style: TextStyle(
                  color: containsUpperCase
                      ? Colors.green
                      : Theme.of(context).colorScheme.onBackground,
                ),
              ),
              Text(
                "⚈ 1 lowercase",
                style: TextStyle(
                  color: containsLowerCase
                      ? Colors.green
                      : Theme.of(context).colorScheme.onBackground,
                ),
              ),
              Text(
                "⚈ 1 number",
                style: TextStyle(
                  color: containsNumber
                      ? Colors.green
                      : Theme.of(context).colorScheme.onBackground,
                ),
              ),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "⚈ 1 special character",
                style: TextStyle(
                  color: containsSpecialChar
                      ? Colors.green
                      : Theme.of(context).colorScheme.onBackground,
                ),
              ),
              Text(
                "⚈ 8 minimum character",
                style: TextStyle(
                  color: contains8Length
                      ? Colors.green
                      : Theme.of(context).colorScheme.onBackground,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
