import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:recipeapp/Models/Category.dart';
import 'package:recipeapp/Views/DetailPage.dart';
import 'package:recipeapp/Models/recipe.dart';
import 'package:recipeapp/Models/recipe_api.dart';
import 'package:recipeapp/service.dart';

class Home extends StatefulWidget {
  const Home({Key? key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late List<Resep> _resep;
  bool _isLoading = true;

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text(
          "Mavia Cooking",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.orange,
        iconTheme: IconThemeData(color: Colors.orange),
        automaticallyImplyLeading: false,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: StreamBuilder(
          stream: Database.getData(),
          builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              return Center(child: Text('Error: ${snapshot.error}'));
            } else {
              var userData = snapshot.data!.docs.isNotEmpty
                  ? (snapshot.data!.docs.first.data() as Map<String, dynamic>)
                  : null;

              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(
                        vertical: 20.0, horizontal: 15.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            RichText(
                              text: TextSpan(
                                text: 'Hello, ',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 17.0,
                                ),
                                children: [
                                  TextSpan(
                                    text:
                                        userData?['username'] ?? 'No Username',
                                    style: TextStyle(
                                      fontSize: 17.0,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            CircleAvatar(
                              radius: 30,
                              backgroundImage:
                                  AssetImage("assets/images/profil2.png"),
                            ),
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Make your own food, ',
                              style: TextStyle(
                                fontSize: 35.0,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                            ),
                            Row(
                              children: [
                                Text(
                                  'stay at ',
                                  style: TextStyle(
                                    fontSize: 35.0,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                  ),
                                ),
                                Text(
                                  'home',
                                  style: TextStyle(
                                    fontSize: 35.0,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.orange,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
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
                        List<int>
                            currentCategoryIndices; 

                        switch (index) {
                          case 0:
                            currentIcon = Icons.icecream_outlined;
                            currentCategory = 'Main Course';
                            currentCategoryIndices = [
                              0, 3,
                              9, 6, 13, 7, 15
                            ]; 
                            break;
                          case 1:
                            currentIcon = Icons.fastfood;
                            currentCategory = 'Appetizers';
                            currentCategoryIndices = [1, 5, 12, 16];
                            break;
                          case 2:
                            currentIcon = Icons.local_dining;
                            currentCategory = 'Chicken Dishes';
                            currentCategoryIndices = [0, 4, 9, 13];
                            break;
                          case 3:
                            currentIcon = Icons.local_florist;
                            currentCategory = 'Side Dishes';
                            currentCategoryIndices = [1, 5, 12, 16];
                            break;
                          case 4:
                            currentIcon = Icons.cake;
                            currentCategory = 'Desserts';
                            currentCategoryIndices = [2, 7, 10];
                            break;
                          case 5:
                            currentIcon = Icons.local_pizza;
                            currentCategory = 'Snacks';
                            currentCategoryIndices = [11, 8, 17, 14, 18, 19];
                            break;
                          case 6:
                            currentIcon = Icons.restaurant;
                            currentCategory = 'Pasta Dishes';
                            currentCategoryIndices = [1, 3, 5, 6, 12];
                            break;
                          default:
                            currentIcon = Icons.restaurant;
                            currentCategory = 'Chicken Dishes';
                            currentCategoryIndices = [0, 4, 9, 13];
                        }

                        return Category(
                          iconName: currentIcon,
                          categoryName: currentCategory,
                          iconColor: Colors.white,
                          categoryIndices:
                              currentCategoryIndices, 
                        );
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
                                height: 413.0,
                                child: GridView.builder(
                                  shrinkWrap: true,
                                  gridDelegate:
                                      const SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 2,
                                    crossAxisSpacing: 8.0,
                                    mainAxisSpacing: 8.0,
                                  ),
                                  itemCount:
                                      _resep.length > 5 ? 5 : _resep.length,
                                  itemBuilder: (context, index) {
                                    return ResepCard(
                                      resep: _resep[index],
                                      context: context,
                                    );
                                  },
                                ),
                              ),
                      ],
                    ),
                  ),
                ],
              );
            }
          },
        ),
      ),
    );
  }
}

Widget ResepCard({required Resep resep, required BuildContext context}) {
  return Card(
    elevation: 5.0,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(15.0),
    ),
    child: InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DetailPage(recipe: resep),
          ),
        );
      },
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
                    fontSize: 10.0,
                    fontWeight: FontWeight.bold,
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
        ],
      ),
    ),
  );
}
