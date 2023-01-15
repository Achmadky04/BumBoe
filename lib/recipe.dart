import 'package:flutter/material.dart';

class Recipe extends StatelessWidget {
  // final String idCategory;
  // final String title;
  
  const Recipe({super.key, 
  // required this.idCategory, required this.title
  });

  @override
  Widget build(BuildContext context) {
    Map<String, dynamic> argsRecipe = ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    return Scaffold(
      appBar: AppBar(
          centerTitle: true,
          title:  Text(
            argsRecipe['title'],
            // ignore: prefer_const_constructors
            style: TextStyle(color: Colors.black),
          ),
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        // ignore: prefer_const_constructors
        body: Center(
          // ignore: prefer_const_constructors
          child: Text("Recipe"),
        ),
    );
  }
}