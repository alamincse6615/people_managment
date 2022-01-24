import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  FirebaseAuth auth = FirebaseAuth.instance;
  late DatabaseReference _databaseReference;

  @override
  void initState() {
    _databaseReference = FirebaseDatabase.instance.ref();
  }

  @override
  Widget build(BuildContext context) {
    final refquery = _databaseReference.child("PeopleInfo");
    return Scaffold(
      body:FirebaseAnimatedList(
        query: refquery,
        itemBuilder: (context,snapshot,animation,index){
          return Column(
            children: [
              Text(
                snapshot.child("name").value.toString(),
                style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),
              ),
              Text(
                snapshot.child("email").value.toString(),
                style: TextStyle(fontSize: 20,fontWeight: FontWeight.normal),
              ),
              Text(
                snapshot.child("phn").value.toString(),
                style: TextStyle(fontSize: 20,fontWeight: FontWeight.normal,color: Colors.green),
              ),
              Text(
                snapshot.child("address").value.toString(),
                style: TextStyle(fontSize: 20,fontStyle: FontStyle.italic,color: Colors.blue),
              ),
              Divider(height: 5,color: Colors.red,)
            ],
          );
        },

      ),
    );
  }
}
