
import 'package:flutter/material.dart';


class MyDrawer extends StatefulWidget {
  const MyDrawer({Key? key}) : super(key: key);

  @override
  _MyDrawerState createState() => _MyDrawerState();
}

class _MyDrawerState extends State<MyDrawer> {
  bool _isLoading = false;

  

  @override
  Widget build(BuildContext context) {

    // UserModel user = Provider.of<UserProvider>(context).getUser;      
    
    return _isLoading == true? 
    CircularProgressIndicator.adaptive()
    :
    Drawer(
      backgroundColor: Color(0xff404040),
      child: ListView(
        // Important: Remove any padding from the ListView.
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
              color: Color(0xff404040),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'My Profile',
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                      fontSize: 24),
                ),
                SizedBox(
                  height: 10,
                ),
                // ListTile(
                //   leading: CircleAvatar(
                //       radius: 20,
                //       child: Image.network(
                //         // user.photoUrl!,
                //         (snapshot!.data() as Map<String, dynamic>)['photoUrl'],
                //         fit: BoxFit.cover,
                //       ),
                //       ),
                //   title: Text(
                //     // user.username!,
                //     (snapshot!.data() as Map<String, dynamic>)['username'],
                //     style: TextStyle(
                //         color: Colors.white,
                //         fontWeight: FontWeight.w700,
                //         fontSize: 14),
                //   ),
                //   subtitle: Text(
                //     '4.5',
                //     style: TextStyle(color: Color(0xffEB5757)),
                //   ),
                // ),
              ],
            ),
          ),
          Container(
              margin: EdgeInsets.only(left: 10),
              child: Text(
                'General',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.w600),
              )),
          
          ListTile(
            leading: Image.asset(
              'assets/earn.png',
              height: 30,
            ),
            title: const Text(
              'Add Vehicle',
              style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 14,
                  color: Colors.white),
            ),
            onTap: () {
              // Navigator.push(
              //     context, MaterialPageRoute(builder: (builder) => VehicleSettings()));
            },
          ),
          ListTile(
            leading: Image.asset(
              'assets/earn.png',
              height: 30,
            ),
            title: const Text(
              'Earnings',
              style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 14,
                  color: Colors.white),
            ),
            onTap: () {
              // Navigator.push(
              //     context, MaterialPageRoute(builder: (builder) => Payment()));
            },
          ),
          ListTile(
            leading: Image.asset(
              'assets/history.png',
              height: 30,
            ),
            title: const Text(
              'Order History',
              style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 14,
                  color: Colors.white),
            ),
            onTap: () {
              // Navigator.push(context,
              //     MaterialPageRoute(builder: (builder) => OrdersHistory()));
            },
          ),
          ListTile(
            leading: Image.asset(
              'assets/set.png',
              height: 30,
            ),
            title: const Text(
              'Settings',
              style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 14,
                  color: Colors.white),
            ),
            onTap: () {
              // Navigator.push(
              //     context, MaterialPageRoute(builder: (builder) => Setting()));
            },
          ),
          ListTile(
            leading: Image.asset(
              'assets/faq.png',
              height: 30,
            ),
            title: const Text(
              'FAQs',
              style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 14,
                  color: Colors.white),
            ),
            onTap: () {
              // Navigator.push(
              //     context, MaterialPageRoute(builder: (builder) => Support()));
            },
          ),
          // ListTile(
          //   leading: Image.asset(
          //     'assets/log.png',
          //     height: 30,
          //   ),
          //   title: const Text(
          //     'Log out',
          //     style: TextStyle(
          //         fontWeight: FontWeight.w500,
          //         fontSize: 14,
          //         color: Colors.white),
          //   ),
          //   onTap: () {
          //     DataBaseMethods().singnOut();
          //     // Update the state of the app.
          //     // ...
          //   },
          // ),
        ],
      ),
    );
  }
}
