import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class UserProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('User Profile'),
      ),
      body: StreamBuilder(
        stream: FirebaseFirestore.instance
            .collection('UserProfileScreen')
            .doc(FirebaseAuth.instance.currentUser!.uid)
            .snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          var userData = snapshot.data;
          return Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: 50,
                backgroundImage: NetworkImage(userData?['profileImage']),
              ),
              SizedBox(height: 20),
              Text(
                userData?['displayName'],
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              Text(
                userData?['email'],
                style: TextStyle(fontSize: 18, color: Colors.grey),
              ),
            ],
          );
        },
      ),
    );
  }
}
Future<void> createUserInFirestore(User user) async {
  await FirebaseFirestore.instance.collection('users').doc(user.uid).set({
    'displayName': user.displayName,
    'email': user.email,
    'profileImage': user.photoURL,
  });
}

