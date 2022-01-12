import 'package:flutter/material.dart';
import 'package:people_management/signin.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
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

        title: Text("Sign Up to continue"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
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
          ),
          Center(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Already have an Account? "),
                InkWell(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>SignIn()));
                    },
                    child: Text("Login",style: TextStyle(color: Color(0xf0d20f0f)),)),
              ],
            ),
          )
        ],
      ),

    );
  }
  registration(String name, String email, String pass){

  }
}
