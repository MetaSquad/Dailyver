// ignore_for_file: import_of_legacy_library_into_null_safe

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dailyver/utils/constants.dart';
import 'package:firebase_auth/firebase_auth.dart';

class ClientRepository {
  final _authinstance = FirebaseAuth.instance;
  final _clientDB =
      FirebaseFirestore.instance.collection(Constants.client_reference);

  Future<QuerySnapshot> getAllClient() {
    return _clientDB.get();
  }

  Future<QuerySnapshot> getClientFromEmail(String email) {
    return _clientDB.where('email', isEqualTo: email).get();
  }

  Future<DocumentReference> addClient(Map<String, dynamic> client) {
    return _clientDB.add(client);
  }

  Future<UserCredential> connectClient(String email, String password) {
    return _authinstance.signInWithEmailAndPassword(
        email: email, password: password);
  }

  Future<UserCredential> registerClient(String email, String password) {
    return _authinstance.createUserWithEmailAndPassword(
        email: email, password: password);
  }

  Future<void> signOutClient() {
    return _authinstance.signOut();
  }
}
