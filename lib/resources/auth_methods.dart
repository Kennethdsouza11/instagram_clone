import "dart:typed_data";

import "package:cloud_firestore/cloud_firestore.dart";
import "package:firebase_auth/firebase_auth.dart";

import "package:instagram_flutter/resources/storage_methods.dart";
import "package:instagram_flutter/models/user.dart" as model;

class AuthMethods {
  final FirebaseAuth _auth = FirebaseAuth
      .instance; //with this we get an instance of FirebaseAuth class nd we can call multiple funcitnos on it.
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  //Function to sign up user.
  Future<String> signUpUser({
    required String email,
    required String password,
    required String username,
    required String bio,
    required Uint8List
        file, //Uint8List is a fixed list of 8-bit unsigned integers. U stands for unsigned so the value ranges from 0 to 255.
  }) async {
    String res = 'Some error occurred';
    try {
      if (email.isNotEmpty ||
          password.isNotEmpty ||
          username.isNotEmpty ||
          bio.isNotEmpty) {
        //register the user.
        UserCredential cred = await _auth.createUserWithEmailAndPassword(
            email: email, password: password);

        print(cred.user!.uid);

        String photoUrl = await StorageMethods()
            .uploadImageToStorage('profilePics', file, false);

        //add user to our database.

        model.User user = model.User(
          email: email,
          password: password,
          photoUrl: photoUrl,
          username: username,
          followers: [],
          following: [],
          bio: bio,
          uid: cred.user!.uid,
        );

        //telling the firebase to create a user collection (if its not there) with the doc mentioned below and set it(again if its not there).
        await _firestore.collection('users').doc(cred.user!.uid).set(user.toJson());

        res = 'success';
      }
    } catch (err) {
      res = err.toString();
    }
    return res;
  }

  //logging in user
  Future<String> loginUser({
    required String email,
    required String password,
  }) async {
    String res = "Some error occurred";

    try {
      if (email.isNotEmpty || password.isNotEmpty) {
        await _auth.signInWithEmailAndPassword(
            email: email, password: password);
        res = "success";
      } else {
        res = "Please enter all the fields";
      }
    } catch (err) {
      res = err.toString();
    }
    return res;
  }
}
