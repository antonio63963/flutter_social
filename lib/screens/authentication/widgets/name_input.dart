import 'package:flutter/cupertino.dart';
import 'package:social/components/my_text_field.dart';
import 'package:social/utils/validators.dart';

class NameInput extends StatelessWidget {
  final TextEditingController nameController;
  const NameInput({super.key, required this.nameController});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.9,
      child: MyTextField(
        controller: nameController,
        hintText: 'Name',
        obscureText: false,
        keyboardType: TextInputType.name,
        prefixIcon: const Icon(CupertinoIcons.person_fill),
        validator: Validators.name,
      ),
    );
  }
}
