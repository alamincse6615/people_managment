import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';


class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  File? picture;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
      ),
      body: Column(
        children: [
            Container(
              child: picture==null?InkWell(
                child: Container(
                  child: Image.network("https://skillz4kidzmartialarts.com/wp-content/uploads/2017/04/default-image.jpg"),
                ),
                onTap: (){
                  getImg();
                },
              ):InkWell(
                child: Container(
                  child: Image.file(picture!),
                ),
                onTap: (){
                  getImg();
                },
              ),
            )
        ],
      ),
    );
  }
  getImg()async{
   PickedFile? imgfile = await ImagePicker().getImage(source: ImageSource.gallery);
   if(imgfile != null){
     setState(() {
       picture = File(imgfile.path);
     });
   }
  }
  getCameraImg()async{
   PickedFile? imgfile = await ImagePicker().getImage(source: ImageSource.gallery);
   if(imgfile != null){
     setState(() {
       picture = File(imgfile.path);
     });
   }
  }
}
