import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/services.dart';
import 'package:recipeapp/Views/SplashScreen.dart';
import 'package:recipeapp/service.dart';



class Account extends StatefulWidget {
  @override
  _AccountState createState() => _AccountState();
}

class _AccountState extends State<Account> {

  FirebaseAuth _auth = FirebaseAuth.instance;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.orange,
        title: Text(
          'My Account',
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
        ),
        iconTheme: IconThemeData(color: Colors.orange),
        automaticallyImplyLeading: false,
        centerTitle: true,
      ),
      body: StreamBuilder(
        stream: Database.getData(),
        builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else {
            var userData = snapshot.data!.docs.isNotEmpty
                ? (snapshot.data!.docs.first.data() as Map<String, dynamic>)
                : null;

            return Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: 30,),
                  CircleAvatar(
                    radius: 50,
                    backgroundImage: AssetImage("assets/images/profil2.png"),
                  ),
                  SizedBox(height: 16),
                  Text(
                    userData?['username'] ?? 'No Username',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    userData?['email'] ?? 'No Email',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.grey,
                    ),
                  ),
                  SizedBox(height: 16),
                  Divider(),
                  ListTile(
                    leading: Icon(Icons.location_on),
                    title: Text(userData?['alamat'] ?? 'No Address'),
                  ),
                  ListTile(
                    leading: Icon(Icons.phone),
                    title: Text(userData?['no_telp'] ?? 'No Phone'),
                  ),
                  ListTile(
                    leading: Icon(Icons.calendar_today),
                    title: Text('Joined on October 1, 2023'),
                  ),
                  InkWell(
                    onTap: () {
                      _auth.signOut();
                      Navigator.push(context, MaterialPageRoute(builder: (context) => const SplashScreen()));
                    },
                    child: ListTile(
                      leading: Icon(Icons.output_outlined),
                      title: Text('Logout'),
                    ),
                  ),
                  SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: () async {
                      if (snapshot.data!.docs.isNotEmpty) {
                        await Database.update(
                            snapshot.data!.docs.first, context);

                        // Show success dialog
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              title: Text('Success'),
                              content: Text('Data updated successfully!'),
                              actions: <Widget>[
                                TextButton(
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                  child: Text('OK'),
                                ),
                              ],
                            );
                          },
                        );
                      }
                    },
                    child: const Text('Edit'),
                  ),
                ],
              ),
            );
          }
        },
      ),
    );
  }
}
