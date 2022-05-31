
import 'package:clubstyle_users/accounts/get_help.dart';
import 'package:clubstyle_users/accounts/notification.dart';
import 'package:clubstyle_users/accounts/privacy_policy.dart';
import 'package:clubstyle_users/accounts/youraccout.dart';
import 'package:flutter/material.dart';

class Settings extends StatefulWidget {
  const Settings({ Key? key }) : super(key: key);

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
         backgroundColor: Color(0xff060124),
         body: Column(
           children: [
             Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
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
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                          child: Text(
                        'Profile',
                        style: TextStyle(color: Colors.white, fontSize: 24),
                      )),
                    ),
                    Text(''),
                    Text(''),
                  ],
                ),

                Image.asset('assets/profile.png'),
                 Container(
                   margin: EdgeInsets.only(top: 10),
                          child: Text(
                        'Ariella Bradley',
                        style: TextStyle(color: Colors.white, fontSize: 24),
                      )),
                      SizedBox(height: 40,),
                      Container(
                        margin: EdgeInsets.all(10),
                        child: ListTile(
                          onTap: (){
                            Navigator.push(context, MaterialPageRoute(builder: (builder) => YourAccount()));
                          },
                          leading: Container(
                            height: 45,
                            width: 45,
                            decoration: BoxDecoration(
                              color: Color(0xffF01454),
                              borderRadius: BorderRadius.circular(10)
                              
                            ),
                            child: Icon(Icons.person,color: Colors.white,),
                          ),
                          title: Text('Your Account',style: TextStyle(color: Color(0xffF01454),),),
                          subtitle: Text('Account settings, change number',style: TextStyle(color: Colors.white54,fontSize: 10),),
                          trailing: Icon(Icons.arrow_forward_ios,color: Color(0xffF01454),),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.all(10),
                        child: ListTile(
                          onTap: (){
                            Navigator.push(context, MaterialPageRoute(builder: (builder) => NotifactionPage()));
                          },
                          leading: Container(
                            height: 45,
                            width: 45,
                            decoration: BoxDecoration(
                              color: Color(0xffF01454),
                              borderRadius: BorderRadius.circular(10)
                              
                            ),
                            child: Icon(Icons.notifications,color: Colors.white,),
                          ),
                          title: Text('Notifications',style: TextStyle(color: Color(0xffF01454),),),
                          subtitle: Text('App & clubs notifications',style: TextStyle(color: Colors.white54,fontSize: 10),),
                          trailing: Icon(Icons.arrow_forward_ios,color: Color(0xffF01454),),
                        ),
                      ),
                       Container(
                        margin: EdgeInsets.all(10),
                        child: ListTile(
                          onTap: (){
                            Navigator.push(context, MaterialPageRoute(builder: (builder) => GetHelp()));
                          },
                          leading: Container(
                            height: 45,
                            width: 45,
                            decoration: BoxDecoration(
                              color: Color(0xffF01454),
                              borderRadius: BorderRadius.circular(10)
                              
                            ),
                            child: Icon(Icons.question_mark,color: Colors.white,),
                          ),
                          title: Text('Get Help',style: TextStyle(color: Color(0xffF01454),),),
                          subtitle: Text('Help center, call us, privacy policy',style: TextStyle(color: Colors.white54,fontSize: 10),),
                          trailing: Icon(Icons.arrow_forward_ios,color: Color(0xffF01454),),
                        ),
                      ),
                       Container(
                        margin: EdgeInsets.all(10),
                        child: ListTile(
                          onTap: (){
                            Navigator.push(context, MaterialPageRoute(builder: (builder) => PrivacyPolicy()));
                          },
                          leading: Container(
                            height: 45,
                            width: 45,
                            decoration: BoxDecoration(
                              color: Color(0xffF01454),
                              borderRadius: BorderRadius.circular(10)
                              
                            ),
                            child: Icon(Icons.shield,color: Colors.white,),
                          ),
                          title: Text('Privacy Policy',style: TextStyle(color: Color(0xffF01454),),),
                          subtitle: Text('Privacy policy details',style: TextStyle(color: Colors.white54,fontSize: 10),),
                          trailing: Icon(Icons.arrow_forward_ios,color: Color(0xffF01454),),
                        ),
                      )
           ],
         ),
      ),
    );
  }
}