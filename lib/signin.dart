import 'package:flutter/material.dart';
import 'package:people_management/dashboard.dart';
import 'package:people_management/signup.dart';

class SignIn extends StatefulWidget {
  const SignIn({Key? key}) : super(key: key);

  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {

  final emailtrl = TextEditingController();
  final passtrl = TextEditingController();

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    emailtrl.dispose();
    passtrl.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

        title: Text("Sign In to continue"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
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
                registration(emailtrl.text,passtrl.text);
              },
              child: Text("Sign In")
          ),
          Center(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Create an Account? "),
                InkWell(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>SignUp()));
                  },
                    child: Text("Registration",style: TextStyle(color: Color(0xf0d20f0f)),)),
              ],
            ),
          )
        ],
      ),

    );
  }
  registration(String email, String pass){
    Navigator.push(context, MaterialPageRoute(builder: (context)=>Dashboard()));
  }

}
