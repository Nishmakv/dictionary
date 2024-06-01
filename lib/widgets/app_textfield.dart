import 'package:flutter/material.dart';

class AppTextField extends StatelessWidget {
  final String hintText;
  final Widget? suffixIcon;
  final ValueChanged<String>? onChanged;

  const AppTextField({
    super.key,
    required this.hintText,
    this.suffixIcon,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Color(0xfff4f4f4),
      ),
      child: TextFormField(
        onChanged: onChanged,
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.all(10),
          suffixIcon: suffixIcon,
          hintText: 'Search here',
          hintStyle: TextStyle(
            fontSize: 15,
          ),
          border: InputBorder.none, 
        ),
      ),
    );
  }
}
