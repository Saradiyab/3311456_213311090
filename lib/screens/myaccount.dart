import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class MyAccount extends StatefulWidget {
  @override
  _MyAccountState createState() => _MyAccountState();
}

class _MyAccountState extends State<MyAccount> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _ageController = TextEditingController();
  final TextEditingController _nationalityController = TextEditingController();

  CollectionReference _usersCollection = FirebaseFirestore.instance.collection('users');

  void _addUser() async {
    String name = _nameController.text;
    int age = int.parse(_ageController.text);
    String nationality = _nationalityController.text;

    await _usersCollection.add({
      'name': name,
      'age': age,
      'nationality': nationality,
    });

    _nameController.clear();
    _ageController.clear();
    _nationalityController.clear();

    setState(() {
      // Refresh the UI to display the added user
    });
  }

  void _deleteUser(String documentId) async {
    await _usersCollection.doc(documentId).delete();

    setState(() {
      // Refresh the UI to remove the deleted user
    });
  }

  void _updateUser(String documentId) async {
    String name = _nameController.text;
    int age = int.parse(_ageController.text);
    String nationality = _nationalityController.text;

    await _usersCollection.doc(documentId).update({
      'name': name,
      'age': age,
      'nationality': nationality,
    });

    _nameController.clear();
    _ageController.clear();
    _nationalityController.clear();

    setState(() {
      // Refresh the UI to display the updated user
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 45, 104, 153),
      body:SingleChildScrollView(
        child:Padding(
         padding: EdgeInsets.symmetric(horizontal: 20,vertical: 20),
        child:Column(
           crossAxisAlignment: CrossAxisAlignment.start,
          children: [
             Align(
                alignment: Alignment.topLeft,
                child: IconButton(
                  icon: Icon(
                    Icons.arrow_back_ios_new,
                    color: Colors.white.withOpacity(0.5),
                    size: 30,
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              ),
           SizedBox(height: 30),
       
            TextField(
              controller: _nameController,
              decoration: InputDecoration(
                labelText: 'Name',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 16.0),
            TextField(
              controller: _ageController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Age',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 16.0),
            TextField(
              controller: _nationalityController,
              decoration: InputDecoration(
                labelText: 'Nationality',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 16.0),

        Center(
  child: ElevatedButton(
    style: ButtonStyle(
      backgroundColor: MaterialStateProperty.all(
        Color.fromARGB(255, 225, 164, 73),
      ),
    ),
    onPressed: _addUser,
    child: Text('Add User'),
  ),
),
SizedBox(height: 16.0),

StreamBuilder<QuerySnapshot>(
  stream: _usersCollection.snapshots(),
  builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
    if (snapshot.hasData) {
      return Column(
        children: snapshot.data!.docs.map((doc) {
          Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
          String documentId = doc.id;
          return ListTile(
            title: Text('Name: ${data['name']}'),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Age: ${data['age']}'),
                Text('Nationality: ${data['nationality']}'),
              ],
            ),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(
                  icon: Icon(Icons.edit),
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          backgroundColor: Color.fromARGB(255, 45, 104, 153),
                          title: Text('User Modification'),
                          content: SingleChildScrollView(
                            child: Padding(
                              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  TextField(
                                    controller: _nameController,
                                    decoration: InputDecoration(
                                      labelText: 'Name',
                                      border: OutlineInputBorder(),
                                    ),
                                  ),
                                  SizedBox(height: 16.0),
                                  TextField(
                                    controller: _ageController,
                                    keyboardType: TextInputType.number,
                                    decoration: InputDecoration(
                                      labelText: 'Age',
                                      border: OutlineInputBorder(),
                                    ),
                                  ),
                                  SizedBox(height: 16.0),
                                  TextField(
                                    controller: _nationalityController,
                                    decoration: InputDecoration(
                                      labelText: 'Nationality',
                                      border: OutlineInputBorder(),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          actions: [
                            ElevatedButton(
                              style: ButtonStyle(
                                backgroundColor: MaterialStateProperty.all(
                                  Color.fromARGB(255, 225, 164, 73),
                                ),
                              ),
                              onPressed: () {
                                _updateUser(documentId);
                                Navigator.pop(context);
                              },
                              child: Text('Update'),
                            ),
                            TextButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: Text(
                                'Cancel',
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          ],
                        );
                      },
                    );
                  },
                ),
                IconButton(
                  icon: Icon(Icons.delete),
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          backgroundColor: Color.fromARGB(255, 45, 104, 153),
                          title: Text('Delete User'),
                          content: Text(
                            'Are you sure you want to delete the user?',
                          ),
                          
                          actions: [
                             ElevatedButton(
                             style: ButtonStyle(
                               backgroundColor:  MaterialStateProperty.all(
                               Color.fromARGB(255, 225, 164, 73),
                                      ),
                                        ),
                                        onPressed: () {
                                           _deleteUser(documentId);
                                             Navigator.pop(context);
                                            },
                                            child: Text('Delete'),
                                          ),
                                          TextButton(
                                            onPressed: () {
                                              Navigator.pop(context);
                                            },
                                            child: Text('Cancel', style:
                                             TextStyle(
                                              color: Colors.white),
                                              ),
                                          ),
                                        ],
                                      );
                                    },
                                  );
                                },
                              ),
                            ],
                          ),
                        );
                      }).toList(),
                    );
                  } else if (snapshot.hasError) {
                    return Text('Error: ${snapshot.error}');
                  } else {
                    return CircularProgressIndicator();
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

