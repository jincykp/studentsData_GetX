import 'package:flutter/material.dart';

class TextFormFields extends StatelessWidget {
  TextEditingController controller;
  String? hintText;
  String? Function(String?)? validator;
  TextFormFields(
      {super.key,
      required this.controller,
      this.validator,
      required this.hintText});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      autovalidateMode: AutovalidateMode.onUserInteraction,
      controller: controller,
      decoration: InputDecoration(
          enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.black),
          ),
          border: const OutlineInputBorder(),
          filled: false,
          hintText: hintText),
      validator: validator,
    );
  }
}
