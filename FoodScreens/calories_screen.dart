import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:health_flow/FoodScreens/food_screen.dart';

class CaloriesScreen extends StatefulWidget {
  const CaloriesScreen({super.key});

  @override
  State<CaloriesScreen> createState() => _CaloriesScreenState();
}

class _CaloriesScreenState extends State<CaloriesScreen> {
  String? _currentText;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        toolbarHeight: 60,
        title: const Text(
            'Calories Consumed',
            style: TextStyle(
              color: Colors.black,    
            ),
          ),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        iconSize: 30,
        color: const Color(0xff3164D2),
      ),
        backgroundColor: const Color.fromARGB(255, 236, 236, 236),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Column(
                  children: [
                    Text('Carbs'),
                    SizedBox(height: 20),
                    CircularProgressIndicator(
                      strokeWidth: 8,
                      value: 0.8,
                      color: Color(0xff3164D2),
                    )
                  ],                  
                ),
                Column(
                  children: [
                    Text('Protein'),
                    SizedBox(height: 20),
                    CircularProgressIndicator(
                      strokeWidth: 8,
                      value: 0.8,
                      color: Color(0xff3164D2),
                    )
                  ],                  
                ),

                Column(
                  children: [
                    Text('Fat'),
                    SizedBox(height: 20),
                    CircularProgressIndicator(
                      strokeWidth: 8,
                      value: 0.8,
                      color: Color(0xff3164D2),
                    )
                  ],                  
                ),
              ],
            ),
            const SizedBox(height: 50),
            SizedBox(
              width: double.infinity,
              child: CupertinoSegmentedControl(
                children: {
                  'Breakfast' : Container(
                    color: _currentText == 'Breakfast' 
                      ? Colors.white
                      : const Color.fromARGB(255, 236, 236, 236),
                    width: double.infinity,
                    padding: const EdgeInsets.all(12),
                    child: const Text(
                      'Breakfast',
                      style: TextStyle(
                        color: Colors.black
                      ),
                    ),
                  ),
                  'Lunch' : Container(
                    color: _currentText == 'Lunch' 
                      ? Colors.white
                      : const Color.fromARGB(255, 236, 236, 236),
                    width: double.infinity,
                    padding: const EdgeInsets.all(12),
                    child: const Text(
                      'Lunch',
                      style: TextStyle(
                        color: Colors.black
                      ),
                    ),
                  ),
                  'Dinner' : Container(
                    color: _currentText == 'Dinner' 
                      ? Colors.white
                      : const Color.fromARGB(255, 236, 236, 236),
                    width: double.infinity,
                    padding: const EdgeInsets.all(12),
                    child: const Text(
                      'Dinner',
                      style: TextStyle(
                        color: Colors.black
                      ),
                    ),
                  ),
                  'Sneak' : Container(
                    color: _currentText == 'Sneak' 
                      ? Colors.white
                      : const Color.fromARGB(255, 236, 236, 236),
                    width: double.infinity,
                    padding: const EdgeInsets.all(12),
                    child: const Text(
                      'Sneak',
                      style: TextStyle(
                        color: Colors.black
                      ),
                    ),
                  ),
                }, 
                onValueChanged: (String value){
                  setState(() {
                    _currentText = value;
                  });
                },
                borderColor: Colors.grey,
              ),
            ),
            const Divider(
              height: 60,
              thickness: 0.2,
              indent: 0,
              endIndent: 0,
              color: Colors.black,
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
            const SizedBox(height: 15)
          ],
        ),
      ),
    );
  }
}