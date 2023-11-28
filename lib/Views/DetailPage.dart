import 'package:flutter/material.dart';
// import 'package:recipeapp/Models/Food.dart';
import 'package:recipeapp/Models/recipe.dart';
import 'package:recipeapp/Models/recipe_api.dart';
import 'package:recipeapp/Views/DetailVideo.dart';
import 'package:recipeapp/Views/Favorite.dart';

class DetailPage extends StatefulWidget {
  final Resep recipe;

  DetailPage({required this.recipe});

  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  late List<Resep> _resep;
  bool _isLoading = true;
  // bool isFavorite = false;

  @override
  void initState() {
    super.initState();
    getResep();
  }

  Future<void> getResep() async {
    _resep = await ResepApi.getResep();
    setState(() {
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange,
        title: Text(
          "Detail",
          style: TextStyle(
              fontWeight: FontWeight.bold, color: Colors.white, fontSize: 20.0),
        ),
        iconTheme: IconThemeData(color: Colors.white),
      ),
      body: _isLoading
          ? Center(child: CircularProgressIndicator())
          : Column(
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
                            image: NetworkImage(widget.recipe.images),
                            fit: BoxFit.cover,
                          ),
                        ),
                        child: Visibility(
                          visible: widget.recipe.videourl != 'noVideo'
                              ? true
                              : false,
                          child: Stack(
                            children: [
                              Center(
                                child: IconButton(
                                  icon: Icon(
                                    Icons.play_circle_fill_rounded,
                                    color: Colors.white,
                                    size: 60.0,
                                  ),
                                  onPressed: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => DetailVideo(
                                                recipe: widget.recipe)));
                                  },
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(height: 16.0),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            widget.recipe.name,
                            style: TextStyle(
                                fontSize: 15.0, fontWeight: FontWeight.bold),
                          ),
                          // IconButton(
                          //   icon: Icon(
                          //     isFavorite
                          //         ? Icons.favorite
                          //         : Icons.favorite_border,
                          //     color: isFavorite ? Colors.red : null,
                          //   ),
                          //   onPressed: () {
                          //     setState(() {
                          //       isFavorite = !isFavorite;
                          //     });
                          //     if (isFavorite) {
                          //       // Delay untuk memastikan bahwa widget telah diinisialisasi sepenuhnya
                          //       Future.delayed(Duration.zero, () {
                          //         Navigator.of(context).push(
                          //           MaterialPageRoute(
                          //             builder: (context) =>
                          //                 Favorite(recipe: widget.recipe),
                          //           ),
                          //         );
                          //       });
                          //     }
                          //   },
                          // ),
                        ],
                      ),
                      // Text(
                      //   widget.foodItem.category,
                      //   style: TextStyle(fontSize: 15.0, color: Colors.grey),
                      // ),
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
                                  widget.recipe.totalTime,
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
                                Text(
                                  widget.recipe.calories.toString(),
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(width: 4.0),
                                Text(
                                  "calories",
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
                      SizedBox(height: 20.0),
                      Text(
                        "Description:",
                        style: TextStyle(
                            fontSize: 18.0, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 10),
                      Text(
                        widget.recipe.description,
                        style: TextStyle(
                          fontSize: 16.0,
                          color: Colors.grey[600],
                        ),
                        textAlign: TextAlign.justify,
                      ),
                      SizedBox(height: 16.0),
                      Text(
                        "Instructions:",
                        style: TextStyle(
                            fontSize: 18.0, fontWeight: FontWeight.bold),
                      ),
                      if (widget.recipe.instructions.isNotEmpty)
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: widget.recipe.instructions
                              .map((instruction) => ListTile(
                                    leading: Icon(Icons.arrow_right),
                                    title: Text(
                                      instruction,
                                      textAlign: TextAlign.justify,
                                      style: TextStyle(
                                        fontSize: 16.0,
                                        color: Colors.grey[600],
                                      ),
                                    ),
                                  ))
                              .toList(),
                        ),
                      // if (widget._resep.ingredients != null)
                      //   Column(
                      //     crossAxisAlignment: CrossAxisAlignment.start,
                      //     children: widget.foodItem.ingredients!
                      //         .map((ingredient) => ListTile(
                      //               leading: Icon(Icons.arrow_right),
                      //               title: Text(
                      //                 ingredient,
                      //                 textAlign: TextAlign.justify,
                      //               ),
                      //             ))
                      //         .toList(),
                      //   ),
                      // SizedBox(height: 16.0),
                      // Text(
                      //   "Instructions:",
                      //   style: TextStyle(
                      //       fontSize: 18.0, fontWeight: FontWeight.bold),
                      // ),
                      // if (widget.foodItem.instructions != null)
                      //   Column(
                      //     crossAxisAlignment: CrossAxisAlignment.start,
                      //     children: widget.foodItem.instructions!
                      //         .map((instruction) => ListTile(
                      //               leading: Icon(Icons.arrow_right),
                      //               title: Text(
                      //                 instruction,
                      //                 textAlign: TextAlign.justify,
                      //               ),
                      //             ))
                      //         .toList(),
                      //   ),
                    ],
                  ),
                ),
              ],
            ),
    );
  }
}
