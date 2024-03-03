import 'package:flutter/material.dart';
import 'package:health_flow/FoodScreens/amount_food.dart';

class FoodCard extends StatelessWidget {
  final String foodName;
  final String imagePath;
  final int kcal;
  final Map<String, double> foodInfo;
  
  const FoodCard({
    super.key,
    required this.foodName,
    required this.imagePath,
    required this.kcal,
    required this.foodInfo
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Image.asset(
                      imagePath,
                      width: 40,
                    ),
                    const SizedBox(width: 20),
                    Text(
                      foodName,
                      style: const TextStyle(
                        fontSize: 17,
                      ),
                    ),
                  ],
                ),
                IconButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => AmountFood(foodName: foodName,imagePath: imagePath,kcal: kcal,foodInfo: foodInfo,)),
                      );
                  },
                  icon: const Icon(
                    Icons.add_circle_outline,
                    size: 30,
                    color: Color(0xff3164D2),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            Text('$kcal kcal'),
            const SizedBox(height: 5),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                for (var entry in foodInfo.entries)
                  Text('${entry.key}: ${entry.value} gr'),
              ],
            ),
          ],
        ),
      ),
    );
  }
}