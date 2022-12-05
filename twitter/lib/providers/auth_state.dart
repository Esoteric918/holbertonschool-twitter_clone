import 'package:flutter/cupertino.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:twitter/models/user.dart';

class AuthState extends ChangeNotifier {
  static Future<User?> newSignUp(
      String email, String password, String username, String name) async {
    final auth = FirebaseAuth.instance;
    final firestore = FirebaseFirestore.instance;

    final result = await auth.createUserWithEmailAndPassword(
        email: email, password: password);

    final user = result.user;

    if (user != null) {
      final userRef = firestore.collection('users').doc(user.uid);

      final userData = UserData();

      await userRef.set(userData.toJson());

      return user;
    }
    return null;
  }
}
