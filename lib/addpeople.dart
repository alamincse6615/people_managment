import 'package:flutter/material.dart';
import 'package:people_management/dashboard.dart';

class AddPeople extends StatefulWidget {
  const AddPeople({Key? key}) : super(key: key);

  @override
  _AddPeopleState createState() => _AddPeopleState();
}
class _AddPeopleState extends State<AddPeople> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add New People"),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: "People Name"
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: "People email"
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: "People phone"
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: "People email"
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: "People address"
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton(
              onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>Dashboard()));
              },
              child: Text("Save"),
            )
          ),
        ],
      ),
    );
  }
}
