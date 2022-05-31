import 'package:flutter/material.dart';

import '../accounts/notification.dart';

class Home_Page extends StatefulWidget {
  const Home_Page({ Key? key }) : super(key: key);

  @override
  State<Home_Page> createState() => _Home_PageState();
}

class _Home_PageState extends State<Home_Page> {
  @override
  Widget build(BuildContext context) {
  var scalfoldKey = GlobalKey<ScaffoldState>();

    return Scaffold(
    
     drawer: Drawer(),
      backgroundColor: Color(0xff060124),
      body: SafeArea(
        
        key: scalfoldKey,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                      onTap: () {
                        scalfoldKey.currentState!.openDrawer();
                      },
                      child: Container(
                        margin: EdgeInsets.only(left: 10),
                        width: 45,
                        height: 45,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(100),
                            color: Color(0xffF01454)),
                        child:Image.asset('assets/sidenav.png')
                      ),
                    ),
         InkWell(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (builder) => NotifactionPage()));
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        margin: EdgeInsets.only(left: 10),
                        width: 45,
                        height: 45,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(100),
                            color: Color.fromARGB(255, 1, 1, 2)),
                        child:Icon(Icons.notifications,color: Colors.white,)
                      ),
                    ),
                  ),
                  
                ],
              ),
               Container(
                    margin: EdgeInsets.only(left: 20,  top: 20),
                    child:  Text(
                      'CHi, Ariella Bradley ',
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                          fontSize: 25),
                      textAlign: TextAlign.start,
                    )),
                     Container(
                    margin: EdgeInsets.only(left: 20,),
                    child:  Text(
                      'What do you want to Explore?',
                      style: TextStyle(
                          color: Colors.white54,
                          fontSize: 15),
                      textAlign: TextAlign.start,
                    )),
        
                                   Container(
                    margin: EdgeInsets.only(top: 10, right: 10, left: 10),
                    padding: EdgeInsets.all(10),
                    child: TextField(
                      autofocus: false,
                      style: TextStyle(fontSize: 15.0, color: Colors.white),
                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.search,color: Colors.white,),
                        hintText: 'Search',
                        hintStyle: TextStyle(color: Colors.white),
                        filled: true,
                        // fillColor: Colors.grey,
                        contentPadding:
                            const EdgeInsets.only(left: 14.0, bottom: 6.0, top: 8.0),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Color(0xffF01454)),
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                        enabledBorder: OutlineInputBorder(
                           borderSide: BorderSide(color: Colors.white),
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                      ),
                    ),
                  ),
        
                  Container(
                    margin: EdgeInsets.only(top: 20),
                    child: Divider(
                      color: Colors.white,
                    ),
                  ),
                   Container(
                    margin: EdgeInsets.only(left: 20,  top: 20),
                    child:  Text(
                      'Featured Artist ',
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                          fontSize: 20),
                      textAlign: TextAlign.start,
                    )),
                    Container(
                      
                                        margin: EdgeInsets.only(left: 20,  top: 10,right: 20),
                      child: Center(child: Image.asset('assets/attach.png'))),
                    Container(
                                        margin: EdgeInsets.only(left: 20,  right: 20),
        
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                           Text(
                         'Artist Name',
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                            fontSize: 15),
                        textAlign: TextAlign.start,
                      ),
                      Image.asset('assets/rat.png'),
                        ],
                      ),
                    ),
                      Container(
                                        margin: EdgeInsets.only(left: 25,  right: 20),
        
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                           Text(
                         'DJ',
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                            fontSize: 15),
                        textAlign: TextAlign.start,
                      ),
                       Text(
                         '\$\2500 / month',
                        style: TextStyle(
                            color: Color(0xffF01454),
                            fontWeight: FontWeight.w600,
                            fontSize: 15),
                        textAlign: TextAlign.start,
                      ),
                        ],
                      ),
                    ),
                      Container(
                                        margin: EdgeInsets.only(left: 25,  right: 20,top: 20),
        
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                           Text(
                         'New Artist',
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 25),
                        textAlign: TextAlign.start,
                      ),
                       Text(
                         'View all >',
                        style: TextStyle(
                            color: Colors.white54,
                            fontWeight: FontWeight.bold,
                            fontSize: 15),
                        textAlign: TextAlign.start,
                      ),
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 20),
                      height: 300,
                      child: ListView.builder(
                        itemCount: 4,
                        itemBuilder: ((context, index) {
                        return ListTile(
                          leading: Image.asset('assets/image.png'),
                          title:  Text(
                         'Artist Name',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 15),
                        textAlign: TextAlign.start,
                      ),
                      subtitle:  Text(
                         'DJ',
                        style: TextStyle(
                            color: Colors.white54,
                            fontSize: 15),
                        textAlign: TextAlign.start,
                      ),
                      trailing: Column(
                        children: [
                                                Image.asset('assets/rat.png'),

                          Text(
                         '\$\2500 / month',
                        style: TextStyle(
                            color: Color(0xffF01454),
                            fontWeight: FontWeight.w600,
                            fontSize: 15),
                        textAlign: TextAlign.start,
                      ),
                        ],
                        
                      ),
                        );
                      })),
                    )
            ],
          ),
        ),
      ),
    );
  }
}