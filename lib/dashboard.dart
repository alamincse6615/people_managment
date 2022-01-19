import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:people_management/addpeople.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  _DashboardState createState() => _DashboardState();
}
class _DashboardState extends State<Dashboard> {
  FirebaseAuth auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueGrey,
        title: Text("Dashboard"),

        actions: [
          PopupMenuButton(
              itemBuilder: (context){
                return [
                  PopupMenuItem(child: Text("About Us")),
                  PopupMenuItem(child: Text("Contuct Us")),
                  PopupMenuItem(child: Text("exit")),
                ];
              },
          )
        ],

      ),
      drawer: Drawer(
        child: ListView(
          children: [
            UserAccountsDrawerHeader(
                accountName: Text('Arafat'),
                accountEmail: Text('arafatkh999@gmail.com'),
              currentAccountPicture: CircleAvatar(
                backgroundImage: AssetImage('images/profile.jpg'),
              ),
              otherAccountsPictures: [
                CircleAvatar(child: Text('Labib'),
                ),
                CircleAvatar(child: Text('Niloy'),
                ),

              ],
            ),
            ListTile(
              title: Text('Add Information'),
              leading: Icon(Icons.add),
              trailing: Icon(Icons.arrow_forward_ios_sharp),
              onTap: (){},
            ),
            ListTile(
              title: Text('Log Out'),
              leading: Icon(Icons.subdirectory_arrow_left_sharp),
              onTap: (){},
            ),
          ],
        ),

      ),
      body:ListView.builder(
          itemBuilder: (context,index){
            return Table(
              border: TableBorder.all(color:Colors.black87,width:2),
              children: [
                TableRow(
                    children: [
                      TableCell(
                          child: Text('Email')
                      ),
                      TableCell(
                          child: Text('UID')
                      ),
                    ]
                ),
                TableRow(
                    children: [
                      TableCell(
                          child: Text(""+auth.currentUser!.email.toString()+"\n")
                      ),
                      TableCell(
                          child: Text(""+auth.currentUser!.uid.toString()+"\n")
                      ),
                    ]
                ),
              ],
            );
          }),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          Navigator.push(context, MaterialPageRoute(builder: (context)=>AddPeople()));
        },
        child: Icon(
          Icons.add
        ),
      ),
    );
  }
}
