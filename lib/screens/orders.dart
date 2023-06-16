import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

class Orders extends StatefulWidget {
  const Orders({Key? key}) : super(key: key);

  @override
  State<Orders> createState() => _OrdersState();
}

class _OrdersState extends State<Orders> {
  late Box local;
  List<String> cartItems = [];

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
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 45, 104, 153),
      body: SafeArea(
        child: Stack(
          children: [
            ListView.builder(
              itemCount: local.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.only(top: 26),
                  child: Container(
                    margin: EdgeInsets.symmetric(vertical: 10, horizontal: 12),
                    height: 130,
                    decoration: BoxDecoration(
                      color: Color.fromARGB(255, 50, 54, 56),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Row(
                      children: [
                        Container(
                          width: 180,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            image: DecorationImage(
                              image: AssetImage("images/${local.getAt(index)}.jpg"),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        SizedBox(width: 10),
                        Expanded(
                          child: Padding(
                            padding: EdgeInsets.symmetric(vertical: 10),
                            child: Text(
                              '${local.getAt(index)}',
                              style: TextStyle(
                                fontSize: 20,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                        IconButton(
                          onPressed: () {
                            setState(() {
                              cartItems.add(local.getAt(index));
                              local.deleteAt(index); 
                            });
                          },
                          icon: Icon(
                            Icons.delete,
                            color: Color.fromARGB(255, 222, 171, 167),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
            Positioned(
              top: 8,
              left: 10,
              child: InkWell(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Icon(
                  Icons.arrow_back_ios_new,
                  color: Colors.white.withOpacity(0.5),
                  size: 30,
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: cartItems.isNotEmpty
          ? Container(
              color: Color.fromARGB(255, 50, 54, 56),
              padding: EdgeInsets.all(10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    style: ButtonStyle(
                     backgroundColor: MaterialStateProperty.all(
                            Color.fromARGB(255, 225, 164, 73),
                          ),
                    ),
                    onPressed: () {
                    
                      setState(() {
                        cartItems.clear();
                      });
                    },
                    child: Text('Checkout'),
                  ),
                ],
              ),
            )
          : null,
    );
  }
}
