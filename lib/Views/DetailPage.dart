import 'package:flutter/material.dart';
import 'package:recipeapp/Models/Food.dart';

class DetailPage extends StatefulWidget {
  final FoodItem foodItem;

  DetailPage({required this.foodItem});

  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  bool isFavorite = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange,
        title: Text(
          widget.foodItem.name,
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView(
              padding: EdgeInsets.all(16.0),
              children: [
                Container(
                  height: 250.0,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15.0),
                    image: DecorationImage(
                      image: NetworkImage(widget.foodItem.imageUrl),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                SizedBox(height: 16.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      widget.foodItem.name,
                      style: TextStyle(
                          fontSize: 30.0, fontWeight: FontWeight.bold),
                    ),
                    IconButton(
                      icon: Icon(
                        isFavorite ? Icons.favorite : Icons.favorite_border,
                        color: isFavorite ? Colors.red : null,
                      ),
                      onPressed: () {
                        setState(() {
                          isFavorite = !isFavorite;
                        });
                      },
                    ),
                  ],
                ),
                Text(
                  widget.foodItem.category,
                  style: TextStyle(fontSize: 15.0, color: Colors.grey),
                ),
                SizedBox(height: 16.0),
                Container(
                  height: 40.0,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.orange,
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Row(
                        children: [
                          Icon(
                            Icons.timer,
                            color: Colors.white,
                          ),
                          SizedBox(width: 4.0),
                          Text(
                            widget.foodItem.time,
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      VerticalDivider(
                        color: Colors.white,
                        thickness: 2.0,
                        width: 20.0,
                      ),
                      Row(
                        children: [
                          Icon(
                            Icons.star,
                            color: Colors.white,
                          ),
                          SizedBox(width: 4.0),
                          Text(
                            widget.foodItem.rating,
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 16.0),
                Text(
                  "Ingredients:",
                  style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
                ),
                if (widget.foodItem.ingredients != null)
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: widget.foodItem.ingredients!
                        .map((ingredient) => ListTile(
                              leading: Icon(Icons.arrow_right),
                              title: Text(
                                ingredient,
                                textAlign: TextAlign.justify,
                              ),
                            ))
                        .toList(),
                  ),
                SizedBox(height: 16.0),
                Text(
                  "Instructions:",
                  style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
                ),
                if (widget.foodItem.instructions != null)
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: widget.foodItem.instructions!
                        .map((instruction) => ListTile(
                              leading: Icon(Icons.arrow_right),
                              title: Text(
                                instruction,
                                textAlign: TextAlign.justify,
                              ),
                            ))
                        .toList(),
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
