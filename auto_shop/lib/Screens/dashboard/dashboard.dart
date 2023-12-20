import 'package:auto_shop/Screens/dashboard/style/colors.dart';
import 'package:auto_shop/Screens/dashboard/style/style.dart';
import 'package:auto_shop/Screens/ourservice/services/tyre.dart';
import 'package:auto_shop/Screens/ourservice/services/window.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../core/constants/color_constants.dart';
import '../../responsive.dart';
import '../ourservice/myservice_order_Screen.dart';
import '../ourservice/services/engine.dart';
import '../ourservice/services/paint.dart';
import '../ourservice/services/mentainance.dart';
import '../ourservice/services/wash.dart';
import '../profile/profile.dart';
import 'component/appBarActionItems.dart';
import 'component/header.dart';

import 'component/infoCard.dart';
import 'component/paymentDetailList.dart';
import 'component/sideMenu.dart';
import 'config/size_config.dart';


class DashboardScreen extends StatelessWidget {
  GlobalKey<ScaffoldState> _drawerKey = GlobalKey();

  @override
  Widget build(BuildContext context) {

    User? user = FirebaseAuth.instance.currentUser;

    SizeConfig().init(context);
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
                Navigator.push(context, MaterialPageRoute(builder: (_) => DashboardScreen()));
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

            Container(
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
                    backgroundImage: AssetImage("assets/icons/unknown.svg"),
                  ),

                  Padding(
                    padding:
                    EdgeInsets.symmetric(horizontal: defaultPadding / 2),
                    child: Text("about"),
                  ),
                  Icon(Icons.keyboard_arrow_right),
                ],
              ),
            ),

          ],
        ),
      ),
      appBar: !Responsive.isDesktop(context)
          ? AppBar(
              elevation: 0,
              backgroundColor: AppColors.white,
              leading: IconButton(
                  onPressed: () {
                    _drawerKey.currentState?.openDrawer();
                  },
                  icon: Icon(Icons.menu, color: AppColors.black)),
              actions: [
                AppBarActionItems(),
              ],
            )
          : PreferredSize(
              preferredSize: Size.zero,
              child: SizedBox(),
            ),
      body: SafeArea(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (Responsive.isDesktop(context))
              Expanded(
                flex: 1,
                child: SideMenu(),
              ),
            Expanded(
                flex: 10,
                child: SafeArea(
                  child: SingleChildScrollView(
                    padding: EdgeInsets.symmetric(vertical: 30, horizontal: 30),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Header(),
                        SizedBox(
                          height: SizeConfig.blockSizeVertical! * 4,
                        ),
                        // SizedBox(
                        //   width: SizeConfig.screenWidth,
                        //   child: Wrap(
                        //     spacing: 20,
                        //     runSpacing: 20,
                        //     alignment: WrapAlignment.spaceBetween,
                        //     children: [
                        //       GestureDetector(
                        //         onTap: (){
                        //           Navigator.push(context,
                        //           MaterialPageRoute(builder: (_) => const Wash()));
                        //           },
                        //         child: InfoCard(
                        //             icon: "assets/drop.svg",
                        //             label: 'wash the \nexterior and \ninterior \nof your vehicle',
                        //             amount: 'Car wash'),
                        //       ),
                        //
                        //       GestureDetector(
                        //         onTap: (){
                        //           Navigator.push(context,
                        //             MaterialPageRoute(builder: (_) => const Engine()));
                        //           },
                        //         child: InfoCard(
                        //             icon: 'assets/icons/menu_setting.svg',
                        //             label: 'Engine health \nand more',
                        //             amount: 'Engine Service'),
                        //       ),
                        //
                        //       GestureDetector(
                        //         onTap: (){
                        //           Navigator.push(context,
                        //           MaterialPageRoute(builder: (_) => const Mentainance()));
                        //           },
                        //         child: InfoCard(
                        //             icon: 'assets/icons/menu_tran.svg',
                        //             label: 'Maintain and \nyour vehicle',
                        //             amount: 'General \nMaintenance'),
                        //       ),
                        //
                        //       GestureDetector(
                        //        onTap: () {
                        //           Navigator.push(context,
                        //           MaterialPageRoute(builder: (_) => const Paint()));
                        //           },
                        //         child: InfoCard(
                        //             icon: 'assets/invoice.svg',
                        //             label: 'Get a new \ncoat',
                        //             amount: 'Paint Job'),
                        //       ),
                        //
                        //       GestureDetector(
                        //         onTap: (){
                        //           Navigator.push(context,
                        //               MaterialPageRoute(builder: (_) => const Tyre()));
                        //         },
                        //         child: InfoCard(
                        //             icon: 'assets/icons/menu_tran.svg',
                        //             label: 'Change your \ntyre and wheels',
                        //             amount: 'Tyre \nService'),
                        //       ),
                        //
                        //       GestureDetector(
                        //         onTap: () {
                        //           Navigator.push(context,
                        //               MaterialPageRoute(builder: (_) => const Window()));
                        //         },
                        //         child: InfoCard(
                        //             icon: 'assets/invoice.svg',
                        //             label: 'Get a new \nglass',
                        //             amount: 'Windows and \nWindsheild'),
                        //       ),
                        //     ],
                        //   ),
                        // ),

                        SizedBox(
                          height: SizeConfig.blockSizeVertical! * 4,
                        ),

                        GestureDetector(
                          onTap:(){
                            Navigator.push(context,
                                MaterialPageRoute(builder: (_) => const Mentainance()));
                          },
                            child: Text('All services')),



                        //if (!Responsive.isDesktop(context)) //PaymentDetailList()
                      ],
                    ),
                  ),
                )),
            if (Responsive.isDesktop(context))
              Expanded(
                flex: 4,
                child: SafeArea(
                  child: Container(
                    width: double.infinity,
                    height: SizeConfig.screenHeight,
                    decoration: BoxDecoration(color: AppColors.secondaryBg),
                    child: SingleChildScrollView(
                      padding:
                          EdgeInsets.symmetric(vertical: 30, horizontal: 30),
                      child: Column(
                        children: [
                          AppBarActionItems(),
                          //PaymentDetailList(),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
