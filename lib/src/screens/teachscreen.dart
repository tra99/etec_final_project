import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:etec_final/src/screens/homepage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TeachPage extends StatefulWidget {
  const TeachPage({super.key});

  @override
  State<TeachPage> createState() => _TeachPageState();
}

class _TeachPageState extends State<TeachPage> {
  int cardItem = 0;
  List<Map<String, dynamic>> selectedItems = [];
  @override                                                                                                                                                                                                                                       
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 217, 217, 217),
        title: Image.asset(
          "assets/logo3.png",
          width: 140,
        ),
        centerTitle: true,
        automaticallyImplyLeading: false,
        leading: IconButton(onPressed: (){
          Get.to(HomePage());
        }, icon: Icon(Icons.arrow_back)),
      ),
      body: Column(
        children: [
          Image.asset('assets/teaching1.png'),      
        ],
      ),
    );
  }
}