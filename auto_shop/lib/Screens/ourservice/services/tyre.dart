import 'package:auto_shop/Screens/ourservice/services/wash.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../../core/models/lesson.dart';
import '../detail_page.dart';
import 'paint.dart';
import '../myservice_order_Screen.dart';
import 'engine.dart';
import 'mentainance.dart';
import 'window.dart';

class Tyre extends StatefulWidget {
  const Tyre({Key? key}) : super(key: key);

  @override
  State<Tyre> createState() => _TyreState();
}

class _TyreState extends State<Tyre> {

  int selectedIndex = 4 ;
  double width = 50;
  double height = 30;
  PageController pageController = PageController();
  late List lessons;

  Query dbRef = FirebaseDatabase.instance.ref().child('shops').orderByChild('category').equalTo('Tyre and Wheels');

  Widget listItem({required Map shops}){
    return Card(
      elevation: 8.0,
      margin: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 6.0),
      child: Container(
        decoration: const BoxDecoration(color: Color.fromRGBO(64, 75, 96, .9)),
        child: ListTile(
          contentPadding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
          leading: Container(
            padding: const EdgeInsets.only(right: 12.0),
            decoration: const BoxDecoration(
                border: Border(
                    right: BorderSide(width: 1.0, color: Colors.white24))),
            child: const Icon(Icons.car_repair, color: Colors.white),
          ),
          title: Text(
            shops['name'],
            style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
          trailing: Icon(Icons.keyboard_arrow_right, color: Colors.white, size: 30.0),
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => DetailPage(shop: shops)));
          },
        ),
      ),
    );
    // makeCard(shops[index], context);


  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:  AppBar(
        //automaticallyImplyLeading: false,
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.deepOrangeAccent, Colors.orange],
              begin: FractionalOffset(0.0, 0.0),
              end: FractionalOffset(1.0, 0.0),
              stops: [0.0, 1.0],
              tileMode: TileMode.clamp,
            ),
          ),
        ),
        title: const Text(
          "Tyre and Wheels",
          style: TextStyle(
            fontSize: 20,
            letterSpacing: 1.5,
            fontWeight: FontWeight.bold,
            fontFamily: "Brand-Regular",
          ),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: Image.asset(
              "assets/icons/service.png",
              color: Colors.white,
            ),
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (_) => const MyServiceOrderScren()));
            },
          ),
        ],
      ),
      body:  Row(
        children: [
          LayoutBuilder(builder: (context, constraint){
            return SingleChildScrollView(
              child: ConstrainedBox(
                constraints: BoxConstraints(
                  minHeight: constraint.maxHeight,
                ),
                child: IntrinsicHeight(
                    child: NavigationRail(
                      backgroundColor: Colors.deepOrange,
                      selectedIndex: selectedIndex,
                      labelType: NavigationRailLabelType.selected,
                      onDestinationSelected: (index) {
                        setState(() {
                          selectedIndex = index;
                          pageController.animateToPage(
                            index,
                            duration: Duration(milliseconds: 250),
                            curve: Curves.easeInOut,
                          );
                        });
                      },
                      destinations: [
                        NavigationRailDestination(
                          icon: GestureDetector(
                            onTap: () {
                              Navigator.pop(context);
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (_) => const Wash()));
                            },
                            child: Image.asset(
                              "assets/icons/car_wash.png",
                              width: width,
                              height: height,
                              color: (selectedIndex == 0)
                                  ? Colors.white
                                  : Colors.white70,
                            ),
                          ),
                          label: Text(""),
                        ),
                        NavigationRailDestination(
                          icon: GestureDetector(
                            onTap: () {
                              Navigator.pop(context);
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (_) => const Engine()));
                            },
                            child: Image.asset(
                              "assets/icons/car_repair.png",
                              width: width,
                              height: height,
                              color: (selectedIndex == 1)
                                  ? Colors.white
                                  : Colors.white70,
                            ),
                          ),
                          label: Text(""),
                        ),
                        NavigationRailDestination(
                          icon: GestureDetector(
                            onTap: () {
                              Navigator.pop(context);
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (_) => const Mentainance()));
                            },
                            child: Image.asset(
                              "assets/icons/car_maintance.png",
                              width: width,
                              height: height,
                              color: (selectedIndex == 2)
                                  ? Colors.white
                                  : Colors.white70,
                            ),
                          ),
                          label: Text(""),
                        ),
                        NavigationRailDestination(
                          icon: GestureDetector(
                            onTap: () {
                              Navigator.pop(context);
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (_) => const Paint()));
                            },
                            child: Image.asset(
                              "assets/icons/car_paint.png",
                              width: width,
                              height: height,
                              color: (selectedIndex == 3)
                                  ? Colors.white
                                  : Colors.white70,
                            ),
                          ),
                          label: Text(""),
                        ),
                        NavigationRailDestination(
                          icon: GestureDetector(
                            onTap: () {
                              Navigator.pop(context);
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (_) => const Tyre()));
                            },
                            child: Image.asset(
                              "assets/icons/car_tyre.png",
                              width: width,
                              height: height,
                              color: (selectedIndex == 4)
                                  ? Colors.white
                                  : Colors.white70,
                            ),
                          ),
                          label: Text(""),
                        ),
                        NavigationRailDestination(
                          icon: GestureDetector(
                            onTap: () {
                              Navigator.pop(context);
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (_) => const Window()));
                            },
                            child: Image.asset(
                              "assets/icons/car_windshield.png",
                              width: width,
                              height: height,
                              color: (selectedIndex == 5)
                                  ? Colors.white
                                  : Colors.white70,
                            ),
                          ),
                          label: Text(""),
                        ),
                      ],
                    )
                ),
              ),
            );
          }),
          Expanded(
            child: Container(
              child: FirebaseAnimatedList(
                query: dbRef,
                itemBuilder: (BuildContext context, DataSnapshot snapshot, Animation<double> animation, int index) {

                  Map shops = snapshot.value as Map;
                  shops['key'] = snapshot.key;

                  return listItem(shops: shops);
                },

              ),
            ),
          )
        ],
      ),
    );
  }
}


