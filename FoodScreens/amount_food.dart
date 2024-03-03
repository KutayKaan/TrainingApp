import 'package:flutter/material.dart';
import 'package:health_flow/FoodScreens/food_screen.dart';

class AmountFood extends StatelessWidget {
  
  final String foodName;
  final String imagePath;
  final int kcal;
  final Map<String, double> foodInfo;

  const AmountFood({
    super.key,
    required this.foodName,
    required this.imagePath,
    required this.kcal,
    required this.foodInfo
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(
        elevation: 0,
        toolbarHeight: 60,
        title: const Text(
            'Amount of Food',
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
      body: Padding(
        padding: const EdgeInsets.all(25),
        child: Column(
          
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
                  fontSize: 22,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 40),
            Row(
              children: [
                IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.remove_circle_outline,
                    size: 35,
                    color: Color(0xff3164D2),
                  ),
                ),
                const SizedBox(width: 10),
                const Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'Amount Of Your Food',
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.add_circle_outline,
                    size: 35,
                    color: Color(0xff3164D2),
                  ),
                ),
              ],
            ),
            const SizedBox(height:30),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: OutlinedButton(
                    onPressed: (){},
                    style: OutlinedButton.styleFrom(
                      backgroundColor: Colors.white,
                      minimumSize: const Size(double.infinity, 40), // Satırı kaplamak için minimum boyut
                    ),
                    child: const Text(
                      'Gr',
                      style: TextStyle(
                        color: Color(0xff3164D2),
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: OutlinedButton(
                    onPressed: (){},
                    style: OutlinedButton.styleFrom(
                      backgroundColor: const Color(0xff3164D2),
                      minimumSize: const Size(double.infinity, 40),
                    ),
                    child: const Text(
                      'Cup',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const Spacer(),
            Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: (){
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const foodScreen()),
                      );
                    }, 
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xff3164D2),
                      padding: const EdgeInsets.all(18)
                    ),
                    child: const Text('Add Food'),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}