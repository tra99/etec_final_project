import 'dart:io';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:etec_final/src/screens/document.dart';
import 'package:etec_final/src/screens/productscreen.dart';
import 'package:etec_final/src/screens/repairscreen.dart';
import 'package:etec_final/src/screens/sellpro.dart';
import 'package:etec_final/src/screens/teachscreen.dart';
import 'package:etec_final/src/screens/teachscreenm.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List imageList = [
    {"id": 1, "image_path": 'assets/slider1.jpg'},
    {"id": 2, "image_path": 'assets/slider2.jpg'},
    {"id": 3, "image_path": 'assets/slider3.jpg'},
    {"id": 4, "image_path": 'assets/slider4.jpg'}
  ];
  List text1=['SUZUKI','BMW','DUCATI','YAHAMA','YAHAMA','YAHAMA','YAHAMA',];
  List text2=[
    'Repair',
    'Teaching',
    'Accessories',
    'Sell product',
  ];
  List text3=[
    'As an introduction to a multi-part \n series on How To Service your own \n Motorcycle',
    'As an introduction to a multi-part \n series on How To Service your own \n Motorcycle',
    'As an introduction to a multi-part \n series on How To Service your own \n Motorcycle',
    'As an introduction to a multi-part \n series on How To Service your own \n Motorcycle',
  ];
  List<String> logomodel = [
    "assets/suzuki.png",
    "assets/bmw.jpg",
    "assets/ducati.jpg",
    "assets/yamaha1.png",
    "assets/bmw.jpg",
    "assets/bmw.jpg",
    "assets/bmw.jpg",
  ];
  final CarouselController carouselController = CarouselController();
  int currentIndex = 0;
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: ()async {
        final value=await showDialog(context: context, builder: (context){
          return AlertDialog(
            title: const Text('Alert'),
            backgroundColor: Colors.pink.shade300,
            content: const Text('Do you want to Exit?'),
            actions: [
              ElevatedButton(onPressed: ()=>Navigator.of(context).pop(false), 
              child: const Text('No')
              ),
              ElevatedButton(onPressed: ()=>Navigator.of(context).pop(true), 
              child: const Text('Exit'),)
            ],
          );
        });
        if(value != null){
          return Future.value(value);
        }return Future.value(false);
      },
      child: Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 217, 217, 217),
        title: Image.asset(
          "assets/logo3.png",
          width: 140,
        ),
        centerTitle: false,
        automaticallyImplyLeading: false,
        actions: [
          GestureDetector(
              onTap: () {
                // code here
              },
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  width: 40,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.white, width: 3.0),
                    shape: BoxShape.circle,
                    image: const DecorationImage(
                      image: AssetImage('assets/vannda.jpg'),
                    ),
                  ),
                ),
              ))
        ],
      ),
      body: Column(
        children: [
          Expanded(
            flex: 4,
            child: Column(
              children: [
                InkWell(
                  onTap: () {
                    print(currentIndex);
                  },
                  // slider picture with stack text 
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: CarouselSlider(
                      items: imageList.map((item){
                        return Builder(builder: (BuildContext context) {
                          return Stack(
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(10),
                                child: Image.asset(
                                  item['image_path'],
                                  fit: BoxFit.cover,
                                  width: double.infinity,
                                ),
                              ),
                              Positioned(
                                bottom: 90,
                                left: 40,
                                child: Text(
                                text2[item['id']-1],
                                style: const TextStyle(
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                  overflow: TextOverflow.ellipsis,
                                  
                                ),
                              )
                              ),
                              Positioned(
                                bottom: 10,
                                left: 20,
                                child: Text(
                                text3[item['id']-1],
                                maxLines: 3,
                                softWrap: true,
                                style: const TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.blueAccent
                                ),
                              )
                              )
                            ],
                          );
                        });
                      })
                          .toList(),
                      carouselController: carouselController,
                      options: CarouselOptions(
                        scrollPhysics: const BouncingScrollPhysics(),
                        autoPlay: true,
                        aspectRatio: 2.2,
                        viewportFraction: 1,
                        onPageChanged: (index, reason) {
                          setState(() {
                            currentIndex = index;
                          });
                        },
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: imageList.asMap().entries.map((entry) {
                    return GestureDetector(
                      onTap: () =>
                          carouselController.animateToPage(entry.key),
                      child: Container(
                        width: currentIndex == entry.key ? 7 : 7,
                        height: 7.0,
                        margin: const EdgeInsets.symmetric(
                          horizontal: 3.0,
                        ),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: currentIndex == entry.key
                                ? const Color.fromARGB(255, 35, 31, 32)
                                : Colors.grey.shade500),
                      ),
                    );
                  }).toList(),
                ),
              ],
            ),
          ),
          // create one variable in object, set boolean it true or not if true show it
          Expanded(
            flex: 5,
            child: Padding(
              padding: const EdgeInsets.only(left: 15, right: 15, top: 4),
              child: GridView.count(
                childAspectRatio: 12 / 8,
                crossAxisSpacing: 2,
                crossAxisCount: 2,
                mainAxisSpacing: 4,
                children: List.generate(ch.length, (index) {
                  return GestureDetector(
                    onTap: () {
                      if (index == 0) {
                        showDialog<String>(
                          context: context,
                          builder: (BuildContext context) => AlertDialog(
                            backgroundColor: Colors.grey.shade100,
                            title: const Text('Video learning'),
                            content: Padding(
                              padding: const EdgeInsets.only(bottom: 16),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  InkWell(
                                    onTap: () {
                                      Get.to(const TeachPage());
                                    },
                                    child: Image.asset('icons/video-conference.png', width: 70),
                                  ),
                                  const SizedBox(width: 32),
                                  InkWell(
                                    onTap: () {
                                      Get.to(const DocumentScreen());
                                    },
                                    child: Image.asset('icons/file.png', width: 70),
                                  ),
                                ],
                              ),
                            ),
                            actions: <Widget>[
                              TextButton(
                                onPressed: () => Navigator.pop(context, 'Cancel'),
                                child: Text('Cancel',style: TextStyle(color: Colors.blue.shade600),),
                              ),
                              TextButton(
                                onPressed: () => Navigator.pop(context, 'OK'),
                                child: Text('OK',style: TextStyle(color: Colors.blue.shade600),),
                              ),
                            ],
                          ),
                        );
                      } else if (index == 1) {
                        Navigator.push(context, MaterialPageRoute(builder: (context) =>  const RepairScreen()));
                      } else if (index == 2) {
                        Navigator.push(context, MaterialPageRoute(builder: (context) =>  ProductScreen()));
                      } else if (index == 3) {
                        Navigator.push(context, MaterialPageRoute(builder: (context) =>  SellMotor()));
                      }
                    },
                    child: SelectCard(
                      key: ValueKey(index),
                      ch: ch[index],
                    ),
                  );
                }),

              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: logomodel.length,
                itemBuilder: (context, index) => SizedBox(
                      height: 150,
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              width: 70,
                              height: 70,
                              decoration: BoxDecoration(
                                border: Border.all(
                                    width: 3.0,
                                    color: const Color(0xFF706F6F)),
                                image: DecorationImage(
                                  image: AssetImage(logomodel[index]),
                                ),
                                shape: BoxShape.circle,
                                // boxShadow: [
                                //   BoxShadow(
                                //     color: Color(0xFF706F6F),
                                //     offset: const Offset(
                                //       1.0,
                                //       1.0,
                                //     ),
                                //     blurRadius: 10.0,
                                //     spreadRadius: 2.0,
                                //   ), //BoxShadow
                                //   BoxShadow(
                                //     color: Colors.white,
                                //     offset: const Offset(0.0, 0.0),
                                //     blurRadius: 0.0,
                                //     spreadRadius: 0.0,
                                //   ), //BoxShadow
                                // ],
                              ),
                            ),
                          ),
                          // call text from list text1 for list
                          Container(
                            child: Center(
                              child: Text(text1[index]),
                            ),
                          )
                        ],
                      ),
                    )),
          )
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: const Color(0xFF423535),
        unselectedItemColor: Colors.grey,
        showUnselectedLabels: true,
        type: BottomNavigationBarType.fixed,
        currentIndex: _currentIndex,
        items: [
          const BottomNavigationBarItem(
              icon: Icon(
                Icons.home,
                size: 36,
              ),
              label: "Home"),
          BottomNavigationBarItem(
              icon: InkWell(onTap: () {
                // Get.to( ProductScreen());
              },child: const Icon(Icons.shopify_rounded, size: 36)), label: "Product"),
          const BottomNavigationBarItem(
              icon: Icon(Icons.person, size: 36), label: "Profile"),
          const BottomNavigationBarItem(
              icon: Icon(Icons.notifications, size: 36), label: "Messages"),
          const BottomNavigationBarItem(
              icon: Icon(Icons.menu_outlined, size: 36), label: "Menu"),
        ],
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
    )
  );
    
  }
}

class choices {
  const choices({required this.name, required this.image});
  final String name;
  final ImageProvider image;
}
List<choices> ch = const <choices>[
  choices(name: 'Teaching', image: AssetImage('assets/teaching.png')),
  choices(name: 'Repair', image: AssetImage('assets/repair.png')),
  choices(name: 'Product', image: AssetImage('assets/product.png')),
  choices(name: 'Sell Motorbike', image: AssetImage('assets/sell_motor.png')),
];

class SelectCard extends StatelessWidget {
  const SelectCard({required Key? key, required this.ch}) : super(key: key);
  final choices ch;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.grey.shade300,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image(image: ch.image, width: 100),
            Text(
              ch.name,
              style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 14),
            ),
          ],
        ),
      ),
    );
  }
}
