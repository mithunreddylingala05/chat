import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class ChatService {
  final FirebaseFirestore firestore = FirebaseFirestore.instance;
  final FirebaseAuth auth = FirebaseAuth.instance;

  Future<void> sendMessage(String message) async {
    final user = auth.currentUser;
    if (user == null) return;

    await firestore.collection('messages').add({
      'message': message,
      'senderId': user.uid,
      'senderEmail': user.email,
      'timestamp': FieldValue.serverTimestamp(),
    });
  }

  Stream<QuerySnapshot> getMessages() {
    return firestore
        .collection('messages')
        .orderBy('timestamp', descending: true)
        .snapshots();
  }
}
