import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:people_management/dashboard.dart';

class AddPeople extends StatefulWidget {
  const AddPeople({Key? key}) : super(key: key);

  @override
  _AddPeopleState createState() => _AddPeopleState();
}
class _AddPeopleState extends State<AddPeople> {
  final nameCtrl = TextEditingController();
  final emailCtrl = TextEditingController();
  final phnCtrl = TextEditingController();
  final addressCtrl = TextEditingController();
  late DatabaseReference _databaseReference;

  FirebaseAuth auth = FirebaseAuth.instance;


  @override
  void initState() {
    _databaseReference = FirebaseDatabase.instance.reference();
  }

  @override
  void dispose() {
    nameCtrl.dispose();
    emailCtrl.dispose();
    phnCtrl.dispose();
    addressCtrl.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add New People"),
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: nameCtrl,
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
              controller: emailCtrl,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: phnCtrl,
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

                  hintText: "People address"
              ),
              controller:addressCtrl,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton(
              onPressed: (){
                saveDataToDatabase(nameCtrl.text, emailCtrl.text, phnCtrl.text, addressCtrl.text);
              },
              child: Text("Save"),
            )
          ),
        ],
      ),
    );
  }
  saveDataToDatabase(String name, String email, String phn, String address){

    Map<dynamic,dynamic> peopleInfo = {
      "name":name,
      "email":email,
      "phn":phn,
      "address":address,
      "infoauthor":auth.currentUser!.uid,
    };
    _databaseReference.child("PeopleInfo").push().set(peopleInfo);

    /*Navigator.push(context, MaterialPageRoute(builder: (context)=>Dashboard()));*/

  }



}
