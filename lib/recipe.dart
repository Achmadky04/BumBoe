import 'package:bumboe/dummy_data.dart';
import 'package:flutter/material.dart';

import 'models/food.dart';

class Recipe extends StatelessWidget {
  // final String idCategory;
  // final String title;

  const Recipe({
    super.key,
    // required this.idCategory, required this.title
  });

  @override
  Widget build(BuildContext context) {
    Map<String, dynamic> argsRecipe =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;

    List<Food> filteredFood = dummy_food.where((food) {
      return food.category.contains(argsRecipe['id']);
    }).toList();

    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          argsRecipe['title'],
          // ignore: prefer_const_constructors
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      // ignore: prefer_const_constructors
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: ListView.builder(
            itemCount: filteredFood.length,
            itemBuilder: (context, index) {
              final food = filteredFood[index];
              return Container(
                margin: const EdgeInsets.only(bottom: 20),
                decoration: BoxDecoration(color: Colors.white,
                borderRadius: BorderRadius.circular(20)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: 200,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image: NetworkImage(food.imageUrl),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            food.title,
                            style: const TextStyle(fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  const Icon(
                                Icons.timer_outlined,
                                color: Colors.red,
                              ),
                              Text(
                                ' ${food.duration} Menit',
                                style: const TextStyle(color: Colors.red),
                              ),
                                ],
                              ),
                              IconButton(onPressed: (){}, 
                              icon: const Icon(
                                Icons.favorite_border_outlined,
                                color: Colors.redAccent,
                                size: 30,))
                            ],
                          )
                        ],
                      ),
                    )
                  ],
                ),
              );
            }),
      ),
    );
  }
}
