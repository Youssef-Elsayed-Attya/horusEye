import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

abstract class FirebaseServices {
  Future<List<Map<String, dynamic>>> getCollection(String collectionName);

  Future<void> addToCollection(
      String collectionName, String doc, Map<String, dynamic> data);

  Future<Map<String, dynamic>?> getDocument(
      String collectionName, String docName);
}

class FirebaseAuthService {
  FirebaseAuth _auth = FirebaseAuth.instance;

  Future<User?> signUpWithEmailAndPassword(
      String email, String password, String name) async {
    try {
      UserCredential credential =await _auth.createUserWithEmailAndPassword(email: email, password: password);
      credential.user!.updateDisplayName(name);
      return credential.user;
    } 
    catch (e) {print('error when sign up');}
    return null;
  }

  Future<User?> signInWithEmailAndPassword(
      String email, String password) async {
    try {
      UserCredential credential =await _auth.signInWithEmailAndPassword(email: email, password: password);
      return credential.user;
    }
    catch (e) {print('error when sign in');}
    return null;
  }


}
