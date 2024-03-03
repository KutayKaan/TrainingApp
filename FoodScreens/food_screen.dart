import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:health_flow/FoodScreens/food_list.dart';

class foodScreen extends StatefulWidget {
  const foodScreen({super.key});

  @override
  State<foodScreen> createState() => _foodScreenState();
}

class _foodScreenState extends State<foodScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        toolbarHeight: 60,
        title: const Text(
            'Food List',
            style: TextStyle(
              color: Colors.black,    
            ),
          ),
        centerTitle: true,
        leading: Container(),
        actions: [
          IconButton(
              icon: const Icon(Icons.close),
              onPressed: () {
                Navigator.pop(context);
              },
            iconSize: 30,
            color: const Color(0xff3164D2),
          ),
        ],
        backgroundColor: const Color.fromARGB(255, 236, 236, 236),
      ),
      body: const SingleChildScrollView(
        child : Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            children: [
              FoodCard(
                foodName: 'Meat', 
                imagePath: 'assets/images/food.png', 
                kcal: 458, 
                foodInfo: {
                  'Protein' : 48.2,
                  'Carbs': 8.0,
                  'Fat': 20.0,
                } 
              ),
              FoodCard(
                foodName: 'Egg', 
                imagePath: 'assets/images/food.png', 
                kcal: 147, 
                foodInfo: {
                  'Protein' : 5.2,
                  'Carbs': 2.0,
                  'Fat': 0.3,
                } 
              ),
              FoodCard(
                foodName: 'Brown Rice', 
                imagePath: 'assets/images/food.png', 
                kcal: 225, 
                foodInfo: {
                  'Protein' : 5.0,
                  'Carbs': 50.2,
                  'Fat': 20.8,
                } 
              ),
              FoodCard(
                foodName: 'Cake', 
                imagePath: 'assets/images/food.png', 
                kcal: 313, 
                foodInfo: {
                  'Protein' : 4.8,
                  'Carbs': 45.1,
                  'Fat': 15.1,
                } 
              ),
              FoodCard(
                foodName: 'Cake', 
                imagePath: 'assets/images/food.png', 
                kcal: 313, 
                foodInfo: {
                  'Protein' : 4.8,
                  'Carbs': 45.1,
                  'Fat': 15.1,
                } 
              ),
              FoodCard(
                foodName: 'Cake', 
                imagePath: 'assets/images/food.png', 
                kcal: 313, 
                foodInfo: {
                  'Protein' : 4.8,
                  'Carbs': 45.1,
                  'Fat': 15.1,
                } 
              ),
              FoodCard(
                foodName: 'Cake', 
                imagePath: 'assets/images/food.png', 
                kcal: 313, 
                foodInfo: {
                  'Protein' : 4.8,
                  'Carbs': 45.1,
                  'Fat': 15.1,
                } 
              )
            ],
          ),
        ),
      )
    );
  }
}