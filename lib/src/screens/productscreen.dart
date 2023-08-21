import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class ProductScreen extends StatefulWidget {
  @override
  _ProductScreenState createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  int cardItem = 0;
  List<Map<String, dynamic>> selectedItems = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('CAMMOTOR'),
        actions: [
          IconButton(
            onPressed: () {
              openMenu(context);
            },
            icon: Badge(
              label: Text(cardItem.toString()),
              child: const Icon(
                Icons.shopping_basket_sharp,
              ),
            ),
          ),
        ],
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance.collection('product').snapshots(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const CircularProgressIndicator();
          } else if (snapshot.hasError) {
            return Text('Error: ${snapshot.error}');
          } else if (!snapshot.hasData) {
            return const Text('No data available');
          }

          List<Widget> products = [];
          snapshot.data!.docs.forEach((doc) {
            Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
            String name = data['name'];
            int price = data['price'];
            String image = data['image'];
            String currency = data['currency'];

            products.add(
              GestureDetector(
                onTap: () {
                  setState(() {
                    selectedItems.add({
                      'name': name,
                      'price': price,
                      'currency': currency,
                      'image': image,
                      'card_item':cardItem
                    });
                    // cardItem++;
                  });
                  openDialog(context, name, price, currency, image,cardItem);
                },
                child: Card(
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Image(
                          image: NetworkImage(image),
                          width: 90,
                        ),
                      ),
                      Flexible(
                        child: ListTile(
                          title: Text(name),
                          subtitle: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Text(price.toString()),
                              Text(currency),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          });

          return GridView.count(
            crossAxisCount: 2,
            children: products,
          );
        },
      ),
    );
  }

  void openMenu(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Selected Items'),
          content: SizedBox(
            width: double.maxFinite,
            child: ListView.builder(
              itemCount: selectedItems.length,
              itemBuilder: (context, index) {
                Map<String, dynamic> item = selectedItems[index];
                return ListTile(
                  title: Text(item['name']),
                  subtitle: Padding(
                    padding: const EdgeInsets.only(right: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('${item['price']} ${item['currency']}'),
                        Text("x ${cardItem.toString()}")
                      ],
                    ),
                  ),
                  leading: Image.network(item['image']),
                );
              },
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                setState(() {
                  selectedItems.clear(); // Clear selected items list
                  cardItem = 0; // Reset the cardItem counter
                });
                Navigator.pop(context);
              },
              child: Text('Clear'),
            ),
          ],
        );
      },
    );
  }

  void openDialog(BuildContext context, String name, int price, String currency, String image, int cardItem) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          content: SizedBox(
            height: 260,
            child: Card(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Image(
                      image: NetworkImage(image),
                      width: 90,
                    ),
                  ),
                  Flexible(
                    child: Column(
                      children: [
                        ListTile(
                          title: Text(name),
                          subtitle: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Text(price.toString()),
                              Text(currency),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 20,right: 20),
                          child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      IconButton(onPressed: MinimizeItem, icon: Icon(Icons.minimize)),
                                      Text(cardItem.toString()),
                                      IconButton(onPressed: AddItem, icon: Icon(Icons.add)),
                                    ],
                                  ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
                   
        );
      },
    );
  }

  void AddItem() {
    setState(() {
      cardItem++;
    });
  }

  void MinimizeItem() {
    setState(() {
      cardItem--;
    });
  }
}

