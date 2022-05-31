
import 'dart:typed_data';

import 'package:clubstyle_users/auth/signinpage.dart';
import 'package:clubstyle_users/database/database.dart';
import 'package:clubstyle_users/main/mainscreen.dart';
import 'package:clubstyle_users/widgeys/utils.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class CompleteProfile extends StatefulWidget {
  const CompleteProfile({Key? key}) : super(key: key);

  @override
  State<CompleteProfile> createState() => _CompleteProfileState();
}

class _CompleteProfileState extends State<CompleteProfile> {
  bool _isLoading = false;

  TextEditingController addressController = TextEditingController();
  TextEditingController contactController = TextEditingController();
  Uint8List ? _image;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xff060124),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: EdgeInsets.only(left: 10),
                width: 45,
                height: 45,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                    color: Color(0xffF01454)),
                child: Icon(
                  Icons.arrow_back,
                  color: Colors.white,
                ),
              ),
              Container(
                  margin: EdgeInsets.only(left: 20, right: 20, top: 10),
                  child: Center(
                      child: Text(
                    'Complete \n Profile ',
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                        fontSize: 35),
                    textAlign: TextAlign.center,
                  ))),
              Center(
                child: 
                Stack(
                children: [
                  _image != null
                      ? CircleAvatar(
                          radius: 59, backgroundImage: MemoryImage(_image!))
                      : CircleAvatar(
                          radius: 59,
                          backgroundImage: NetworkImage(
                              'https://static.remove.bg/remove-bg-web/a6eefcd21dff1bbc2448264c32f7b48d7380cb17/assets/start_remove-c851bdf8d3127a24e2d137a55b1b427378cd17385b01aec6e59d5d4b5f39d2ec.png'),
                        ),
                  Positioned(
                      bottom: -10,
                      left: 70,
                      child: IconButton(
                          onPressed: () => selectImage(),
                          icon: Icon(
                            Icons.add_a_photo,
                            color: Colors.white,
                          )))
                ],
              ),
              ),
              Container(
                margin: EdgeInsets.only(top: 10, right: 10, left: 10),
                padding: EdgeInsets.all(10),
                child: TextField(
                  controller: contactController,
                  autofocus: false,
                  style: TextStyle(fontSize: 15.0, color: Colors.white),
                  decoration: InputDecoration(
                    labelText: 'Contact No',
                    labelStyle: TextStyle(color: Color(0xffF01454)),
                    hintText: '000000000000000',
                    hintStyle: TextStyle(color: Colors.white),
                    filled: true,
                    // fillColor: Colors.grey,
                    contentPadding: const EdgeInsets.only(
                        left: 14.0, bottom: 6.0, top: 8.0),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Color(0xffF01454)),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                ),
              ),
              Container(
                decoration: BoxDecoration(
                    // color: Colors.grey,
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(color: Colors.grey)),
                width: 324,
                height: 171,
                margin: EdgeInsets.only(top: 10, right: 20, left: 20),
                padding: EdgeInsets.all(10),
                child: TextField(
                  controller: addressController,
                  autofocus: false,
                  style: TextStyle(fontSize: 15.0, color: Colors.white),
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: 'Address',
                    hintStyle: TextStyle(color: Colors.white),
                    // filled: true,
                    // fillColor: Colors.grey,
                    contentPadding: const EdgeInsets.only(
                        left: 14.0, bottom: 6.0, top: 8.0),
                    // focusedBorder: OutlineInputBorder(
                    //   borderSide: BorderSide(color: Color(0xffF01454)),
                    //   borderRadius: BorderRadius.circular(10.0),
                    // ),
                    // enabledBorder: OutlineInputBorder(
                    //    borderSide: BorderSide(color: Colors.white),
                    //   borderRadius: BorderRadius.circular(10.0),
                    // ),
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 20, bottom: 20),
                child: Center(
                  child: ElevatedButton(
                    onPressed:(){
                        updateProfile();
      Navigator.push(context,MaterialPageRoute(builder: (builder) => SignIn()));

                    },
                    child: _isLoading ? CircularProgressIndicator(): Text('Register'),
                    style: ElevatedButton.styleFrom(
                      primary: Color(0xffF01454),
                      fixedSize: Size(325, 58),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30), // <-- Radius
                      ),
                    ),
                  ),
                ),
              ),
              InkWell(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (builder) => SignIn()));
                },
                child: Container(
                    margin: EdgeInsets.only(top: 20, bottom: 10),
                    child: Center(
                        child: RichText(
                      text: TextSpan(
                        children: const <TextSpan>[
                          TextSpan(
                              text: 'Already have an account?',
                              style: TextStyle(color: Colors.white)),
                          TextSpan(
                              text: '  Sign in',
                              style: TextStyle(color: Color(0xffF01454))),
                        ],
                      ),
                    ))),
              )
            ],
          ),
        ),
      ),
    );
  }

   updateProfile() async {
    setState(() {
      _isLoading = true;
    });
    String rse = await FirebaseDatabaseMethods().updateUser(
         contact: contactController.text,
         address: addressController.text,
         uid: FirebaseAuth.instance.currentUser!.uid, 
         file: _image!

        );

    print(rse);
    setState(() {
      _isLoading = false;
    });
    if (rse == 'sucess') {
      showSnakBar(rse, context);
    } 
  }

    /// Select Image From Gallery
  selectImage() async {
    Uint8List ui = await pickImage(ImageSource.gallery);
    setState(() {
      _image = ui;
    });
  }
}

