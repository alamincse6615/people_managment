import 'dart:io';
import 'dart:math';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart' as fStorage;



class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  File? picture;
  FirebaseAuth auth = FirebaseAuth.instance;
  String imageUrl="";

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Column(
        children: [
            Container(
              child: picture==null?
              Container(
                height: 200,
                child: Center(
                  child: Stack(
                    children: [
                      CircleAvatar(
                        backgroundImage: NetworkImage(
                          "https://www.pngitem.com/pimgs/m/150-1503945_transparent-user-png-default-user-image-png-png.png"
                        ),
                        radius: 80,
                      ),
                      Positioned(
                        bottom: 5,
                          right: 5,
                          child: IconButton(
                            onPressed: (){
                              showModalBottomSheet(
                                  context: context,
                                  builder: (context){
                                    return Container(
                                      height: 120,
                                      width: MediaQuery.of(context).size.width,
                                      child: Column(
                                        children: [
                                          SizedBox(height: 10,),
                                          Text("Choose Image",style: TextStyle(fontSize: 20),),
                                          Container(
                                            width: MediaQuery.of(context).size.width,
                                            child: Row(
                                             mainAxisAlignment: MainAxisAlignment.spaceAround,
                                              children: [
                                                IconButton(
                                                    onPressed: (){
                                                      getCameraImg();
                                                }, icon: Icon(Icons.camera)),
                                                IconButton(
                                                    onPressed: (){
                                                      getImageFromGallery();
                                                    }, icon: Icon(Icons.image)),
                                              ],
                                            ),
                                          )
                                        ],
                                      ),
                                    );
                                  }
                              );
                            },
                            icon: Icon(Icons.camera_alt),
                          )
                      )
                    ],
                  ),
                ),
              ):Container(
                child: Column(
                  children: [
                    Center(
                      child: Stack(
                        children: [
                          CircleAvatar(
                            backgroundImage: FileImage(
                              picture!
                            ),
                            radius: 80,
                          ),
                          Positioned(
                              bottom: 5,
                              right: 5,
                              child: IconButton(
                                onPressed: (){
                                  showModalBottomSheet(
                                      context: context,
                                      builder: (context){
                                        return Container(
                                          height: 120,
                                          width: MediaQuery.of(context).size.width,
                                          child: Column(
                                            children: [
                                              SizedBox(height: 10,),
                                              Text("Choose Image",style: TextStyle(fontSize: 20),),
                                              Container(
                                                width: MediaQuery.of(context).size.width,
                                                child: Row(
                                                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                                                  children: [
                                                    IconButton(
                                                        onPressed: (){
                                                          getCameraImg();
                                                        }, icon: Icon(Icons.camera)),
                                                    IconButton(
                                                        onPressed: (){
                                                          getImageFromGallery();
                                                        }, icon: Icon(Icons.image)),
                                                  ],
                                                ),
                                              )
                                            ],
                                          ),
                                        );
                                      }
                                  );
                                },
                                icon: Icon(Icons.camera_alt),
                              )
                          )
                        ],
                      ),
                    ),
                    ElevatedButton(onPressed: (){
                      uploadImagetoFirebase(picture!);
                    }, child: Text("Save Image"))
                  ],
                ),
              ),

            )
        ],
      ),
    );
  }
  getImageFromGallery()async{
   PickedFile? imgfile = await ImagePicker().getImage(source: ImageSource.gallery);
   if(imgfile != null){
     setState(() {
       picture = File(imgfile.path);
     });
   }
  }
  getCameraImg()async{
   PickedFile? imgfile = await ImagePicker().getImage(source: ImageSource.camera);
   if(imgfile != null){
     setState(() {
       picture = File(imgfile.path);
     });
   }
  }
  uploadImagetoFirebase(File imageFile)async{
    fStorage.Reference reference = fStorage.FirebaseStorage.instance.ref().child("userImage").child(auth.currentUser!.uid);
    fStorage.UploadTask uploadTask = reference.putFile(imageFile);
    fStorage.TaskSnapshot taskSnapshot = await uploadTask.whenComplete(() {});
    await taskSnapshot.ref.getDownloadURL().then((value) {
      imageUrl = value;
      print(imageUrl);
    });
  }
}
