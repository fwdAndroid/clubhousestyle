import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:clubstyle_users/main/events_list.dart';
import 'package:flutter/material.dart';

import '../accounts/notification.dart';

class Home_Page extends StatefulWidget {
  const Home_Page({Key? key}) : super(key: key);

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
          child: StreamBuilder(
              stream: FirebaseFirestore.instance
                  .collection('clubowners')
                  .snapshots(),
              builder: (context,
                  AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>> snapshot) {
                if (snapshot.hasData) {
                  return Column(
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
                                child: Image.asset('assets/sidenav.png')),
                          ),
                          InkWell(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (builder) => NotifactionPage()));
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
                                  child: Icon(
                                    Icons.notifications,
                                    color: Colors.white,
                                  )),
                            ),
                          ),
                        ],
                      ),
                      Container(
                          margin: EdgeInsets.only(left: 20, top: 20),
                          child: Text(
                            'CHi, Ariella Bradley ',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w600,
                                fontSize: 25),
                            textAlign: TextAlign.start,
                          )),
                      Container(
                          margin: EdgeInsets.only(
                            left: 20,
                          ),
                          child: Text(
                            'What do you want to Explore?',
                            style:
                                TextStyle(color: Colors.white54, fontSize: 15),
                            textAlign: TextAlign.start,
                          )),
                      Container(
                        margin: EdgeInsets.only(top: 10, right: 10, left: 10),
                        padding: EdgeInsets.all(10),
                        child: TextField(
                          autofocus: false,
                          style: TextStyle(fontSize: 15.0, color: Colors.white),
                          decoration: InputDecoration(
                            prefixIcon: Icon(
                              Icons.search,
                              color: Colors.white,
                            ),
                            hintText: 'Search',
                            hintStyle: TextStyle(color: Colors.white),
                            filled: true,
                            // fillColor: Colors.grey,
                            contentPadding: const EdgeInsets.only(
                                left: 14.0, bottom: 6.0, top: 8.0),
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
                        margin: EdgeInsets.only(left: 25, right: 20, top: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Club Name',
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
                          itemCount: snapshot.data!.docs.length,
                          itemBuilder: ((context, index) {
                            var snap = snapshot.data!.docs[index].data();
                            return ListTile(
                              leading: SizedBox(
                                  height: 50,
                                  width: 50,
                                  child: Image.network(
                                    snap['photoURL'].toString(),
                                    fit: BoxFit.cover,
                                  )),
                              title: Text(
                                snap['fullname'].toString(),
                                style: TextStyle(
                                    color: Colors.white, fontSize: 15),
                                textAlign: TextAlign.start,
                              ),
                              subtitle: Text(
                                snap['email'].toString(),
                                style: TextStyle(
                                    color: Colors.white54, fontSize: 15),
                                textAlign: TextAlign.start,
                              ),
                              trailing: GestureDetector(
                                child: const Text(
                                  'View Details',
                                  style: TextStyle(color: Colors.white),
                                ),
                                onTap: () {
                                  Navigator.of(context).push(
                                    MaterialPageRoute(
                                      builder: (context) => EventsList(
                                          userId: snap['uid'].toString()),
                                    ),
                                  );
                                },
                              ),
                            );
                          }),
                        ),
                      )
                    ],
                  );
                } else {
                  return const Center(
                    child: CircularProgressIndicator(
                      color: Colors.white,
                    ),
                  );
                }
              }),
        ),
      ),
    );
  }
}
