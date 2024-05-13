import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Fab extends StatelessWidget {
  final Function() onFab;
  const Fab({super.key, required this.onFab});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: onFab,
      shape: const CircleBorder(),
      child: const Icon(
        CupertinoIcons.add,
      ),
    );
  }
}
