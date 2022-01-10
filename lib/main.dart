import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);



  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final namectrl = TextEditingController();
  final emailtrl = TextEditingController();
  final passtrl = TextEditingController();


  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    namectrl.dispose();
    emailtrl.dispose();
    passtrl.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

        title: Text(widget.title),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: namectrl,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: "Enter your Name"
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: emailtrl,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: "Enter your email"
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              obscureText: true,
              controller: passtrl,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: "Enter your password"
              ),
            ),
          ),
          ElevatedButton(
              onPressed: (){
                registration(namectrl.text,emailtrl.text,passtrl.text);
              },
              child: Text("Sign Up")
          )
        ],
      ),

     );
  }
  registration(String name, String email, String pass){

  }
}
