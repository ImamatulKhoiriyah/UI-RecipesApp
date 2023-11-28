import 'package:flutter/material.dart';

class Account extends StatelessWidget {
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
                iconTheme: IconThemeData(color: Colors.white),

      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 50,
              backgroundImage: NetworkImage(
                  "https://i.pinimg.com/564x/9c/c7/02/9cc7025c21fb8a5eac473469649daca3.jpg"),
            ),
            SizedBox(height: 16),
            Text(
              'Michiii',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8),
            Text(
              'heremichiii@gmail.com',
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey,
              ),
            ),
            SizedBox(height: 16),
            Divider(),
            ListTile(
              leading: Icon(Icons.location_on),
              title: Text('Malang, Indonesia'),
            ),
            ListTile(
              leading: Icon(Icons.phone),
              title: Text('+62 821 3972 0967'),
            ),
            ListTile(
              leading: Icon(Icons.calendar_today),
              title: Text('Joined on October 1, 2023'),
            ),
          ],
        ),
      ),
    );
  }
}
