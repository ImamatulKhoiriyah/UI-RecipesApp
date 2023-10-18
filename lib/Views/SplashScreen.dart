import 'package:flutter/material.dart';
import 'package:recipeapp/Views/Login.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.orange,
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 300), 
              CircleAvatar(
                backgroundImage: AssetImage("assets/images/icon.png"),
                backgroundColor: Colors.orange,
                radius: 150,
              ),
              SizedBox(height: 220),
              Container(
                height: 50,
                width: 150,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(30),
                ),
                child: TextButton(
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (_) => LoginPage(onLoginSuccess: () {})),
                    );
                  },
                  child: Text(
                    'Get Started',
                    style: TextStyle(color: Colors.orange),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}


