import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutterfirebase/screens/chat.dart';

final firebaseAuthInstance = FirebaseAuth.instance;
final firebaseStorageInstance = FirebaseStorage.instance;
final firebaseFireStore = FirebaseFirestore.instance;

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Messages"), actions: [
        IconButton(
            onPressed: () {
              firebaseAuthInstance.signOut();
            },
            icon: const Icon(Icons.logout))
      ]),
      body: StreamBuilder(
        stream: FirebaseFirestore.instance.collection("users").snapshots(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return const Text("Bir hata oluştu");
          }
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          return ListView(
            children:
                snapshot.data!.docs.map<Widget>((e) => userItem(e)).toList(),
          );
        },
      ),
    );
  }

  Widget userItem(DocumentSnapshot document) {
    Map<String, dynamic> data = document.data()! as Map<String, dynamic>;
    if (firebaseAuthInstance.currentUser!.email != data["email"]) {
      return ListTile(
        title: Container(
          margin: const EdgeInsets.only(top: 10),
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
          decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(25)),
              boxShadow: [
                BoxShadow(
                    color: Colors.grey,
                    blurRadius: 10,
                    spreadRadius: 2,
                    offset: Offset(0, 2))
              ]),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 30,
                child: Row(
                  children: [
                    const ClipRRect(
                      child: Icon(
                        Icons.person,
                        size: 40,
                      ),
                    ),
                    const SizedBox(width: 10),
                    Text(data["email"]),
                  ],
                ),
              ),
            ],
          ),
        ),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => Chat(
                receiverEmail: data["email"],
                receiverUid: data["uid"],
              ),
            ),
          );
        },
      );
    } else {
      return Container();
    }
  }
}
