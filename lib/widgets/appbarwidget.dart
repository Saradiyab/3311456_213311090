import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AppBarWidget extends StatelessWidget {
  const AppBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: 10,
        horizontal: 10,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
            onLongPress: (){
              Scaffold.of(context).openDrawer();
            },
            child: Container(
              padding: EdgeInsets.all(5),
              decoration: BoxDecoration(
                borderRadius:BorderRadius.circular(20),
              ),
              child: Icon(CupertinoIcons.bars,
              size:30,
               color:Color.fromARGB(255, 50, 54, 56),
               ),
            ),
          ),

          InkWell(
            onTap: (){
               Navigator.pushNamed(context, "notifications");
            },
            child: Container(
              padding: EdgeInsets.all(5),
              decoration: BoxDecoration(
                borderRadius:BorderRadius.circular(20),
              ),
              child: Icon(Icons.notifications,
              size:30,
               color:Color.fromARGB(255, 50, 54, 56),
               ),
            ),
          ),

        ],
      ),

    );
  }
}