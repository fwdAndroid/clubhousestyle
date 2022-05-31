import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:clubstyle_users/database/storage_methods.dart';
import 'package:clubstyle_users/main/mainscreen.dart';
import 'package:clubstyle_users/models/registrationmodels.dart';
import 'package:clubstyle_users/profile/completeprofile.dart';
import 'package:clubstyle_users/widgeys/customdialog.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class FirebaseDatabaseMethods{
 final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
  
  Future<RegistrationModel> getUserDetails() async {
   User currentUser = _auth.currentUser!;
   DocumentSnapshot documentSnapshot =await firebaseFirestore.collection('users').doc(currentUser.uid).get();
   return RegistrationModel.fromSnap(documentSnapshot);
}
 //Register User with Add User
 Future <String> signUpUser({
    required String email,
    required String fullName,
    required String pass,
    required String confrimPassword,
  }) async{
     String res = 'Some error occured';
     try{
        if (email.isNotEmpty || pass.isNotEmpty || confrimPassword.isNotEmpty ) {
        UserCredential cred =  await _auth.createUserWithEmailAndPassword(email: email, password: pass);
        // String photoURL = await StorageMethods().uploadImageToStorage('ProfilePics', file, false);
          //Add User to the database with modal
          RegistrationModel userModel = RegistrationModel(
            
             uid:cred.user!.uid,
             email:email, 
             fullname: fullName,
              
           );
          await firebaseFirestore.collection('users').doc(cred.user!.uid).set(userModel.toJson());
         
          res = 'sucess';
        }
     }catch(e){
    
       res = e.toString();
     }
     return res;
  }
  

//Sign User with Add User
 Future <String> signIn({
    required String email,
    required String pass,
  }) async{
     String res = 'Some error occured';
     try{
        if (email.isNotEmpty || pass.isNotEmpty) {
        UserCredential cred =  await _auth.signInWithEmailAndPassword(email: email, password: pass);
        // String photoURL = await StorageMethods().uploadImageToStorage('ProfilePics', file, false);
         
          res = 'sucess';
        }
     }catch(e){
    
       res = e.toString();
     }
     return res;
  }
     

 ///Update
 Future<String> updateUser({required String uid,required String contact,required String address,required Uint8List file}) async{
   try{
            String photoUrl = await StorageMethods().uploadImageToStorage('ProfilePics', file, false);

 firebaseFirestore.collection('users').doc(uid).update(
   {
      "contactno": contact,
      "address":address,
      "photoUrl":photoUrl
      
      
   }
 );
   }catch(e){
     e.toString();
   }
  return "Profie Update";
     
 }    

 // Google SignIN
 Future<UserCredential> signInWithGoogle() async {

    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();


    final GoogleSignInAuthentication googleAuth = await googleUser!.authentication;


    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );


    return await FirebaseAuth.instance.signInWithCredential(credential);
  }

  

 socialLoginUser(
      BuildContext context
      )async{
    String userName=FirebaseAuth.instance.currentUser!.displayName.toString();
    String email=FirebaseAuth.instance.currentUser!.email.toString();
    String phoneNumber=FirebaseAuth.instance.currentUser!.phoneNumber.toString();
    String photoUrl=FirebaseAuth.instance.currentUser!.photoURL.toString();
    try{

      await firebaseFirestore.collection('users').doc(FirebaseAuth.instance.currentUser!.uid).set({
        "id":FirebaseAuth.instance.currentUser!.uid,
        'fullname':userName,
        'email':email,
      
        "contactno":phoneNumber,
        "photoUrl":photoUrl,
        "address":"address"
        // 'Password':password
      }).then((value) {
        Customdialog().showInSnackBar("Logged in", context);
        Customdialog.closeDialog(context);
        Navigator.pushAndRemoveUntil(
            context, MaterialPageRoute(builder: (_) => MainScreen()), (
            route) => false);

      });
    }on FirebaseAuthException catch(e){
      Navigator.pop(context);

      Customdialog.showBox(context,e.toString());


    }
  } 
}
     
     
    
  








