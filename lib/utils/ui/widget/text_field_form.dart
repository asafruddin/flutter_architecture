import 'package:flutter/material.dart';

class TextFieldForm extends StatelessWidget {
  const TextFieldForm(
      {Key? key,
      this.controller,
      this.hintText,
      this.margin = const EdgeInsets.symmetric(horizontal: 16)})
      : super(key: key);

  final TextEditingController? controller;
  final String? hintText;
  final EdgeInsets margin;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: margin,
      child: TextField(
        controller: controller,
        decoration: InputDecoration(hintText: hintText),
      ),
    );
  }
}
