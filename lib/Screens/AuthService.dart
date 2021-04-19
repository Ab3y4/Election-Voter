import 'package:election_voter/Screens/LanguageScreen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'Login.dart';

class AuthService {

  handleAuth () {
    return StreamBuilder(
      stream: FirebaseAuth.instance.onAuthStateChanged,
        builder: (BuildContext context, snapshot) {
        if (snapshot.hasData) {
          return LanguageScreen();
        } else {
          return LoginScreen();
        }
        });
  }

  signOut () {
    FirebaseAuth.instance.signOut();
  }

  signIn (AuthCredential authCreds) {
    FirebaseAuth.instance.signInWithCredential(authCreds);
  }
}