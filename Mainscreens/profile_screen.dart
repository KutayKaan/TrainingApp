import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class profileScreen extends StatefulWidget {
  const profileScreen({super.key});

  @override
  State<profileScreen> createState() => _profileScreenState();
}

class _profileScreenState extends State<profileScreen> {
  String userName = '';
  String gender = '';
  String age = '';

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
          gender = userData['gender'];
          age = userData['age'];
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
      appBar: AppBar(
        elevation: 0,
        toolbarHeight: 60,
        title: const Text(
            'Profile',
            style: TextStyle(
              color: Colors.black,    
            ),
          ),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        iconSize: 30,
        color: Color(0xff3164D2),
      ),
        backgroundColor: Color.fromARGB(255, 236, 236, 236),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(height: 50),
            ElevatedButton(
              onPressed: (){},
              style:ElevatedButton.styleFrom(
                backgroundColor: const Color(0xffcecece),
                minimumSize: const Size(double.infinity, 40),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal:0 ,vertical: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          userName,
                          style: const TextStyle(
                            fontSize: 18,
                            color: Colors.black,
                          ),
                        ),
                        SizedBox(height: 5),
                        Text(
                          'Gender : ${gender}',
                          style: const TextStyle(
                            fontSize: 14,
                            color: Colors.black,
                          ),
                        ),
      
                      ],
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 30),
            ElevatedButton(
              onPressed: (){},
              style:ElevatedButton.styleFrom(
                backgroundColor: Color(0xffcecece),
                minimumSize: const Size(double.infinity, 40),
              ),
              child:const  Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    'Edit Profile',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 30),
            ElevatedButton(
              onPressed: (){},
              style:ElevatedButton.styleFrom(
                backgroundColor: Color(0xffcecece),
                minimumSize: const Size(double.infinity, 40),
              ),
              child:const  Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    'Settings',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 30),
            ElevatedButton(
              onPressed: (){},
              style:ElevatedButton.styleFrom(
                backgroundColor: Color(0xffcecece),
                minimumSize: const Size(double.infinity, 40),
              ),
              child:const  Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    'Contact Us',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 30),

            ElevatedButton(
              onPressed: (){},
              style:ElevatedButton.styleFrom(
                backgroundColor: Color(0xffcecece),
                minimumSize: const Size(double.infinity, 40),
              ),
              child:const  Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    'Log Out',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            ),

            
          ],
        ), 
      ),
    );
}
}