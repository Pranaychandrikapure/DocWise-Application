// import 'dart:html';
import 'dart:ui';
import 'package:flutter/animation.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:docwise/components/bottom_navigation_item.dart';
import 'package:docwise/config/app_icons.dart';
import 'package:docwise/pages/home_page.dart';
import 'package:docwise/pages/profile_page.dart';

class MainPage extends StatefulWidget {  
  const MainPage ({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  Menus currentIndex = Menus.home;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: page[currentIndex.index],
    bottomNavigationBar:MyBottomNavigation(currentIndex: currentIndex,onTap: (value){
      setState(() {
        currentIndex = value;
      });
    }, ) //
    );
  }
  final page = [
    HomePage(),
    Center(child: Text('Favorite'),),
    Center(child: Text('Add Post'),),
    ProfilePage(),
    Center(child: Text('User'),),
    

  ];
}

enum Menus{
  home,
  favorite,
  add,
  user,
  messages,
}
class MyBottomNavigation extends StatelessWidget {
  final Menus currentIndex;
  final ValueChanged<Menus> onTap;
  const MyBottomNavigation({super.key, required this.currentIndex, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 87,
      margin: EdgeInsets.all(24),
      child: Stack(
        children: [
         Positioned(
          right: 0,left: 0,top: 17,
           child: Container(
            height: 70,
            decoration: BoxDecoration(
              color: Color.fromARGB(255, 236, 238, 250),
              borderRadius: BorderRadius.all(Radius.circular(25),),
              border: Border.all(color: Color.fromARGB(255, 178, 177, 178),width: 2,strokeAlign: BorderSide.strokeAlignInside,style: BorderStyle.solid)
            ),
          child: Row(children: [
            Expanded(child: BottomNavigationItem(onPressed: () => onTap(Menus.home), icon: AppIcon.icHome, current: currentIndex, name: Menus.home)),
            Expanded(child: BottomNavigationItem(onPressed: () =>onTap(Menus.favorite), icon: AppIcon.icFavorite, current: currentIndex, name: Menus.favorite)),
            Expanded(child: BottomNavigationItem(onPressed: ()=>onTap(Menus.messages), icon: AppIcon.icComment, current: currentIndex, name: Menus.messages)),
            Expanded(child: BottomNavigationItem(onPressed: ()=>onTap(Menus.user), icon: AppIcon.icPerson, current: currentIndex, name: Menus.user))
          ],),
           ),
         ) ,
         
        ],
      ),
    );
  }
}

  