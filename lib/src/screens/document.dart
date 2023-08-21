import 'package:flutter/material.dart';

class DocumentScreen extends StatefulWidget {
  const DocumentScreen({super.key});

  @override
  State<DocumentScreen> createState() => _DocumentScreenState();
}

class _DocumentScreenState extends State<DocumentScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 217, 217, 217),
        title: const Text('All Document'),
        actions: [
          Row(
            children: [
              IconButton(onPressed: (){}, icon: const Icon(Icons.search)),
              IconButton(onPressed: (){}, icon: const Icon(Icons.filter_list_alt)),
            ],
          )
        ],
      ),
      body:  ListView(
        children: <Widget>[
          Container(
            margin: const EdgeInsets.only(top: 4),
            height: 80,
            child: Card(
              child: ListTile(
                leading: Container(margin: const EdgeInsets.only(top: 2),child: const Image(image: AssetImage('icons/pdf.png'))),
                title: const Text('Policy Document Read Me.pdf',style: TextStyle(fontWeight: FontWeight.w500),),
                subtitle: Text('4.3 MB Apr 06,2023,8:23 pm',style: TextStyle(color: Colors.grey.shade500),),
                trailing: Container(margin: const EdgeInsets.only(top: 2),child: const Icon(Icons.more_vert)),
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 2),
            height: 80,
            child: Card(
              child: ListTile(
                leading: Container(margin: const EdgeInsets.only(top: 2),child: const Image(image: AssetImage('icons/docs.png'))),
                title: const Text('Policy Document Read Me.pdf',style: TextStyle(fontWeight: FontWeight.w500),),
                subtitle: Text('4.3 MB Apr 06,2023,8:23 pm',style: TextStyle(color: Colors.grey.shade500),),
                trailing: Container(margin: const EdgeInsets.only(top: 2),child: const Icon(Icons.more_vert)),
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 2),
            height: 80,
            child: Card(
              child: ListTile(
                leading: Container(margin: const EdgeInsets.only(top: 2),child: const Image(image: AssetImage('icons/pdf.png'))),
                title: const Text('Policy Document Read Me.pdf',style: TextStyle(fontWeight: FontWeight.w500),),
                subtitle: Text('4.3 MB Apr 06,2023,8:23 pm',style: TextStyle(color: Colors.grey.shade500),),
                trailing: Container(margin: const EdgeInsets.only(top: 2),child: const Icon(Icons.more_vert)),
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 2),
            height: 80,
            child: Card(
              child: ListTile(
                leading: Container(margin: const EdgeInsets.only(top: 2),child: const Image(image: AssetImage('icons/pdf.png'))),
                title: const Text('Policy Document Read Me.pdf',style: TextStyle(fontWeight: FontWeight.w500),),
                subtitle: Text('4.3 MB Apr 06,2023,8:23 pm',style: TextStyle(color: Colors.grey.shade500),),
                trailing: Container(margin: const EdgeInsets.only(top: 2),child: const Icon(Icons.more_vert)),
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 2),
            height: 80,
            child: Card(
              child: ListTile(
                leading: Container(margin: const EdgeInsets.only(top: 2),child: const Image(image: AssetImage('icons/docs.png'))),
                title: const Text('Policy Document Read Me.pdf',style: TextStyle(fontWeight: FontWeight.w500),),
                subtitle: Text('4.3 MB Apr 06,2023,8:23 pm',style: TextStyle(color: Colors.grey.shade500),),
                trailing: Container(margin: const EdgeInsets.only(top: 2),child: const Icon(Icons.more_vert)),
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 2),
            height: 80,
            child: Card(
              child: ListTile(
                leading: Container(margin: const EdgeInsets.only(top: 2),child: const Image(image: AssetImage('icons/pdf.png'))),
                title: const Text('Policy Document Read Me.pdf',style: TextStyle(fontWeight: FontWeight.w500),),
                subtitle: Text('4.3 MB Apr 06,2023,8:23 pm',style: TextStyle(color: Colors.grey.shade500),),
                trailing: Container(margin: const EdgeInsets.only(top: 2),child: const Icon(Icons.more_vert)),
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 2),
            height: 80,
            child: Card(
              child: ListTile(
                leading: Container(margin: const EdgeInsets.only(top: 2),child: const Image(image: AssetImage('icons/docs.png'))),
                title: const Text('Policy Document Read Me.pdf',style: TextStyle(fontWeight: FontWeight.w500),),
                subtitle: Text('4.3 MB Apr 06,2023,8:23 pm',style: TextStyle(color: Colors.grey.shade500),),
                trailing: Container(margin: const EdgeInsets.only(top: 2),child: const Icon(Icons.more_vert)),
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 2),
            height: 80,
            child: Card(
              child: ListTile(
                leading: Container(margin: const EdgeInsets.only(top: 2),child: const Image(image: AssetImage('icons/pdf.png'))),
                title: const Text('Policy Document Read Me.pdf',style: TextStyle(fontWeight: FontWeight.w500),),
                subtitle: Text('4.3 MB Apr 06,2023,8:23 pm',style: TextStyle(color: Colors.grey.shade500),),
                trailing: Container(margin: const EdgeInsets.only(top: 2),child: const Icon(Icons.more_vert)),
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 2),
            height: 80,
            child: Card(
              child: ListTile(
                leading: Container(margin: const EdgeInsets.only(top: 2),child: const Image(image: AssetImage('icons/docs.png'))),
                title: const Text('Policy Document Read Me.pdf',style: TextStyle(fontWeight: FontWeight.w500),),
                subtitle: Text('4.3 MB Apr 06,2023,8:23 pm',style: TextStyle(color: Colors.grey.shade500),),
                trailing: Container(margin: const EdgeInsets.only(top: 2),child: const Icon(Icons.more_vert)),
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 2),
            height: 80,
            child: Card(
              child: ListTile(
                leading: Container(margin: const EdgeInsets.only(top: 2),child: const Image(image: AssetImage('icons/pdf.png'))),
                title: const Text('Policy Document Read Me.pdf',style: TextStyle(fontWeight: FontWeight.w500),),
                subtitle: Text('4.3 MB Apr 06,2023,8:23 pm',style: TextStyle(color: Colors.grey.shade500),),
                trailing: Container(margin: const EdgeInsets.only(top: 2),child: const Icon(Icons.more_vert)),
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 2),
            height: 80,
            child: Card(
              child: ListTile(
                leading: Container(margin: const EdgeInsets.only(top: 2),child: const Image(image: AssetImage('icons/pdf.png'))),
                title: const Text('Policy Document Read Me.pdf',style: TextStyle(fontWeight: FontWeight.w500),),
                subtitle: Text('4.3 MB Apr 06,2023,8:23 pm',style: TextStyle(color: Colors.grey.shade500),),
                trailing: Container(margin: const EdgeInsets.only(top: 2),child: const Icon(Icons.more_vert)),
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 2),
            height: 80,
            child: Padding(
              padding: const EdgeInsets.only(bottom: 6),
              child: Card(
                child: ListTile(
                  leading: Container(margin: const EdgeInsets.only(top: 2),child: const Image(image: AssetImage('icons/docs.png'))),
                  title: const Text('Policy Document Read Me.pdf',style: TextStyle(fontWeight: FontWeight.w500),),
                  subtitle: Text('4.3 MB Apr 06,2023,8:23 pm',style: TextStyle(color: Colors.grey.shade500),),
                  trailing: Container(margin: const EdgeInsets.only(top: 2),child: const Icon(Icons.more_vert)),
                ),
              ),
            ),
          ),
          
        
        ],
      ),
    );
  }
}