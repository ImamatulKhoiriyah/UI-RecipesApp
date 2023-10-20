import 'package:flutter/material.dart';
import 'package:recipeapp/Models/Category.dart';
import 'package:recipeapp/Models/Food.dart';
import 'package:recipeapp/Views/DetailPage.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    List<FoodItem> foods = FoodData.foods;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          "CookingTime",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold
          ),
        ),
        backgroundColor: Colors.red,
        iconTheme: IconThemeData(color: Colors.black),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 15.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Hello, Michiii!",
                      style: TextStyle(
                        fontSize: 17.0,
                      ),
                    ),
                    CircleAvatar(
                      radius: 30,
                      backgroundImage: NetworkImage(
                          "https://i.pinimg.com/564x/9c/c7/02/9cc7025c21fb8a5eac473469649daca3.jpg"),
                    ),
                  ],
                ),
                RichText(
                  text: TextSpan(
                    text: 'Make your own food, ',
                    style: TextStyle(
                      fontSize: 25.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                    children: <TextSpan>[
                      TextSpan(
                        text: '\nstay at ',
                        style: TextStyle(
                          fontSize: 25.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                      TextSpan(
                        text: 'home',
                        style: TextStyle(
                          fontSize: 25.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.orange,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 15.0),
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Search any recipe',
                filled: true,
                fillColor: Colors.white,
                contentPadding: EdgeInsets.symmetric(horizontal: 20.0),
                prefixIcon: Icon(Icons.search, color: Colors.black),
                suffixIcon: Icon(Icons.category_outlined, color: Colors.black),
                border: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.transparent),
                  borderRadius: BorderRadius.circular(25.0),
                ),
              ),
            ),
          ),
          Container(
            height: 130.0,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 7,
              itemBuilder: (context, index) {
                IconData currentIcon;
                String currentCategory;

                switch (index) {
                  case 0:
                    currentIcon = Icons.restaurant;
                    currentCategory = 'Main Course';
                    break;
                  case 1:
                    currentIcon = Icons.fastfood;
                    currentCategory = 'Appetizers';
                    break;
                  case 2:
                    currentIcon = Icons.local_dining;
                    currentCategory = 'Main Dish';
                    break;
                  case 3:
                    currentIcon = Icons.local_florist;
                    currentCategory = 'Side Dishes';
                    break;
                  case 4:
                    currentIcon = Icons.cake;
                    currentCategory = 'Desserts';
                    break;
                  case 5:
                    currentIcon = Icons.local_pizza;
                    currentCategory = 'Snacks';
                    break;
                  case 6:
                    currentIcon = Icons.local_cafe;
                    currentCategory = 'Beverages';
                    break;
                  default:
                    currentIcon = Icons.restaurant;
                    currentCategory = 'Other';
                }
                return Category(
                    categoryName: currentCategory,
                    iconName: currentIcon,
                    iconColor: Colors.white);
              },
            ),
          ),
          Container(
            padding: EdgeInsets.only(left: 15.0, bottom: 20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  "Popular Recipe",
                  style: TextStyle(
                    fontSize: 25.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                Container(
                  height: 318.0,
                  child: GridView.builder(
                    shrinkWrap: true,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 8.0,
                      mainAxisSpacing: 8.0,
                    ),
                    itemCount: foods.length,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  DetailPage(foodItem: foods[index]),
                            ),
                          );
                        },
                        child: FoodCard(foods[index]),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

Widget FoodCard(FoodItem foodItem) {
  return Card(
    elevation: 5.0,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(15.0),
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Stack(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.vertical(top: Radius.circular(15.0)),
              child: Image.network(
                foodItem.imageUrl,
                width: double.infinity,
                height: 150.0,
                fit: BoxFit.cover,
              ),
            ),
            Positioned(
              top: 8.0,
              left: 8.0,
              child: Container(
                padding: EdgeInsets.all(4.0),
                decoration: BoxDecoration(
                  color: Colors.black54,
                  borderRadius: BorderRadius.circular(25.0),
                ),
                child: Row(
                  children: [
                    Icon(
                      Icons.access_time,
                      color: Colors.white,
                      size: 18.0,
                    ),
                    SizedBox(width: 4.0),
                    Padding(
                      padding: const EdgeInsets.all(3.0),
                      child: Text(
                        foodItem.time,
                        style: TextStyle(fontSize: 13.0, color: Colors.white),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              bottom: 8.0,
              right: 8.0,
              child: Container(
                padding: EdgeInsets.all(4.0),
                decoration: BoxDecoration(
                  color: Colors.black54,
                  borderRadius: BorderRadius.circular(25.0),
                ),
                child: Row(
                  children: [
                    Icon(
                      Icons.star,
                      color: Colors.orange,
                      size: 18.0,
                    ),
                    SizedBox(width: 4.0),
                    Padding(
                      padding: const EdgeInsets.all(3.0),
                      child: Text(
                        foodItem.rating,
                        style: TextStyle(fontSize: 13.0, color: Colors.white),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
        Padding(
          padding: EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                foodItem.name,
                style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ],
    ),
  );
}
