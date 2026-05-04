import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AuthService {
  final FirebaseAuth auth = FirebaseAuth.instance;
  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  Future<void> register(String name, String email, String password) async {
    if (name.isEmpty || email.isEmpty || password.isEmpty) {
      throw Exception('Please fill all fields');
    }

    final credential = await auth.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );

    await credential.user?.updateDisplayName(name);

    await firestore.collection('users').doc(credential.user!.uid).set({
      'uid': credential.user!.uid,
      'name': name,
      'email': email,
      'createdAt': FieldValue.serverTimestamp(),
    });
  }

  Future<void> login(String email, String password) async {
    if (email.isEmpty || password.isEmpty) {
      throw Exception('Please fill all fields');
    }

    await auth.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
  }
}
