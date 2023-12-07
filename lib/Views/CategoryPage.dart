import 'package:flutter/material.dart';
import 'package:recipeapp/Models/recipe.dart';
import 'package:recipeapp/Models/recipe_api.dart';
import 'package:recipeapp/Views/DetailPage.dart';

class CategoryPage extends StatefulWidget {
  final List<int> customDataIndices; 

  CategoryPage({
    required this.customDataIndices,
  });

  @override
  State<CategoryPage> createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {
  late List<Resep> _categoryData;
  bool _isLoading = true;

  void _navigateToDetail(Resep resep) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => DetailPage(recipe: resep),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    _categoryData = [];
    getCategoryData(widget.customDataIndices);
  }

  Future<void> getCategoryData(List<int> customDataIndices) async {
    _categoryData = await ResepApi.getResep();

    _categoryData = _categoryData
        .where((recipe) =>
            customDataIndices.contains(_categoryData.indexOf(recipe)))
        .toList();

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
          'Category Recipes',
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
        ),
        iconTheme: IconThemeData(color: Colors.white),
        centerTitle: true,
      ),
      body: _isLoading
          ? Center(child: CircularProgressIndicator())
          : GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 8.0,
                mainAxisSpacing: 8.0,
              ),
              itemCount: _categoryData.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    _navigateToDetail(_categoryData[index]);
                  },
                  child: ResepCard(_categoryData[index]),
                );
              },
            ),
    );
  }

  Widget ResepCard(Resep resep) {
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
                  resep.images,
                  width: double.infinity,
                  height: 140.0,
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
                          resep.totalTime,
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
                        Icons.local_fire_department,
                        color: Colors.white,
                        size: 18.0,
                      ),
                      SizedBox(width: 4.0),
                      Padding(
                        padding: const EdgeInsets.all(3.0),
                        child: Text(
                          resep.calories.toString(),
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
                  resep.name,
                  style: TextStyle(
                    fontSize: 12.0,
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
}
