import 'package:flutter/material.dart';

class UserImagePicker extends StatelessWidget {
  const UserImagePicker({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
        CircleAvatar(
          radius: 40,
          backgroundColor: Colors.grey,
        )
      ],
    );
  }
}
