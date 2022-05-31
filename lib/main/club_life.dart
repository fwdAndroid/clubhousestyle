import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../../payment/summary.dart';

class Club_Life extends StatefulWidget {
  const Club_Life({Key? key}) : super(key: key);

  @override
  State<Club_Life> createState() => _Club_LifeState();
}

class _Club_LifeState extends State<Club_Life> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xff060124),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
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
                      'Club Name',
                      style: TextStyle(color: Colors.white, fontSize: 24),
                    )),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                        margin: EdgeInsets.only(left: 10),
                        width: 45,
                        height: 45,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(100),
                            color: Color.fromARGB(255, 1, 1, 2)),
                        child: Image.asset('assets/heart.png')),
                  ),
                ],
              ),
              Container(
                  margin: EdgeInsets.only(top: 20, left: 20, right: 20),
                  child: Center(child: Image.asset('assets/video.png'))),
              Container(
                  margin: EdgeInsets.only(top: 10, left: 10, right: 10),
                  child: ListTile(
                      title: Text(
                        '\$ 2,000 / Night',
                        style: TextStyle(color: Colors.white),
                      ),
                      subtitle: Text(
                        "Bandung, Chicago, USA",
                        style: TextStyle(color: Color(0xff818194)),
                      ),
                      trailing: TextButton(
                          onPressed: () => showDialog<String>(
        context: context,
        builder: (BuildContext context) => AlertDialog(
    backgroundColor: Colors.transparent,
          content: InkWell(
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (builder) => Summarys()));
            },
            child: Image.asset('assets/data.png')),
          
        ),
      ),
                          child: Text(
                            'Book Now',
                            style: TextStyle(color: Color(0xffF01454)),
                          )))),
              Divider(
                color: Colors.white54,
              ),
              Container(
                  margin: EdgeInsets.only(top: 20, left: 20),
                  child: Text(
                    'Description',
                    style: TextStyle(color: Color(0xffF01454), fontSize: 14),
                  )),
              Container(
                  margin: EdgeInsets.only(top: 10, left: 20, right: 20),
                  child: Text(
                    'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
                    style: TextStyle(
                      color: Colors.white54,
                    ),
                    textAlign: TextAlign.justify,
                  )),
              
        
              Container(
                margin: EdgeInsets.only(left: 10,right: 10,top: 10),
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Image.asset('assets/image.png'),
                    ),
                    Expanded(child: ListTile(
                       title: Text(
                        'Steven Comvalius',
                        style: TextStyle(color: Colors.white),
                      ),
                      subtitle: Text(
                        "Owner",
                        style: TextStyle(color: Color(0xffF01454)),
                      ),
                    )),
                    Container(
                      height: 45,
                      width: 45,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Colors.white
                      ),
                      child: Icon(Icons.email,color: Colors.black,),
                    ),
                    SizedBox(width: 5,),
                     Container(
                      height: 45,
                      width: 45,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Colors.white
                      ),
                      child: Icon(Icons.phone,color: Colors.black,),
                    ),
                     SizedBox(width: 5,),
                  ],
                ),
              ),
        
        
        
              Container(
                margin: EdgeInsets.only(top: 10, left: 20, right: 20),
                child: Divider(
                  color: Colors.white54,
                ),
              ),
              Container(
                  margin: EdgeInsets.only(top: 20, left: 20),
                  child: Text(
                    'Location',
                    style: TextStyle(color: Color(0xffF01454), fontSize: 20),
                  )),

                  Container(
                                      margin: EdgeInsets.only(top: 10, left: 20),

                    child: Text('Jalan Pandjaitan 12, Purwokerto, Chicago, USA',style: TextStyle(color: Colors.white54),)),
                     Container(
                                      margin: EdgeInsets.only(top: 10, left: 20,bottom: 10,right: 20),

                    child: Image.asset('assets/map.png'))
            ],
          ),
        ),
      ),
    );
  }
}
