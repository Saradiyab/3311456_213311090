
import 'package:appfood/widgets/allwidget.dart';
import 'package:appfood/widgets/appbarwidget.dart';
import 'package:appfood/widgets/desertwidget.dart';
import 'package:appfood/widgets/drawerwidget.dart';
import 'package:appfood/widgets/home_bottom_bar.dart';
import 'package:appfood/widgets/burgerwidget.dart';
import 'package:appfood/widgets/icecreamwidget.dart';
import 'package:appfood/widgets/pastawidget.dart';
import 'package:appfood/widgets/pizzawidget.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});



  @override
  State<HomePage> createState() => _HomePageState();
}
class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
      
      final user = FirebaseAuth.instance.currentUser!;
  late TabController _tabController;

  @override
  void initState() {
    _tabController = TabController(length: 6, vsync: this, initialIndex: 0);
    _tabController.addListener(_handleTabSelection);
    super.initState();
  }
  _handleTabSelection(){
    if(_tabController.indexIsChanging){
      setState(() {});
    }
  }

  @override
  void dispose(){
    _tabController.dispose();
    super.dispose();

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 45, 104, 153),
      body: SafeArea(
        child: ListView(
          children: [
            AppBarWidget(),
            Padding(
             padding: EdgeInsets.symmetric(horizontal: 15),
           child: Text("Are You Hungry", 
             style: TextStyle(
              color: Color.fromARGB(255, 225, 164, 73),
              fontSize: 30,
              fontWeight: FontWeight.w500,
             ),
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 15, vertical: 20),
            width: MediaQuery.of(context).size.width,
            height: 60,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color:Color.fromARGB(255, 50, 54, 56),
              borderRadius: BorderRadius.circular(10),
            ),
            child: TextFormField(
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: "Find your food",
                hintStyle: TextStyle(
                  color: Color.fromARGB(255, 225, 164, 73),
                ),
                prefixIcon: Icon(Icons.search,size: 30,
                color: Colors.white.withOpacity(0.5),
                ),
              ),
        ),
       ),
       TabBar(
        controller: _tabController,
        labelColor: Color.fromARGB(255, 225, 164, 73),
        unselectedLabelColor: Colors.white.withOpacity(0.5),
        isScrollable: true,
        indicator: UnderlineTabIndicator(
          borderSide: BorderSide(
            width: 3,
            color: Color.fromARGB(255, 225, 164, 73),

          ),
          insets: EdgeInsets.symmetric(horizontal: 16),
        ),
        labelStyle: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
        labelPadding: EdgeInsets.symmetric(horizontal: 20),
        tabs: [
        Tab(text: "All"),
        Tab(text: "Burger"),
        Tab(text: "Pizaa"),
        Tab(text: "Desert"),
        Tab(text: "Ice Cream"),
        Tab(text: "Pasta"),
            
       ],
       ),
       SizedBox(height: 10),
       
       Center(
        child:[
        AllWidget(),
        BurgerWidget(),
        pizzawidget(),
        DesertWidget(),
       IcecreamWidget(),
       PastaWidget(),
        ][_tabController.index] ,
       ),
      ],
     ),
    ),
   bottomNavigationBar: HomeBottomBar(),
   drawer: DrawerWidget(),
  );
 } 
}