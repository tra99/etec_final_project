import 'package:flutter/material.dart';

class IntroScreen3 extends StatefulWidget {
  const IntroScreen3({Key? key}) : super(key: key);

  @override
  State<IntroScreen3> createState() => _IntroScreen3State();
}

class _IntroScreen3State extends State<IntroScreen3> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.only(left: 20,top: 20),
              child: const Align(
                alignment: Alignment.topLeft,
                child: Text(
                  'Accessories',
                  style: TextStyle(fontSize: 36, fontWeight: FontWeight.w400),
                ),
              ),
            ),
            const SizedBox(height: 50),
            imageCenter(),
            const SizedBox(height: 60),
            Expanded(
              child: Stack(
                children: [
                  Positioned.fill(child: stackBox()),
                  const Align(
                    alignment: Alignment.center,
                    child: SingleChildScrollView( // Wrap with SingleChildScrollView
                      padding: EdgeInsets.symmetric(horizontal: 50),
                      child: Column(
                        children: [
                          Center(
                            child: Text(
                              'As an introduction to a multi-part series on How To Service your own Motorcycle',
                              style: TextStyle(color: Colors.white, fontSize: 20),
                              textAlign: TextAlign.center,
                            ),
                          ),
                          SizedBox(height: 60,),
                          // Row(
                          //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          //   children: [
                          //     TextButton(onPressed: (){Get.to(const IntroScreen4());}, child: const Text('SKIP',style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white),)),
                          //     TextButton(onPressed: (){Get.to(const IntroScreen4());}, child: const Text('NEXT',style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white))),
                          //   ],
                            
                          // ),
                          // const SizedBox(
                          //   height: 20,
                          // ),
                          // loading()
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Center imageCenter() {
    return Center(child: Image.asset('assets/intro3.png',width: 130,));
  }

  Container stackBox() {
    return Container(
      decoration: const BoxDecoration(
        color: Color.fromARGB(255, 35, 31, 32),
        borderRadius: BorderRadius.only(topLeft: Radius.circular(40), topRight: Radius.circular(40)),
      ),
    );
  }
  Row loading(){
    return const Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: EdgeInsets.only(right: 10),
          child: SizedBox(
            width: 16,
            height: 16,
            child: DecoratedBox(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Color.fromARGB(255, 217, 217, 217),
              )
              ),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(right: 10),
          child: SizedBox(
            width: 16,
            height: 16,
            child: DecoratedBox(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Color.fromARGB(255, 217, 217, 217),
              )
              ),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(right: 10),
          child: SizedBox(
            width: 16,
            height: 16,
            child: DecoratedBox(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Color.fromARGB(255, 94, 58, 53),
              )
              ),
          ),
        ),
        SizedBox(
          width: 16,
          height: 16,
          child: DecoratedBox(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Color.fromARGB(255, 217, 217, 217),
            )
            ),
        )
      ],
    );
}
}