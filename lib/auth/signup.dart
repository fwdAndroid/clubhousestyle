import 'package:clubstyle_users/database/database.dart';
import 'package:clubstyle_users/profile/completeprofile.dart';
import 'package:clubstyle_users/auth/signinpage.dart';
import 'package:clubstyle_users/widgeys/utils.dart';
import 'package:flutter/material.dart';

class SignUp extends StatefulWidget {
  
   SignUp({Key?key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
    bool _isLoading = false;

  TextEditingController fullName = TextEditingController();
  TextEditingController emailAddress = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confrimController = TextEditingController();
  bool isPopular = false;

   @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    fullName.clear();
    emailAddress.clear();
    passwordController.clear();
    confrimController.clear();
  }

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
                    'Create Owner \n Account',
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                        fontSize: 35),
                    textAlign: TextAlign.center,
                  ))),
              Container(
                margin: EdgeInsets.only(top: 20, right: 10, left: 10),
                padding: EdgeInsets.all(10),
                child: TextField(
                  controller: fullName,
                  autofocus: false,
                  style: TextStyle(fontSize: 15.0, color: Colors.white),
                  decoration: InputDecoration(
                    hintText: 'Full Name',
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
                margin: EdgeInsets.only(top: 10, right: 10, left: 10),
                padding: EdgeInsets.all(10),
                child: TextField(
                  controller: emailAddress,
                  autofocus: false,
                  style: TextStyle(fontSize: 15.0, color: Colors.white),
                  decoration: InputDecoration(
                    hintText: 'Email Address',
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
                margin: EdgeInsets.only(top: 10, right: 10, left: 10),
                padding: EdgeInsets.all(10),
                child: TextField(
                  obscureText: true,
                  controller: passwordController,
                  autofocus: false,
                  style: TextStyle(fontSize: 15.0, color: Colors.white),
                  decoration: InputDecoration(
                    hintText: 'Password',
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
                margin: EdgeInsets.only(top: 10, right: 10, left: 10),
                padding: EdgeInsets.all(10),
                child: TextField(
                  obscureText: true,
                  controller: confrimController,
                  autofocus: false,
                  style: TextStyle(fontSize: 15.0, color: Colors.white),
                  decoration: InputDecoration(
                    hintText: 'Re-Enter Password',
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

              // Container(
              //    margin: EdgeInsets.only(top: 20, right: 10, left: 10),
              //   child: Row(
              //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //     children: [
              //       Text('Do you want to Host Events?',style: TextStyle(color: Colors.white),),
              //       Image.asset('assets/switc.png')
              //     ],
              //   ),
              // ),
              SwitchListTile(
                  activeColor: Color(0xffF01454),
                  title: Text(
                    'Do you want to Host Events?',
                    style: TextStyle(color: Colors.white),
                  ),
                  value: isPopular,
                  onChanged: (v) {
                    setState(() {
                      isPopular = !isPopular;
                    });
                  }),
              Container(
                margin: EdgeInsets.only(
                  top: 20,
                ),
                child: Divider(
                  color: Colors.white,
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 20, right: 10, left: 10),
                child: Center(
                  child: Text(
                    'Fill out the fields and click button to complete the registration process',
                    style: TextStyle(color: Colors.white),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 20),
                child: Center(
                  child: ElevatedButton(
                    onPressed: signUpUsers,
                    child: _isLoading ? Center(child: CircularProgressIndicator()) : Text('Next'),
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
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (builder) => SignIn()));
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
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

    ///Register Users
  signUpUsers() async {
    setState(() {
      _isLoading = true;
    });
    String rse = await FirebaseDatabaseMethods().signUpUser(
        email: emailAddress.text,
        pass: passwordController.text,
        fullName: fullName.text,
        confrimPassword: confrimController.text,
        );

    print(rse);
    setState(() {
      _isLoading = false;
    });
    if (rse == 'sucess') {
      showSnakBar(rse, context);
      Navigator.push(context,MaterialPageRoute(builder: (builder) => CompleteProfile()));
    } 
  }
}
