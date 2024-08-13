import 'package:flutter/material.dart';
import 'package:docwise/styles/app_colors.dart';

class AppTextFeild extends StatelessWidget {
  final String hint;
  const AppTextFeild({super.key, required this.hint});

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        hintText: hint,
        labelText: hint,
        labelStyle:const TextStyle(
          color: Colors.white
        ),
        border: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(20))),
            focusedBorder: const UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.transparent,),
              borderRadius: BorderRadius.all(Radius.circular(20))
            ),
        filled: true,
        fillColor: AppColors.feildcolor,
      ),
    );
  }
}
