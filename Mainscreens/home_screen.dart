import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:health_flow/FoodScreens/calories_screen.dart';
import 'package:health_flow/Mainscreens/profile_screen.dart';

class HomePageScreen extends StatefulWidget {
  const HomePageScreen({Key? key}) : super(key: key);

  @override
  State<HomePageScreen> createState() => _HomePageScreenState();
}

class _HomePageScreenState extends State<HomePageScreen> {
  String userName = '';

  @override
  void initState() {
    super.initState();
    _loadUserData();
  }

  Future<void> _loadUserData() async {
    final user = FirebaseAuth.instance.currentUser;

    if (user != null) {
      final userData = await _getUserData(user.uid);

      if (userData != null) {
        setState(() {
          userName = userData['userName'];

        });
      }
    }
  }

  Future<Map<String, dynamic>?> _getUserData(String uid) async {
    try {
      final DocumentSnapshot<Map<String, dynamic>> 
      snapshot = await FirebaseFirestore.instance.collection('Person').doc(uid).get();

      if (snapshot.exists) {
        return snapshot.data();
      } else {
        return null;
      } // provider , state management,mvvm,mvc,designpattern !!!! ÖNEMLİ ÇÇÖ
    } catch (e) {
      return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(25),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    const Icon(
                      Icons.access_alarm_outlined,
                      size: 40, 
                      color: Colors.amber, 
                    ),
                    const SizedBox(width: 10),              
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Günaydın",
                          style: TextStyle(
                            color: Color(0xff3164D2),
                            fontSize: 16,
                            fontWeight: FontWeight.bold
                          ),
                        ),
                        Text(
                          userName,
                          style: const TextStyle(
                            color: Colors.black,
                            fontSize: 14
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const profileScreen()),
                    );
                  },
                  child: const Icon(
                    Icons.usb_rounded,
                    color: Color(0xff3164D2),
                    size: 40,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 30),
            const Text(
              'Nutrition',
              style: TextStyle(
                color: Colors.black,
                fontSize: 20,
                fontWeight: FontWeight.bold
              ),
            ),
            const SizedBox(height: 30),
            Row(
              children: [
                Expanded(
                  child: OutlinedButton(
                    onPressed: () {},
                    style: OutlinedButton.styleFrom(
                      minimumSize: const Size(50, 50),
                    ),
                    child: const Text('Water'),
                  ),
                ),
                const SizedBox(width: 20),
                Expanded(
                  child: OutlinedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const CaloriesScreen()),
                      );
                    },
                    style: OutlinedButton.styleFrom(
                      minimumSize: const Size(50, 50),
                    ),
                    child: const Text('Food'),
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

