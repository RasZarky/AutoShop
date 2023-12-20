import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyServiceOrderScren extends StatefulWidget {
  const MyServiceOrderScren({Key? key}) : super(key: key);

  @override
  State<MyServiceOrderScren> createState() => _MyServiceOrderScrenState();
}

class _MyServiceOrderScrenState extends State<MyServiceOrderScren> {

  Query dbRef1 = FirebaseDatabase.instance.ref().child('orders').orderByChild('status').equalTo('pending');
  Query dbRef2 = FirebaseDatabase.instance.ref().child('orders').orderByChild('status').equalTo('processing');
  Query dbRef3 = FirebaseDatabase.instance.ref().child('orders').orderByChild('status').equalTo('completed');

  User? user = FirebaseAuth.instance.currentUser;

  Widget listItem( {required Map pending}){
    return pending['user'] == user?.email ? Container(
      margin: EdgeInsets.all(10),
      padding: EdgeInsets.all(10),

      color: Colors.orange,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          pending['user'] == user?.email ? Text(
            pending['shop'],
            style: TextStyle(fontWeight: FontWeight.w400, fontSize: 16),
          ):Container(),
          const SizedBox(height: 2,),
          pending['user'] == user?.email ? Text(
            pending['user'],
            style: TextStyle(fontWeight: FontWeight.w400, fontSize: 16),
          ): Container(),
          pending['user'] == user?.email ? Text(
            pending['date'],
            style: TextStyle(fontWeight: FontWeight.w400, fontSize: 16),
          ): Container(),
          pending['user'] == user?.email ? Text(
            pending['status'],
            style: TextStyle(fontWeight: FontWeight.w400, fontSize: 16),
          ): Container( ),
          pending['user'] == user?.email ? Row(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: (){
                  // AlertDialog(
                  //     title: const Center(
                  //       child: Column(
                  //         children: [
                  //           Icon(Icons.warning_outlined,
                  //               size: 36, color: Colors.red),
                  //           SizedBox(height: 20),
                  //           Text("Confirm order update"),
                  //         ],
                  //       ),
                  //     ),
                  //     content: Container(
                  //       //color: secondaryColor,
                  //       height: 110,
                  //       child: Column(
                  //         children: [
                  //           Text(
                  //               "Are you sure want to process '${pending['orderId']}'?"),
                  //           SizedBox(
                  //             height: 16,
                  //           ),
                  //           Row(
                  //             mainAxisAlignment: MainAxisAlignment.center,
                  //             children: [
                  //               ElevatedButton.icon(
                  //                   icon: Icon(
                  //                     Icons.close,
                  //                     size: 14,
                  //                   ),
                  //                   style: ElevatedButton.styleFrom(
                  //                       primary: Colors.grey),
                  //                   onPressed: () {
                  //                     Navigator.of(context).pop();
                  //                   },
                  //                   label: Text("Cancel")),
                  //               SizedBox(
                  //                 width: 20,
                  //               ),
                  //               ElevatedButton.icon(
                  //                   icon: Icon(
                  //                     Icons.delete,
                  //                     size: 14,
                  //                   ),
                  //                   style: ElevatedButton.styleFrom(
                  //                       primary: Colors.red),
                  //                   onPressed: () {},
                  //                   label: Text("Cancel order"))
                  //             ],
                  //           )
                  //         ],
                  //       ),
                  //     ));
                  FirebaseDatabase.instance.ref().child('orders').child(pending['key']).remove();
                  var snackBar = const SnackBar(
                    content: Text( "Order Cancelled",
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 15),
                    ),
                  );
                  ScaffoldMessenger.of(context).showSnackBar(snackBar);
                },
                child: Text(
                  'Cancel',
                  style: TextStyle(fontWeight: FontWeight.w400, fontSize: 25,
                      backgroundColor: Colors.red),
                ),
              )
            ],
          ): Container()
        ],
      ),
    ) : Container() ;
  }

  Widget listItem2( {required Map processing}){
    return processing['user'] == user?.email ? Container(
      margin: EdgeInsets.all(10),
      padding: EdgeInsets.all(10),

      color: Colors.orange,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            processing['shop'],
            style: TextStyle(fontWeight: FontWeight.w400, fontSize: 16),
          ),
          const SizedBox(height: 2,),
          Text(
            processing['user'],
            style: TextStyle(fontWeight: FontWeight.w400, fontSize: 16),
          ),
          Text(
            processing['date'],
            style: TextStyle(fontWeight: FontWeight.w400, fontSize: 16),
          ),
          Text(
            processing['status'],
            style: TextStyle(fontWeight: FontWeight.w400, fontSize: 16),
          ),

        ],
      ),
    ) : Container();
  }

  Widget listItem3( {required Map completed}){
    return completed['user'] == user?.email ? Container(
      margin: EdgeInsets.all(10),
      padding: EdgeInsets.all(10),

      color: Colors.orange,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            completed['shop'],
            style: TextStyle(fontWeight: FontWeight.w400, fontSize: 16),
          ),
          const SizedBox(height: 2,),
          Text(
            completed['user'],
            style: TextStyle(fontWeight: FontWeight.w400, fontSize: 16),
          ),
          Text(
            completed['date'],
            style: TextStyle(fontWeight: FontWeight.w400, fontSize: 16),
          ),
          Text(
            completed['status'],
            style: TextStyle(fontWeight: FontWeight.w400, fontSize: 16),
          ),
        ],
      ),
    ) : Container();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.orange,
          bottom: const TabBar(
              tabs: [
                Tab(icon: Icon(Icons.pending_actions),
                  text: 'Pending',
                ),
                Tab(icon: Icon(Icons.update),
                  text: 'Processing',
                ),
                Tab(icon: Icon(Icons.done_all),
                  text: 'Completed',
                ),
              ]
          ),
          title: const Text('Bookings'),
        ),

        body: TabBarView(
          children: [
            Container(
              child: FirebaseAnimatedList(
                query: dbRef1,
                itemBuilder: (BuildContext context, DataSnapshot snapshot, Animation<double> animation, int index) {

                      Map pending = snapshot.value as Map;
                      pending['key'] = snapshot.key;

                  return  listItem(pending: pending);
                },

              ),
            ),
            Container(
              child: FirebaseAnimatedList(
                query: dbRef2,
                itemBuilder: (BuildContext context, DataSnapshot snapshot, Animation<double> animation, int index) {

                    Map processing = snapshot.value as Map;
                    processing['key'] = snapshot.key;

                  return  listItem2(processing: processing);
                },

              ),
            ),
            Container(
              child: FirebaseAnimatedList(
                query: dbRef3,
                itemBuilder: (BuildContext context, DataSnapshot snapshot, Animation<double> animation, int index) {

                  Map completed = snapshot.value as Map;
                  completed['key'] = snapshot.key;

                  return  listItem3(completed: completed);
                },

              ),
            ),
          ],
        ),
      ),
    );
  }
}
