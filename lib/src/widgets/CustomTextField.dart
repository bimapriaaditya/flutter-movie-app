import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final String hintText;
  final ValueChanged<String> onChanged;

  const CustomTextField({
    Key? key,
    required this.hintText,
    required this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: onChanged,
      decoration: InputDecoration(
        hintText: hintText,
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.blue),
        ),
        contentPadding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(8)),
        ),
      ),
    );
  }
}