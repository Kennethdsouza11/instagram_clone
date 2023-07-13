import 'package:flutter/material.dart';

class TextFieldInput extends StatelessWidget {
  final TextEditingController textEditingController;
  final bool
      isPass; // this is to check if the value that we are going to pass is password or not so that we can hide the obscure text.
  final String hintText;
  final TextInputType textInputType;
  const TextFieldInput({
    Key? key,
    required this.textEditingController,
    this.isPass = false,
    required this.hintText,
    required this.textInputType, required TextEditingController TextEditingController,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final inputBorder = OutlineInputBorder(
        borderSide: Divider.createBorderSide(
            context) // is used to create dividers. OutlineInputBorder is used to create a rounded rectangular outline border for an input decorator.
        );
    return TextField(
      controller: textEditingController,
      decoration: InputDecoration(
        hintText: hintText,
        border: inputBorder,
        focusedBorder: inputBorder,
        enabledBorder: inputBorder,
        filled: true,
        contentPadding: const EdgeInsets.all(
            8), //used for an offset from each of the four sides of a box.
      ),
      keyboardType: textInputType,
      obscureText: isPass,
    );
  }
}
