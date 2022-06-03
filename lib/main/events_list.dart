import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:clubstyle_users/database/database.dart';
import 'package:flutter/material.dart';

class EventsList extends StatefulWidget {
  String userId;
  EventsList({Key? key, required this.userId}) : super(key: key);

  @override
  State<EventsList> createState() => _EventsListState();
}

class _EventsListState extends State<EventsList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xff060124),
        title: const Text('Events'),
        elevation: 0,
      ),
      backgroundColor: const Color(0xff060124),
      body: StreamBuilder(
        stream: FirebaseFirestore.instance
            .collection('Events')
            .doc('eventslist')
            .collection(widget.userId)
            .snapshots(),
        builder: (context,
            AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>> snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
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
                    snap['eventname'].toString(),
                    style: TextStyle(color: Colors.white, fontSize: 15),
                    textAlign: TextAlign.start,
                  ),
                  subtitle: Text(
                    '\$' + snap['eventprice'].toString(),
                    style: TextStyle(color: Colors.white54, fontSize: 15),
                    textAlign: TextAlign.start,
                  ),
                  trailing: InkWell(
                    child: const Text(
                      'Book Now',
                      style: TextStyle(color: Colors.white),
                    ),
                    onTap: () async {
                      await FirebaseDatabaseMethods()
                          .bookEvent(snap: snap, uid: snap['uid'].toString());
                    },
                  ),
                );
              }),
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}
