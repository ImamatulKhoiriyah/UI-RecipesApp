import 'package:flutter/material.dart';
import 'package:recipeapp/Views/CategoryList.dart'; 

class Category extends StatelessWidget {
  final IconData iconName;
  final String categoryName;
  final Color iconColor;

  Category({
    required this.iconName,
    required this.categoryName,
    required this.iconColor,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => FoodGridPage()),
        );
      },
      child: Container(
        margin: EdgeInsets.all(8.0),
        child: Column(
          children: [
            CircleAvatar(
              radius: 35.0,
              backgroundColor: Colors.orange,
              child: Icon(
                iconName,
                color: iconColor,
              ),
            ),
            SizedBox(height: 8.0),
            Text(categoryName),
          ],
        ),
      ),
    );
  }
}
