import 'package:clubstyle_users/auth/signup.dart';
import 'package:clubstyle_users/database/database.dart';
import 'package:clubstyle_users/main/mainscreen.dart';
import 'package:clubstyle_users/provider/googleprovider.dart';
import 'package:clubstyle_users/widgeys/customdialog.dart';
import 'package:clubstyle_users/widgeys/utils.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'package:provider/provider.dart';

class SignIn extends StatefulWidget {
  const SignIn({Key? key}) : super(key: key);

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();
  bool _isLoading = false;
  @override
  Widget build(BuildContext context) {
     final provider = Provider.of<GoogleSignInProvider>(context,listen: false);
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xff060124),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
           
            Container(
              child: const Center(
                  child: Text(
                'Hello Again!',
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 30),
              )),
            ),
            Container(
              margin: EdgeInsets.only(top: 10),
              child: Center(
                  child: Text(
                'Sign in to your account',
                style: TextStyle(color: Colors.white54, fontSize: 12),
              )),
            ),
            Container(
              margin: EdgeInsets.only(top: 20, right: 10, left: 10),
              padding: EdgeInsets.all(10),
              child: TextField(
                autofocus: false,
                style: TextStyle(fontSize: 15.0, color: Colors.white),
                decoration: InputDecoration(
                  labelText: 'Enter Email Address',
                  labelStyle: TextStyle(color: Color(0xffF01454)),
                  hintText: 'Email Address',
                  hintStyle: TextStyle(color: Colors.white),
                  filled: true,
                  // fillColor: Colors.grey,
                  contentPadding:
                      const EdgeInsets.only(left: 14.0, bottom: 6.0, top: 8.0),
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
              margin: EdgeInsets.only(top: 10, right: 10, left: 10),
              padding: EdgeInsets.all(10),
              child: TextField(
                autofocus: false,
                style: TextStyle(fontSize: 15.0, color: Colors.white),
                decoration: InputDecoration(
                  labelText: 'Enter Password',
                  labelStyle: TextStyle(color: Color(0xffF01454)),
                  hintText: 'Password',
                  hintStyle: TextStyle(color: Colors.white),
                  filled: true,
                  // fillColor: Colors.grey,
                  contentPadding:
                      const EdgeInsets.only(left: 14.0, bottom: 6.0, top: 8.0),
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
              margin: const EdgeInsets.only(top: 10, left: 20),
              child: const Text(
                'Forgot your password?',
                style: TextStyle(color: Color(0xffF01454), fontSize: 13),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Container(
                  margin:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: const Color(0xffF01454),
                      minimumSize: const Size(350, 55),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(23)),
                    ),
                    onPressed: loginUser,
                    child: _isLoading ? Center(child: CircularProgressIndicator()) : Text(
                      'Sign In',
                      style: TextStyle(fontSize: 20),
                    ),
                  )),
            ),
            Container(
              child: const Center(
                  child: Text(
                'Or with!',
                style: TextStyle(color: Colors.white54, fontSize: 12),
              )),
            ),
            Center(
                  child: Container(

                   margin: EdgeInsets.only(top: 20),
                    height: 60,
                    width: 300,
                    
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          // color: Colors.white,
            ),
      
          
                    child: SignInButton(
                      
                            Buttons.Google,
                            text: "Sign up with Google",
                            onPressed: (){
                             
                              try{
                             Customdialog.showDialogBox(context);
                            FirebaseDatabaseMethods().signInWithGoogle().then((value) {
                               FirebaseDatabaseMethods().socialLoginUser(context);
                             }).catchError((e){
                             });
                           }on FirebaseAuthException catch(e){
                             Navigator.pop(context);
          
                             Customdialog.showBox(context,e.toString());
          
          
                           }
                             
                            },
                            shape: StadiumBorder(),
                            ),
                  ),
                ),
               Center(
                  child: Container(
                    margin: EdgeInsets.only(top: 20),
                   
                    height: 60,
                    width: 300,
                    
      
      
          
                    child:  SignInButton(
            Buttons.FacebookNew,
            shape: StadiumBorder(),
            onPressed: () {
               Navigator.push(context,
                         MaterialPageRoute(builder: (context) => MainScreen()));
            },
          ),
                            
                  ),
                
              ),
              InkWell(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (builder) => SignUp()));
                },
                child: Container(
                  margin: EdgeInsets.only(top: 20,bottom: 10),
                  child: Center(
                    child: RichText(
                text: TextSpan(
                  children: const <TextSpan>[
                    TextSpan(text: 'Dont have an account?', style: TextStyle(color: Colors.white)),
                    TextSpan(text: '  Sign Up',style: TextStyle(color: Color(0xffF01454))),
                  ],
                ),
              ),
                  ),
                ))
                         
              ],
            
          
        ),
      ),
    );
  }

  void loginUser() async{
    setState(() {
      _isLoading = true;
    });
    String rse = await FirebaseDatabaseMethods().signIn(
        email: emailController.text,
        pass: passController.text,
      );

    print(rse);
    setState(() {
      _isLoading = false;
    });
    if(rse == 'sucess'){
       MaterialPageRoute(
          builder: (builder) => MainScreen(
            ));
    }
    else{
      showSnakBar(rse, context);
    }
     
  }
  
}
