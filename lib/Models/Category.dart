import 'package:flutter/material.dart';
import 'package:recipeapp/Views/CategoryPage.dart';

class Category extends StatelessWidget {
  final IconData iconName;
  final String categoryName;
  final Color iconColor;
  final List<int> categoryIndices; 

  Category({
    required this.iconName,
    required this.categoryName,
    required this.iconColor,
    required this.categoryIndices,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => CategoryPage(customDataIndices: categoryIndices),
          ),
        );
      },
      child: Container(
        margin: EdgeInsets.all(8.0),
        child: Column(
          children: [
            CircleAvatar(
              radius: 30.0,
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
