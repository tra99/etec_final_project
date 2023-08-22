import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:etec_final/src/screens/homepage.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => HomePage()));
          },
          icon: Icon(Icons.arrow_back),
          color: Colors.blue.shade500,
        ),
        title: Text(
          'My Profile',
          style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w600,
              color: Colors.blue.shade500),
        ),
        centerTitle: true,
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance.collection('users').snapshots(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData) {
            return Center(child: Text('No data available'));
          }

          List<Widget> userCards = snapshot.data!.docs.map((doc) {
            Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
            String name = data['displayName'];
            String image = data['profileImage'];
            String email = data['email'];
            String number = data['phoneNumber'];
            String nickname = data['Nickname'];
            int app_id = data['id'];

            return Column(
              children: [
                SizedBox(
                  height: 16,
                ),
                Center(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(50),
                    child: Image.network(
                      image,
                      width: 100,
                    ),
                  ),
                ),
                SizedBox(
                  height: 32,
                ),
                Card(
                  child: ListTile(
                    leading: Icon(
                      Icons.person,
                      color: Colors.blue.shade600,
                      size: 32,
                    ),
                    title: Text('Username:\t\t ${name}',
                        style: TextStyle(fontWeight: FontWeight.w500)),
                  ),
                ),
                Card(
                  child: ListTile(
                    leading: Icon(
                      Icons.person,
                      color: Colors.blue.shade600,
                      size: 32,
                    ),
                    title: Text('Nickname:\t\t ${nickname}',
                        style: TextStyle(fontWeight: FontWeight.w500)),
                  ),
                ),
                SizedBox(
                  height: 6,
                ),
                Card(
                  child: ListTile(
                    leading: Icon(
                      Icons.email_outlined,
                      color: Colors.blue.shade600,
                      size: 32,
                    ),
                    title: Text('Email:\t\t ${email}',
                        style: TextStyle(fontWeight: FontWeight.w500)),
                  ),
                ),
                SizedBox(
                  height: 6,
                ),
                Card(
                  child: ListTile(
                    leading: Icon(
                      Icons.phone,
                      color: Colors.blue.shade600,
                      size: 32,
                    ),
                    title: Text('Telephone:\t\t ${number}',
                        style: TextStyle(fontWeight: FontWeight.w500)),
                  ),
                ),
                SizedBox(
                  height: 6,
                ),
                Card(
                  child: ListTile(
                    leading: Icon(
                      Icons.app_registration_outlined,
                      color: Colors.blue.shade600,
                      size: 32,
                    ),
                    title: Text('App ID:\t\t ${app_id}',
                        style: TextStyle(fontWeight: FontWeight.w500)),
                  ),
                ),
                SizedBox(
                  height: 6,
                ),
                
              ],
            );
          }).toList();

          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListView(
              children: userCards,
            ),
          );
        },
      ),
    );
  }
}
