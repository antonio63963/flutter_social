import 'package:flutter/cupertino.dart';
import 'package:social/components/my_text_field.dart';
import 'package:social/utils/validators.dart';

class NameInput extends StatelessWidget {
  final TextEditingController nameController;
  final double paddingTop;
  final double paddingBottom;
  final double paddingLeft;
  final double paddingRight;
  const NameInput({
    super.key,
    required this.nameController,
    this.paddingTop = 0,
    this.paddingBottom = 0,
    this.paddingLeft = 0,
    this.paddingRight = 0,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        top: paddingTop,
        bottom: paddingBottom,
        left: paddingLeft,
        right: paddingRight,
      ),
      child: SizedBox(
        width: MediaQuery.of(context).size.width * 0.9,
        child: MyTextField(
          controller: nameController,
          hintText: 'Name',
          obscureText: false,
          keyboardType: TextInputType.name,
          prefixIcon: const Icon(CupertinoIcons.person_fill),
          validator: Validators.name,
        ),
      ),
    );
  }
}
