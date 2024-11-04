import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthService extends ChangeNotifier {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  String userName = "";
  String userMailId = "";

  String get currentUser => userName;

  Future<String?> registration({
    required String email,
    required String password,
    required String username,
  }) async {
    try {
      // Create user with email and password
      UserCredential userCredential =
          await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      // Store additional user information in Firestore
      await _firestore.collection('users').doc(userCredential. user?.uid).set({
        'username': username,
        'email': email,
      });
      await getUserData(_auth.currentUser!.uid);
      notifyListeners();
      return 'Success';
    } on FirebaseAuthException catch (e) {
      print("error code ${e.code}");
      if (e.code == 'weak-password') {
        return 'The password provided is too weak.';
      } else if (e.code == 'email-already-in-use') {
        return 'The account already exists for that email.';
      } else {
        return e.message;
      }
    } catch (e) {
      print("error codes $e");
      return e.toString();
    }
  }

  Future<String?> login({
    required String email,
    required String password,
  }) async {
    try {
      await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      await getUserData(_auth.currentUser!.uid);
      notifyListeners();
      return 'Success';
    } on FirebaseAuthException catch (e) {
      print("error code ${e.code}");
      if (e.code == 'user-not-found') {
        return 'No user found for that email.';
      } else if (e.code == 'invalid-credential') {
        return 'Email id or password incorrect';
      } else {
        return e.message;
      }
    } catch (e) {
      return e.toString();
    }
  }

  Future<String> signInWithGoogle() async {
    try {
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

      final GoogleSignInAuthentication? googleAuth =
          await googleUser?.authentication;

      final credential = GoogleAuthProvider.credential(
      
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );
      UserCredential userCredential =
          await _auth.signInWithCredential(credential);
      await _firestore.collection('users').doc(userCredential.user?.uid).set({
        'username': userCredential.user!.displayName,
        'email': userCredential.user!.email,
      });
      await getUserData(_auth.currentUser!.uid);
      notifyListeners();
      return "Success";
    } on Exception catch (e) {
      print(e);
      return e.toString();
    }
  }

  Future<String?> logout() async {
    try {
      await _auth.signOut();
      userName = "";
      userMailId = "";
      notifyListeners();
      return "Success";
    } catch (e) {
      return e.toString();
    }
  }

  Future<void> getUserData(String userId) async {
    CollectionReference users = _firestore.collection('users');
    DocumentSnapshot snapshot = await users.doc(userId).get();
    print(snapshot);
    userName = snapshot['username'] ?? "";
    userMailId = snapshot['email'] ?? "";
    notifyListeners();
  }
}

