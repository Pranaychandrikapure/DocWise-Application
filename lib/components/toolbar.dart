import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:docwise/styles/app_colors.dart';
import 'package:docwise/styles/app_text.dart';

class Toolbar extends StatelessWidget implements PreferredSizeWidget { 
  final String title; 
  final List<Widget> actions;
  const Toolbar ({super.key, required this.title,required this.actions});
  @override
  Widget build(BuildContext context) {
   return AppBar(
      backgroundColor: AppColors.background,
      foregroundColor: AppColors.white,
      title: Text(title,style: AppText.header1,),
      actions: actions,
    );
  }
  @override
  Size get preferredSize => const Size.fromHeight(60);
}
