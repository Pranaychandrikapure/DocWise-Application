import 'package:flutter/material.dart';

class UserAvtar extends StatelessWidget {
  final double size;
  const UserAvtar({super.key,this.size = 40});

  @override
  Widget build(BuildContext context) {
    return  ClipRRect(
          borderRadius: BorderRadius.all(Radius.circular(20)),
          child: Image.asset(
            'assets/temp/User1.jpg',
          width: 90,
          height: 90,
          ),
        );
  }
}