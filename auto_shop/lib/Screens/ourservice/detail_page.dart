import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:bottom_picker/bottom_picker.dart';

class DetailPage extends StatelessWidget {

  final Map shop;
  DetailPage({Key? key, required this.shop}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // final levelIndicator = Container(
    //   child: Container(
    //     child: LinearProgressIndicator(
    //       minHeight: 20.0,
    //         backgroundColor: const Color.fromRGBO(209, 224, 224, 0.2),
    //         value: shop[''],
    //         valueColor: const AlwaysStoppedAnimation(Colors.green)),
    //   ),
    // );

    // final coursePrice = Container(
    //   padding: const EdgeInsets.all(7.0),
    //   decoration: BoxDecoration(
    //       border: Border.all(color: Colors.white),
    //       borderRadius: BorderRadius.circular(5.0)),
    //   child: Text(
    //     "GHC ${shop['price']}",
    //     style: const TextStyle(color: Colors.white),
    //   ),
    // );

    final topContentText = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        const SizedBox(height: 130.0),
        const Icon(
          Icons.directions_car,
          color: Colors.white,
          size: 40.0,
        ),
        const SizedBox(
          width: 90.0,
          child: Divider(color: Colors.green),
        ),
        const SizedBox(height: 10.0),
        Text(
          shop['name'],
          style: const TextStyle(color: Colors.white, fontSize: 45.0),
        ),
        const SizedBox(height: 5.0),
        Text(
          shop['location'],
          style: const TextStyle(color: Colors.white, fontSize: 20.0),
        ),
        const SizedBox(height: 10.0),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            // Expanded(flex: 1, child: levelIndicator),
            // Expanded(
            //     flex: 6,
            //     child: Padding(
            //         padding: const EdgeInsets.only(left: 10.0),
            //         child: Text(
            //           shop['description'],
            //           style: const TextStyle(color: Colors.white),
            //         ))),
            // Expanded(flex: 2, child: coursePrice)
          ],
        ),
      ],
    );

    final topContent = Stack(
      children: <Widget>[
        Container(
            padding: const EdgeInsets.only(left: 10.0),
            height: MediaQuery.of(context).size.height * 0.5,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/drive.jpg"),
                fit: BoxFit.cover,
              ),
            )),
        Container(
          height: MediaQuery.of(context).size.height * 0.5,
          padding: const EdgeInsets.all(40.0),
          width: MediaQuery.of(context).size.width,
          decoration: const BoxDecoration(color: Color.fromRGBO(58, 66, 86, .9)),
          child: Center(
            child: topContentText,
          ),
        ),
        Positioned(
          left: 8.0,
          top: 60.0,
          child: InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: const Icon(Icons.arrow_back, color: Colors.white),
          ),
        )
      ],
    );

    final bottomContentText = Text(
      shop['description'],
      style: TextStyle(fontSize: 18.0),
    );

    final readButton = Container(
        padding: EdgeInsets.symmetric(vertical: 16.0),
        width: MediaQuery.of(context).size.width,
        child: ElevatedButton(
          onPressed: () => {
          BottomPicker.dateTime(
          title:  'Set the event time and date',
          titleStyle:  TextStyle(
          fontWeight:  FontWeight.bold,
          fontSize:  15,
          color:  Colors.black,
          ),
          onSubmit: (date) async {
            User? user = FirebaseAuth.instance.currentUser;
            String? email = user?.email;
            final dbRef = FirebaseDatabase.instance.ref().child('orders');
            final snapshot = await dbRef.orderByKey().equalTo(shop["name"].replaceAll(RegExp('[^A-Za-z0-9]'), '')
                +date.toString().replaceAll(RegExp('[^A-Za-z0-9]'), '')).get();
            if(snapshot.exists){

              var snackBar = const SnackBar(
                content: Text( "Time not available",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 15),
                ),
              );
              ScaffoldMessenger.of(context).showSnackBar(snackBar);
              return;

            }else{

              dbRef.child(shop["name"].replaceAll(RegExp('[^A-Za-z0-9]'), '')+date.toString().replaceAll(RegExp('[^A-Za-z0-9]'), '')).set({
                'orderId': shop['name']+date.toString(),
                'shop': shop['name'],
                'manager': shop['manager'],
                'date': date.toString(),
                'user': email,
                'price': shop['price'],
                'status': 'pending',
              });
              var snackBar = const SnackBar(
                content: Text( "Booking successful",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 15),
                ),
              );
              ScaffoldMessenger.of(context).showSnackBar(snackBar);
            }
          },
          onClose: () {
          print('Picker closed');
          },
          iconColor:  Colors.black,
          minDateTime:  DateTime.now(),
          maxDateTime:  DateTime.now().add(const Duration(days: 30)),
          initialDateTime:  DateTime.now(),
          gradientColors: [Color(0xfffdcbf1), Color(0xffe6dee9)],
          ).show(context)
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.deepOrangeAccent
          ),
          child:
              const Text("BOOK SERVICE", style: TextStyle(color: Colors.white)),
        ));

    final bottomContent = Container(
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.all(40.0),
      child: Center(
        child: Column(
          children: <Widget>[bottomContentText, readButton],
        ),
      ),
    );

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[topContent, bottomContent],
        ),
      ),
    );
  }
}
