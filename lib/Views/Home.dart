import 'package:flutter/material.dart';
import 'package:recipeapp/Models/Category.dart';
import 'package:recipeapp/Views/DetailPage.dart';
import 'package:recipeapp/Models/recipe.dart';
import 'package:recipeapp/Models/recipe_api.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late List<Resep> _resep;
  bool _isLoading = true;
  String searchText = '';

  @override
  void initState() {
    super.initState();
    _fetchResep();
  }

  Future<void> _fetchResep() async {
    try {
      final List<Resep> resepList = await ResepApi.getResep();

      setState(() {
        _isLoading = false;
        _resep = resepList;
      });
    } catch (error) {}
  }

  List<Resep> get _filteredResep {
    return _resep
        .where((resep) =>
            resep.name.toLowerCase().contains(searchText.toLowerCase()))
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    // List<FoodItem> foods = FoodData.foods;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text(
          "Mavia Cooking",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.orange,
        iconTheme: IconThemeData(color: Colors.orange),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding:
                const EdgeInsets.symmetric(vertical: 20.0, horizontal: 15.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Row(
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
                  text: const TextSpan(
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
            padding:
                const EdgeInsets.symmetric(vertical: 8.0, horizontal: 15.0),
            child: TextField(
              onChanged: (value) {
                setState(() {
                  searchText = value;
                });
              },
              decoration: InputDecoration(
                hintText: 'Search any recipe',
                filled: true,
                fillColor: Colors.white,
                contentPadding: const EdgeInsets.symmetric(horizontal: 20.0),
                prefixIcon: const Icon(Icons.search, color: Colors.black),
                suffixIcon:
                    const Icon(Icons.category_outlined, color: Colors.black),
                border: OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.transparent),
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
            padding: const EdgeInsets.only(left: 15.0, bottom: 20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const Text(
                  "Popular Recipe",
                  style: TextStyle(
                    fontSize: 25.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                _isLoading
                    ? const Center(child: CircularProgressIndicator())
                    : Container(
                        height: 310.0,
                        child: GridView.builder(
                          shrinkWrap: true,
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            crossAxisSpacing: 8.0,
                            mainAxisSpacing: 8.0,
                          ),
                          itemCount: _filteredResep.length > 5 ? 5 : _filteredResep.length,
                          itemBuilder: (context, index) {
                            return GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        DetailPage(recipe: _filteredResep[index]),
                                  ),
                                );
                              },
                              child: ResepCard(_filteredResep[index]),
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
              borderRadius:
                  const BorderRadius.vertical(top: Radius.circular(15.0)),
              child: Image.network(
                resep.images,
                width: double.infinity,
                height: 150.0,
                fit: BoxFit.cover,
              ),
            ),
            Positioned(
              top: 8.0,
              left: 8.0,
              child: Container(
                padding: const EdgeInsets.all(4.0),
                decoration: BoxDecoration(
                  color: Colors.black54,
                  borderRadius: BorderRadius.circular(25.0),
                ),
                child: Row(
                  children: [
                    const Icon(
                      Icons.access_time,
                      color: Colors.white,
                      size: 18.0,
                    ),
                    const SizedBox(width: 4.0),
                    Padding(
                      padding: const EdgeInsets.all(3.0),
                      child: Text(
                        resep.totalTime,
                        style: const TextStyle(
                            fontSize: 13.0, color: Colors.white),
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
                padding: const EdgeInsets.all(4.0),
                decoration: BoxDecoration(
                  color: Colors.black54,
                  borderRadius: BorderRadius.circular(25.0),
                ),
                child: Row(
                  children: [
                    const Icon(
                      Icons.local_fire_department,
                      color: Colors.white,
                      size: 18.0,
                    ),
                    const SizedBox(width: 4.0),
                    Padding(
                      padding: const EdgeInsets.all(3.0),
                      child: Text(
                        resep.calories.toString(),
                        style: const TextStyle(
                            fontSize: 13.0, color: Colors.white),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                resep.name,
                style: const TextStyle(
                    fontSize: 10.0, fontWeight: FontWeight.bold),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        ),
      ],
    ),
  );
}
