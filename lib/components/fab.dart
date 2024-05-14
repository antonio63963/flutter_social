import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Fab extends StatelessWidget {
  final Function()? onFab;
  final IconData icon;
  const Fab({super.key, this.onFab, required this.icon,});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: onFab,
      shape: const CircleBorder(),
      child: Icon(
        icon,
      ),
    );
  }
}
