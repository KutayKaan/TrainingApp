import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AuthService{
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<User?> signIn(String email, String password) async {
  try {
    var userCredential = await _auth.signInWithEmailAndPassword(
      email: email,
      password: password,
    );

    return userCredential.user;
  } catch (e) {
    return null;
  }
}
/*
  signOut() async{
    return await _auth.signOut();
  }
*/
Future<User?> signUp(String name, String email, String password) async {
  try {
    var userCredential = await _auth.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );

    var user = userCredential.user;

    if (user != null) {
      // Kullanıcı başarıyla oluşturuldu, ek işlemleri burada yapabilirsiniz.
      await _firestore.collection("Person").doc(user.uid).set({
        'userName': name,
        'email': email,
      });

      return user;
    } else {
      return null;
    }
  } catch (e) {
    return null;
  }
}

Future<void> addUserInfo(String uid, Map<String, dynamic> userData) async {
  try {
    await _firestore.collection("Person").doc(uid).update(userData);
  } catch (e) {
    return;
  }
}
}