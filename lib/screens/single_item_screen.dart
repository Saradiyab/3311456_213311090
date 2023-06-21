import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

class SingleItemScreen extends StatefulWidget {
  String img;
  SingleItemScreen(this.img);

  @override
  State<SingleItemScreen> createState() => _SingleItemScreenState();
}

class _SingleItemScreenState extends State<SingleItemScreen> {
  late Box local;

  @override
  void initState() {
    local = Hive.box('test');
    if (local.isNotEmpty) {
      print('===============${local.getAt(0)}');
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Color.fromARGB(255, 45, 104, 153),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 25),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onDoubleTap: () {
                        Navigator.pop(context);
                      },
                      child: Icon(
                        Icons.arrow_back_ios_new,
                        color: Colors.white.withOpacity(0.5),
                        size: 30,
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.pushNamed(context, "orders");
                      },
                      child: Icon(
                        CupertinoIcons.cart_fill,
                        color: Colors.white.withOpacity(0.5),
                        size: 30,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 50),
              Center(
                child: Image.asset(
                  "images/${widget.img}.jpg",
                  width: screenWidth / 1.2,
                ),
              ),
              SizedBox(height: 50),
              Padding(
                padding: EdgeInsets.only(left: 25, right: 40),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Best Food",
                      style: TextStyle(
                        color: Colors.white.withOpacity(0.4),
                        letterSpacing: 3,
                      ),
                    ),
                    SizedBox(height: 20),
                    Text(
                      widget.img,
                      style: TextStyle(
                        fontSize: 30,
                        letterSpacing: 1,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(height: 25),
                    Container(
                      width: screenWidth,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            padding: EdgeInsets.all(10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                IconButton(
                                  onPressed: () {},
                                  icon: Icon(Icons.add),
                                ),
                                Container(
                                  alignment: Alignment.topCenter,
                                  padding: EdgeInsets.only(bottom: 2),
                                  width: 50,
                                  decoration: BoxDecoration(
                                    border: Border.all(color: Colors.white),
                                  ),
                                  child: Text(
                                    "1",
                                    style: TextStyle(
                                      fontSize: 20,
                                      height: 1.1,
                                    ),
                                  ),
                                ),
                                IconButton(
                                  onPressed: () {},
                                  icon: Icon(Icons.remove),
                                ),
                              ],
                            ),
                          ),
                          Text(
                            "\$30.20",
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w500,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 20),
                    Row(
                      children: [
                        Text(
                          "Volume: ",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(width: 10),
                        Text(
                          "Mdium",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 30),
                    Container(
                      width: screenWidth,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: ElevatedButton.icon(
                              onPressed: () {
                                print('test test test');
                                local.put('${widget.img}', '${widget.img}');
                              },
                              style: ButtonStyle(
                                backgroundColor: MaterialStateProperty.all(
                                  Color.fromARGB(255, 225, 164, 73),
                                ),
                                padding: MaterialStateProperty.all(
                                  EdgeInsets.symmetric(vertical: 13, horizontal: 15),
                                ),
                                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                ),
                              ),
                              icon: Icon(CupertinoIcons.cart_badge_plus),
                              label: Text(
                                "Add To Cart",
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
