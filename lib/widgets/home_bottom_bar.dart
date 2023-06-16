import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeBottomBar extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return Container(
      height: 70,
      decoration: BoxDecoration(
        color:  Color(0XFF212325),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          InkWell(
            onTap: (){
              Navigator.pushNamed(context, "homepage");
            },
            child:Icon(
              Icons.home,
              color: Colors.white,
              size: 35,
              ) ,
          ),

          InkWell(
            onTap: (){
              Navigator.pushNamed(context, "orders");
            },
            child:Icon(
                CupertinoIcons.cart_fill,
               color: Colors.white,
              size: 35,
              ) ,
          ),

          InkWell(
            onTap: (){
              Navigator.pushNamed(context, "notifications");
            },
            child:Icon(
              Icons.notifications,
              color: Colors.white,
              size: 35,
              ) ,
          ),

          InkWell(
            onTap: (){
              Navigator.pushNamed(context, "myaccount");
            },
            child:Icon(
              Icons.person,
              color: Colors.white,
              size: 35,
              ) ,
          ),
          
        ],),
    );
  }
}
















      
        




    /*  padding: EdgeInsets.symmetric(horizontal: 15),
      height: 80,
      decoration: BoxDecoration(
        color: Color(0XFF212325),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.4),
            spreadRadius: 1,
            blurRadius: 8,

          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Icon(Icons.home,
          color: Color(0xFFE57734),
           size: 35,
          ),
      Icon(Icons.favorite_outline,
           color: Colors.white,
           size: 35,
          ),
          Icon(Icons.notifications,
           color: Colors.white,
           size: 35,
          ),
          Icon(Icons.person,
           color: Colors.white,
           size: 35,
          ),
        ],
      );
    );
  }
}*/