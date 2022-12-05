import 'package:flutter/cupertino.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:twitter/models/user.dart';

class Auth extends ChangeNotifier {
  static Future<User?> newNewSignUp(
      String email, String password, String username, String name) async {
    final auth = FirebaseAuth.instance;
    final firestore = FirebaseFirestore.instance;

    final result = await auth.createUserWithEmailAndPassword(
        email: email, password: password);

    final user = result.user;

    if (user != null) {
      final userRef = firestore.collection('users').doc(user.uid);

      final userData = User();

      await userRef.set(userData.toDocument());

      return user;
    }
    return null;
  }
}
