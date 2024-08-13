import 'package:flutter/material.dart';
import 'package:docwise/styles/app_text.dart';

class PostItem extends StatelessWidget {  
  final String user;
  const PostItem ({super.key,required this.user});
  @override
  Widget build(BuildContext context) {

    return  Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        children: [
          Row(
                children: [
                  SizedBox(height: 40,),
                  Image.asset
                  ("assets/temp/User1.jpg",
                  width: 40,height: 40,),SizedBox(width: 10,),
                  Text(user,style: AppText.subtitle3,)
                ],
              ),SizedBox(height:40,),
              Image.asset('assets/temp/post1.jpg'),SizedBox(height: 12,),Text('A value proposition that shows your approach to work and what makes you different from everyone else',style: AppText.subtitle3,),SizedBox(height: 30,)
        ],
      ),
    );
  }
}
