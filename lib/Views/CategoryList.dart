import 'package:flutter/material.dart';
import 'package:recipeapp/Models/recipe.dart';
import 'package:recipeapp/Models/recipe_api.dart';
import 'package:recipeapp/Views/DetailPage.dart';

class FoodGridPage extends StatefulWidget {
  @override
  State<FoodGridPage> createState() => _FoodGridPageState();
}

class _FoodGridPageState extends State<FoodGridPage> {
  late List<Resep> _resep;
  bool _isLoading = true;
  String searchText = '';

  @override
  void initState() {
    super.initState();
    _resep = [];
    getResep();
  }

  Future<void> getResep() async {
    _resep = await ResepApi.getResep();
    setState(() {
      _isLoading = false;
    });
  }

  List<Resep> get _filteredResep {
    return _resep
        .where((resep) =>
            resep.name.toLowerCase().contains(searchText.toLowerCase()))
        .toList();
  }

  void _navigateToDetail(Resep resep) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => DetailPage(recipe: resep),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange,
        title: Text(
          'All Recipes',
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
        ),
        iconTheme: IconThemeData(color: Colors.white),
      ),
      body: _isLoading
          ? Center(child: CircularProgressIndicator())
          : Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 15.0,
                    horizontal: 8.0,
                  ),
                  child: TextField(
                    onChanged: (value) {
                      setState(() {
                        searchText = value;
                      });
                    },
                    decoration: InputDecoration(
                      hintText: 'Search...',
                      contentPadding: EdgeInsets.symmetric(horizontal: 20.0),
                      prefixIcon: Icon(Icons.search),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30.0),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: GridView.builder(
                    shrinkWrap: true,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 8.0,
                      mainAxisSpacing: 8.0,
                    ),
                    itemCount: _filteredResep.length,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          _navigateToDetail(_filteredResep[index]);
                        },
                        child: ResepCard(_filteredResep[index]),
                      );
                    },
                  ),
                ),
              ],
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
                    fontSize: 15.0,
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
