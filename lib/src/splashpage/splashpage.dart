// ignore_for_file: library_private_types_in_public_api

import 'dart:async';
import 'package:etec_final/src/into_sreen/intro1.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState(){
    super.initState();

    Timer(
      const Duration(seconds: 3),(){
        Navigator.push(context, MaterialPageRoute(builder: (context)=>const IntroPage()));
      }
      
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            const Image(image: AssetImage('assets/logo01.png'), width: 300),
            GestureDetector(
              child: const Text.rich(
                TextSpan(
                  text: 'CAMMOTO ',
                  style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                  children: <InlineSpan>[
                    TextSpan(text: 'always be with you', style: TextStyle(fontSize: 20))
                  ],
                ),
              ),
            ),
            const Text('Confidence Trusting Responsibility Morality', textAlign: TextAlign.center),
            const SizedBox(height: 20,),
            Image.asset('assets/motor1.png', width: 220),
            const SizedBox(height: 16,),
            Center(
              child: SpinKitThreeBounce(
                size: 50.0,
                itemBuilder: (BuildContext context,int index){
                  return DecoratedBox(decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: index.isEven?Colors.purple.shade800:Colors.purple.shade600
                  ));
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
