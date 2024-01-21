import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutterfirebase/model/message.dart';

final firebaseAuthInstance = FirebaseAuth.instance;
final firebaseFireStore = FirebaseFirestore.instance;

class Chat extends StatefulWidget {
  final String receiverEmail;
  final String receiverUid;

  const Chat(
      {super.key, required this.receiverEmail, required this.receiverUid});

  @override
  State<Chat> createState() => _ChatState();
}

class _ChatState extends State<Chat> {
  @override
  Widget build(BuildContext context) {
    TextEditingController _controller = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.receiverEmail),
      ),
      body: Column(
        children: [
          Expanded(
            child: StreamBuilder(
              stream: getMessages(
                  widget.receiverUid, firebaseAuthInstance.currentUser!.uid),
              builder: (context, snapshot) {
                if (snapshot.hasError) {
                  return const Text("Bir hata oluştu");
                }
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                }
                return ListView(
                  children: snapshot.data!.docs
                      .map<Widget>((e) => addMessage(e))
                      .toList(),
                );
              },
            ),
          ),
          TextField(
            controller: _controller,
            autocorrect: false,
            decoration: const InputDecoration(
              labelText: 'Mesaj Giriniz..',
            ),
          ),
          GestureDetector(
            child: const Icon(
              Icons.send,
            ),
            onTap: () async {
              if (_controller.text.isNotEmpty) {
                final String currentUserId =
                    firebaseAuthInstance.currentUser!.uid;
                final String currentUserEmail =
                    firebaseAuthInstance.currentUser!.email.toString();
                final DateTime date = DateTime.now();
                Message newMessage = Message(
                    senderId: currentUserId,
                    senderEmail: currentUserEmail,
                    receiverId: widget.receiverUid,
                    message: _controller.text,
                    date: date);
                List<String> id = [currentUserId, widget.receiverUid];
                id.sort();
                String chatId = id.join("_");
                await firebaseFireStore
                    .collection("chats")
                    .doc(chatId)
                    .collection("messages")
                    .add(newMessage.toMap());
              }
              _controller.clear();
            },
          ),
          const SizedBox(height: 50),
        ],
      ),
    );
  }

  Widget addMessage(DocumentSnapshot document) {
    Map<String, dynamic> data = document.data()! as Map<String, dynamic>;
    var alignment = (data["senderId"] == firebaseAuthInstance.currentUser!.uid)
        ? Alignment.centerRight
        : Alignment.centerLeft;
    return Container(
      alignment: alignment,
      child:
          Column(children: [Text(data["senderEmail"]), Text(data["message"])]),
    );
  }

  Stream<QuerySnapshot> getMessages(String user1, String user2) {
    List<String> id = [user1, user2];
    id.sort();
    String chatId = id.join("_");
    return firebaseFireStore
        .collection("chats")
        .doc(chatId)
        .collection("messages")
        .orderBy("date")
        .snapshots();
  }
}
