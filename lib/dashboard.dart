import 'package:flutter/material.dart';
import 'package:people_management/addpeople.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  _DashboardState createState() => _DashboardState();
}
class _DashboardState extends State<Dashboard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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

      ),
      body: Column(
        children: [
          Container(
            height: MediaQuery.of(context).size.height*.80,
            child: ListView.builder(
              itemCount: 5,
                itemBuilder: (context,index){
                  return Row(
                    children: [
                      Text("Name"),
                      Text("email"),
                      Text("phone"),
                    ],
                  );
                }
            ),
          )

        ],
      ),
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
