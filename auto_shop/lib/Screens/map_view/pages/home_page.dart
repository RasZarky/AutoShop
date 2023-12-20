import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:latlong2/latlong.dart';
import '../../../core/constants/color_constants.dart';
import '../../dashboard/dashboard.dart';
import '../../ourservice/detail_page.dart';
import '../../ourservice/detail_page2.dart';
import '../../ourservice/myservice_order_Screen.dart';
import '../../ourservice/services/wash.dart';
import '../../profile/profile.dart';
import '../constants/app_constants.dart';
import '../models/map_marker_model.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  final pageController = PageController();
  GlobalKey<ScaffoldState> _drawerKey = GlobalKey();

  int selectedIndex = 0;
  var currentLocation = AppConstants.myLocation;

  late final MapController mapController;

  @override
  void initState() {
    super.initState();
    mapController = MapController();
    //_getCurrentLocation();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _drawerKey,
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [

            const UserAccountsDrawerHeader(
              decoration: BoxDecoration(
                color: Colors.white,
              ),
              accountName: Text(''),
              accountEmail: Text(''),
              currentAccountPicture: FlutterLogo(),
            ),

            GestureDetector(
              onTap: (){
                Navigator.pop(context);
                Navigator.push(context, MaterialPageRoute(builder: (_) => HomePage()));
              },
              child: Container(
                margin: const EdgeInsets.only(left: defaultPadding),
                padding: const EdgeInsets.symmetric(
                  horizontal: defaultPadding,
                  vertical: defaultPadding / 2,
                ),
                decoration: BoxDecoration(

                  color: secondaryColor,
                  borderRadius: const BorderRadius.all(Radius.circular(10)),
                  border: Border.all(color: primaryColor.withOpacity(0.15)),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    CircleAvatar(
                      backgroundImage: AssetImage("assets/authenticaiton/welcome.png"),
                    ),

                    Padding(
                      padding:
                      EdgeInsets.symmetric(horizontal: defaultPadding / 2),
                      child: Text("Home"),
                    ),
                    Icon(Icons.keyboard_arrow_right),
                  ],
                ),
              ),
            ),

            GestureDetector(
              onTap: (){
                Navigator.pop(context);
                Navigator.push(context, MaterialPageRoute(builder: (_) =>  Wash()));
              },
              child: Container(
                margin: const EdgeInsets.only(left: defaultPadding),
                padding: const EdgeInsets.symmetric(
                  horizontal: defaultPadding,
                  vertical: defaultPadding / 2,
                ),
                decoration: BoxDecoration(

                  color: secondaryColor,
                  borderRadius: const BorderRadius.all(Radius.circular(10)),
                  border: Border.all(color: primaryColor.withOpacity(0.15)),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    CircleAvatar(
                      backgroundImage: AssetImage("assets/authenticaiton/logo.png"),
                    ),

                    Padding(
                      padding:
                      EdgeInsets.symmetric(horizontal: defaultPadding / 2),
                      child: Text("Services"),
                    ),
                    Icon(Icons.keyboard_arrow_right),
                  ],
                ),
              ),
            ),

            GestureDetector(
              onTap: (){
                Navigator.pop(context);
                Navigator.push(context, MaterialPageRoute(builder: (_) =>  MyServiceOrderScren()));
              },
              child: Container(
                margin: const EdgeInsets.only(left: defaultPadding),
                padding: EdgeInsets.symmetric(
                  horizontal: defaultPadding,
                  vertical: defaultPadding / 2,
                ),
                decoration: BoxDecoration(

                  color: secondaryColor,
                  borderRadius: const BorderRadius.all(Radius.circular(10)),
                  border: Border.all(color: primaryColor.withOpacity(0.15)),
                ),
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CircleAvatar(
                      backgroundImage: AssetImage("assets/authenticaiton/test.png"),
                    ),

                    Padding(
                      padding:
                      EdgeInsets.symmetric(horizontal: defaultPadding / 2),
                      child: Text("Booked Services"),
                    ),
                    Icon(Icons.keyboard_arrow_right),
                  ],
                ),
              ),
            ),

            // Container(
            //   margin: const EdgeInsets.only(left: defaultPadding),
            //   padding: const EdgeInsets.symmetric(
            //     horizontal: defaultPadding,
            //     vertical: defaultPadding / 2,
            //   ),
            //   decoration: BoxDecoration(
            //
            //     color: secondaryColor,
            //     borderRadius: const BorderRadius.all(Radius.circular(10)),
            //     border: Border.all(color: primaryColor.withOpacity(0.15)),
            //   ),
            //   child: const Row(
            //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //     children: [
            //       CircleAvatar(
            //         backgroundImage: AssetImage("assets/splash/categoryicon.png"),
            //       ),
            //
            //       Padding(
            //         padding:
            //         EdgeInsets.symmetric(horizontal: defaultPadding / 2),
            //         child: Text("My car"),
            //       ),
            //       Icon(Icons.keyboard_arrow_right),
            //     ],
            //   ),
            // ),

            GestureDetector(
              onTap: (){
                Navigator.pop(context);
                Navigator.push(context, MaterialPageRoute(builder: (_) =>  ProfileScreen()));
              },
              child: Container(
                margin: const EdgeInsets.only(left: defaultPadding),
                padding: const EdgeInsets.symmetric(
                  horizontal: defaultPadding,
                  vertical: defaultPadding / 2,
                ),
                decoration: BoxDecoration(

                  color: secondaryColor,
                  borderRadius: const BorderRadius.all(Radius.circular(10)),
                  border: Border.all(color: primaryColor.withOpacity(0.15)),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    CircleAvatar(
                      backgroundImage: AssetImage("assets/images/profile_pic.png"),
                    ),

                    Padding(
                      padding:
                      EdgeInsets.symmetric(horizontal: defaultPadding / 2),
                      child: Text("My profile"),
                    ),
                    Icon(Icons.keyboard_arrow_right),
                  ],
                ),
              ),
            ),

            // Container(
            //   margin: const EdgeInsets.only(left: defaultPadding),
            //   padding: const EdgeInsets.symmetric(
            //     horizontal: defaultPadding,
            //     vertical: defaultPadding / 2,
            //   ),
            //   decoration: BoxDecoration(
            //
            //     color: secondaryColor,
            //     borderRadius: const BorderRadius.all(Radius.circular(10)),
            //     border: Border.all(color: primaryColor.withOpacity(0.15)),
            //   ),
            //   child: Row(
            //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //     children: const [
            //       CircleAvatar(
            //         backgroundImage: AssetImage("assets/icons/unknown.svg"),
            //       ),
            //
            //       Padding(
            //         padding:
            //         EdgeInsets.symmetric(horizontal: defaultPadding / 2),
            //         child: Text("about"),
            //       ),
            //       Icon(Icons.keyboard_arrow_right),
            //     ],
            //   ),
            // ),

          ],
        ),
      ),
      appBar: AppBar(
        backgroundColor: Colors.orange,
        title: const Text('Auto Shop'),
      ),
      body: Stack(
        children: [
          FlutterMap(
            mapController: mapController,
            options: MapOptions(
              minZoom: 5,
              maxZoom: 18,
              zoom: 16,
              center: currentLocation,
            ),
            layers: [
              TileLayerOptions(
                urlTemplate:
                    "https://api.mapbox.com/styles/v1/raszarky/cllfjl3gm014i01p83tk8dzks/tiles/256/{z}/{x}/{y}@2x?access_token=pk.eyJ1IjoicmFzemFya3kiLCJhIjoiY2xsZmVsb3pvMGd6dTNnbzNzZWVzZTB5ZCJ9.pfiR7O6YJvmXITmezxC85Q",
                additionalOptions: {
                  'mapStyleId': AppConstants.mapBoxStyleId,
                  'accessToken': AppConstants.mapBoxAccessToken,
                },
              ),
              MarkerLayerOptions(
                markers: [
                  for (int i = 0; i < mapMarkers.length; i++)
                    Marker(
                      height: 40,
                      width: 40,
                      point: mapMarkers[i].Location ?? AppConstants.myLocation,
                      builder: (_) {
                        return GestureDetector(
                          onTap: () {
                            pageController.animateToPage(
                              i,
                              duration: const Duration(milliseconds: 500),
                              curve: Curves.easeInOut,
                            );
                            selectedIndex = i;
                            currentLocation = mapMarkers[i].Location ??
                                AppConstants.myLocation;
                             _animatedMapMove(currentLocation, 15.0);
                            setState(() {});
                          },
                          child: AnimatedScale(
                            duration: const Duration(milliseconds: 500),
                            scale: selectedIndex == i ? 1 : 0.7,
                            child: AnimatedOpacity(
                              duration: const Duration(milliseconds: 500),
                              opacity: selectedIndex == i ? 1 : 0.5,
                              child: SvgPicture.asset(
                                'assets/icons/map_marker.svg',
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                ],
              ),
            ],
          ),
          Positioned(
            left: 0,
            right: 0,
            bottom: 2,
            height: MediaQuery.of(context).size.height * 0.3,
            child: PageView.builder(
              controller: pageController,
              onPageChanged: (value) {
                selectedIndex = value;
                currentLocation =
                    mapMarkers[value].Location ?? AppConstants.myLocation;
                _animatedMapMove(currentLocation, 15.0);
                setState(() {});
              },
              itemCount: mapMarkers.length,
              itemBuilder: (_, index) {
                final item = mapMarkers[index];
                return Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Card(
                    elevation: 5,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    color: const Color.fromARGB(255, 255, 255, 255),
                    child: Row(
                      children: [
                        const SizedBox(width: 10),
                        Expanded(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SizedBox(height: 50,),
                              // Expanded(
                              //   child: ListView.builder(
                              //     padding: EdgeInsets.zero,
                              //     scrollDirection: Axis.horizontal,
                              //     itemCount: item.rating,
                              //     itemBuilder:
                              //         (BuildContext context, int index) {
                              //       return const Icon(
                              //         Icons.star,
                              //         color: Colors.orange,
                              //       );
                              //     },
                              //   ),
                              // ),
                              Expanded(
                                flex: 2,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      item.name ?? '',
                                      style: const TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    const SizedBox(height: 10),
                                    Text(
                                      item.location ?? '',
                                      style: const TextStyle(
                                        fontSize: 14,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(width: 10),
                        GestureDetector(
                          onTap: (){

                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => DetailPage2(shop: item)));

                          },
                          child: Expanded(
                            child: Padding(
                              padding: const EdgeInsets.all(4.0),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(10),
                                child: Image.asset(
                                  item.image ?? '',
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(width: 10),
                      ],
                    ),
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }

  void _animatedMapMove(LatLng destLocation, double destZoom) {
    // Create some tweens. These serve to split up the transition from one location to another.
    // In our case, we want to split the transition be<tween> our current map center and the destination.
    final latTween = Tween<double>(
        begin: mapController.center.latitude, end: destLocation.latitude);
    final lngTween = Tween<double>(
        begin: mapController.center.longitude, end: destLocation.longitude);
    final zoomTween = Tween<double>(begin: mapController.zoom, end: destZoom);

    // Create a animation controller that has a duration and a TickerProvider.
    var controller = AnimationController(
        duration: const Duration(milliseconds: 1000), vsync: this);
    // The animation determines what path the animation will take. You can try different Curves values, although I found
    // fastOutSlowIn to be my favorite.
    Animation<double> animation =
        CurvedAnimation(parent: controller, curve: Curves.fastOutSlowIn);

    controller.addListener(() {
      mapController.move(
        LatLng(latTween.evaluate(animation), lngTween.evaluate(animation)),
        zoomTween.evaluate(animation),
      );
    });

    animation.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        controller.dispose();
      } else if (status == AnimationStatus.dismissed) {
        controller.dispose();
      }
    });

    controller.forward();
  }
}
