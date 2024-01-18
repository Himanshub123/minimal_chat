import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:minal_chat_app/models/message.dart';

class ChatService {
  //get instance of firestore
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  // get user stream
  Stream<List<Map<String, dynamic>>> getUserStream() {
    return _firestore.collection("Users").snapshots().map((snapshot) {
      return snapshot.docs.map((e) {
        final user = e.data();
        return user;
      }).toList();
    });
  }

  //send message
  Future<void> sendMessage(String receiverId, message) async {
    final String currentUserId = _firebaseAuth.currentUser!.uid;
    final String currentUserEmail = _firebaseAuth.currentUser!.email.toString();
    final Timestamp timestamp = Timestamp.now();

    //create a new message
    Message newMessage = Message(
        senderId: currentUserId,
        senderEmail: currentUserEmail,
        receiverId: receiverId,
        message: message,
        timestamp: timestamp);
    // cpnstruct chat roomId for the two users (sorted to ensue uniwness)
    List<String> ids = [currentUserId, receiverId];
    ids.sort();
    String chatRoomId = ids.join('_');
    // add new message to database
    await _firestore
        .collection('chat_rooms')
        .doc(chatRoomId)
        .collection('message')
        .add(newMessage.toMap());

    //get message
    // Stream<QuerySnapshot> getMessage(String userId, otherUserId) {
    //   List<String> ids = [userId, otherUserId];
    //   ids.sort();
    // }
  }
}
