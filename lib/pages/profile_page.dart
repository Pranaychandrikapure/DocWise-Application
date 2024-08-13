
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:docwise/components/toolbar.dart';
import 'package:docwise/components/user_avtar.dart';
import 'package:docwise/config/app_routes.dart';
import 'package:docwise/styles/app_text.dart';

enum ProfileMenu{
  edit,
  logout
}
// ignore: prefer_typing_uninitialized_variables
class ProfilePage extends StatelessWidget {
  const ProfilePage ({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Toolbar(title: "Profile", actions: [
        PopupMenuButton<ProfileMenu>(
          onSelected:(value) {
            switch(value){
              case ProfileMenu.edit:
              Navigator.of(context).pushNamed(AppRoutes.editProfile);
              break;
              case ProfileMenu.logout:
              print("LogOut code");
              break;

            }
          },
          icon: Icon(Icons.more_vert_rounded),
          itemBuilder: (context){
          return[
            PopupMenuItem(child:Text('Edit'),value: ProfileMenu.edit),
            PopupMenuItem(child: Text("Log Out"),value: ProfileMenu.logout)
          ];
        })
      ]),
      body: Column(children: [
        SizedBox(height: 25,),
        UserAvtar(size: 98,),
        SizedBox(height: 24,),
        Text("Royal Raju",style: AppText.header2,),SizedBox(height: 12,),
        const Text("Gorakhpur",
        style: AppText.subtitle3,),
        SizedBox(height: 24,),
        Row(
          mainAxisAlignment:MainAxisAlignment.spaceAround,
          children: [
            Column(
              children: [
                Text("472",style: AppText.header2,),
                Text("Followers")
              ],
            ),
            Column(
              children: [
                Text("119",style: AppText.header2,),
                Text("Post")
              ],
            ),
            Column(
              children: [
                Text("50",style: AppText.header2,),
                Text("Following")
              ],
            )
          ],
        ),
        Divider(thickness: 1,height: 24,),
      ],),
    );
  }

}