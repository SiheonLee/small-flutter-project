import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class AuthService {

  final FirebaseAuth _auth = FirebaseAuth.instance;

  // sign in
  Future signInAnon() async {
    try{
      UserCredential result = await _auth.signInAnonymously();
      User user = result.user;
      return user;
    }catch(e) {
      print(e.toString());
      return null;
    }
  }

  //sign in with email & password
  Future signInEmailAndPassword({String userEmail, String password}) async {
    try{
      UserCredential result = await _auth.signInWithEmailAndPassword(email: userEmail, password: password);
      User user = result.user;
      return user;
    }catch(e){
      print(e.toString());
      return null;
    }
  }

  //register with email & password
  Future registerWithEmail({String userEmail, String password}) async {
    try{
      UserCredential result = await _auth.createUserWithEmailAndPassword(email: userEmail, password: password);
      User user = result.user;
      return user;
    }catch(e){
      print(e.toString());
      return null;
    }
  }

  //sign out
  Future signOut() async {
    try{
      return await _auth.signOut();
    }catch(e){
      print(e.toString());
      return null;
    }
  }

}