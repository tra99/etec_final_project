// import 'package:flutter/material.dart';

// class TeachScreen extends StatefulWidget {
//   const TeachScreen({super.key});

//   @override
//   State<TeachScreen> createState() => _TeachScreenState();
// }

// class _TeachScreenState extends State<TeachScreen> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//           backgroundColor: Color.fromARGB(255, 217, 217, 217),
//           centerTitle: true,
//           title: Image.asset(
//             'assets/logo3.png',
//             width: 200,
//           ),
//           actions: [
//             GestureDetector(
//                 onTap: () {
//                   // code here
//                 },
//                 child: Padding(
//                   padding: const EdgeInsets.all(6.0),
//                   child: Container(
//                     width: 50,
//                     decoration: BoxDecoration(
//                       border: Border.all(color: Colors.white, width: 3.0),
//                       shape: BoxShape.circle,
//                       image: DecorationImage(
//                         image: AssetImage('assets/profile.jpg'),
//                       ),
//                     ),
//                   ),
//                 ))
//           ]),
//       body: SingleChildScrollView(
//         child: Container(
//           child: Container(
//             decoration: BoxDecoration(
//               boxShadow: [
//                 BoxShadow(
//                   color: Colors.grey.withOpacity(0.3),
//                   spreadRadius: 5,
//                   blurRadius: 5,
//                   offset: Offset(0, 3)
//                 )
//               ]
//             ),
//             child: ClipRRect(
//               borderRadius: BorderRadius.only(bottomLeft: Radius.circular(20.0),bottomRight: Radius.circular(20.0)),
//               child: Column(
//                 children: [
//                   Image(
//                     image: AssetImage('assets/cover3.png'),
//                     height: 120,
//                     width: double.infinity,
//                     fit: BoxFit.cover, 
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
