import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:people_management/dashboard.dart';
import 'package:people_management/signin.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  _SignUpState createState() => _SignUpState();
}
var _key = GlobalKey<FormState>();
var passoff=true;
Icon passIcon=Icon(Icons.visibility);

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
      body: FutureBuilder(
        future: firebaeinit(),
       builder: (context,data){
         return Form(
           key: _key,
           child: Column(
             mainAxisAlignment: MainAxisAlignment.center,
             children: [
               Padding(
                 padding: const EdgeInsets.all(8.0),
                 child: TextFormField(
                   validator: (val){
                     if(val==""){
                       return "Enter your name";
                     }
                   },
                   controller: namectrl,
                   decoration: InputDecoration(
                       border: OutlineInputBorder(),
                       hintText: "Enter your Name"
                   ),
                 ),
               ),
               Padding(
                 padding: const EdgeInsets.all(8.0),
                 child: TextFormField(
                   validator: (val){
                     if(val==""){
                       return "Enter your email";
                     }
                   },
                   controller: emailtrl,
                   decoration: InputDecoration(
                       border: OutlineInputBorder(),
                       hintText: "Enter your email"
                   ),
                 ),
               ),
               Padding(
                 padding: const EdgeInsets.all(8.0),
                 child: TextFormField(
                   validator: (val){
                     if(val==""){
                       return "Enter your password";
                     }
                     else if(val!.length < 6){
                       return "Password is too short! must be use at lest 6 character";
                     }
                   },
                   obscureText: passoff,
                   controller: passtrl,
                   decoration: InputDecoration(
                       suffixIcon : GestureDetector(
                         onTap: (){
                           setState(() {
                             if(passoff){
                               passoff=false;
                               passIcon=Icon(Icons.visibility_off);
                             }
                             else if(!passoff){
                               passoff =true;
                               passIcon=Icon(Icons.visibility);
                             }
                           });
                         },
                         child: passIcon,
                       ),
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
       },
      ),
    );
  }
  Future<FirebaseApp> firebaeinit()async{
    FirebaseApp firebaseApp = await Firebase.initializeApp();
    return firebaseApp;
  }
  registration(String name, String email, String pass)async{

    FirebaseAuth auth = FirebaseAuth.instance;
    var isValid=_key.currentState!.validate();
    if(isValid){
      UserCredential userCredential = await auth.createUserWithEmailAndPassword(email: email, password: pass);
      if(userCredential.user != null){
          Navigator.push(context, MaterialPageRoute(builder: (context)=>Dashboard()));
      }else{
        // already email login
        // email format wrong
        // password 6<small
      }
    }else{
      return;
    }
  }
}
