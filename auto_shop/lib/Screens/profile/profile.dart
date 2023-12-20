import 'package:auto_shop/Screens/Authentication/login_screen.dart';
import 'package:auto_shop/Screens/profile/widgets/profile_list_item.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import '../ourservice/myservice_order_Screen.dart';
import 'constants.dart';

class ProfileScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context);
    bool isLoading = false;

    User? user = FirebaseAuth.instance.currentUser;
    String? email = user?.email;

    var profileInfo = Expanded(
      child: Column(
        children: <Widget>[
          Container(
            height: kSpacingUnit.w * 10,
            width: kSpacingUnit.w * 10,
            margin: EdgeInsets.only(top: kSpacingUnit.w * 3),
            child: Stack(
              children: <Widget>[
                CircleAvatar(
                  radius: kSpacingUnit.w * 5,
                  backgroundImage: const AssetImage('assets/images/profile_pic.png'),
                ),
                Align(
                  alignment: Alignment.bottomRight,
                  child: Container(
                    height: kSpacingUnit.w * 2.5,
                    width: kSpacingUnit.w * 2.5,
                    decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.secondary,
                      shape: BoxShape.circle,
                    ),
                    child: Center(
                      heightFactor: kSpacingUnit.w * 1.5,
                      widthFactor: kSpacingUnit.w * 1.5,
                      child: Icon(
                        Icons.edit,
                        color: kDarkPrimaryColor,
                        size: ScreenUtil().setSp(kSpacingUnit.w * 1.5),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: kSpacingUnit.w * 2),
          // Text(
          //   'Clinton Amponsah',
          //   style: kTitleTextStyle,
          // ),
          SizedBox(height: kSpacingUnit.w * 0.5),
          Text(
            email!,
            style: kCaptionTextStyle,
          ),
          SizedBox(height: kSpacingUnit.w * 2),
          Container(
            height: kSpacingUnit.w * 4,
            width: kSpacingUnit.w * 20,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(kSpacingUnit.w * 3),
              color: Theme.of(context).colorScheme.secondary,
            ),
            child: Center(
              child: Text(
                '',
                style: kButtonTextStyle,
              ),
            ),
          ),
          Center(child: Visibility(visible: isLoading, child:  const SpinKitThreeBounce(
            color: Colors.blue,
            size: 25.0,
          ),)),
        ],
      ),
    );

    // var themeSwitcher = ThemeSwitcher(
    //   builder: (context) {
    //     return AnimatedCrossFade(
    //       duration: Duration(milliseconds: 200),
    //       crossFadeState:
    //       ThemeProvider.of(context).brightness == Brightness.dark
    //           ? CrossFadeState.showFirst
    //           : CrossFadeState.showSecond,
    //       firstChild: GestureDetector(
    //         onTap: () =>
    //             ThemeSwitcher.of(context).changeTheme(theme: kLightTheme),
    //         child: Icon(
    //           LineAwesomeIcons.sun,
    //           size: ScreenUtil().setSp(kSpacingUnit.w * 3),
    //         ),
    //       ),
    //       secondChild: GestureDetector(
    //         onTap: () =>
    //             ThemeSwitcher.of(context).changeTheme(theme: kDarkTheme),
    //         child: Icon(
    //           LineAwesomeIcons.moon,
    //           size: ScreenUtil().setSp(kSpacingUnit.w * 3),
    //         ),
    //       ),
    //     );
    //   },
    // );

    var header = Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        SizedBox(width: kSpacingUnit.w * 3),
        GestureDetector(
          onTap: (){
            Navigator.pop(context);
          },
          child: Icon(
            Icons.arrow_back,
            size: ScreenUtil().setSp(kSpacingUnit.w * 3),
          ),
        ),
        profileInfo,
        //themeSwitcher,
        SizedBox(width: kSpacingUnit.w * 3),
      ],
    );


    return Scaffold(
            body: Column(
              children: <Widget>[
                SizedBox(height: kSpacingUnit.w * 5),
                header,
                Expanded(
                  child: ListView(
                    children: <Widget>[

                      GestureDetector(
                        onTap:(){
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                              builder: (c) => MyServiceOrderScren (),
                          )
                          );
                        },
                        child: ProfileListItem(
                          icon: Icons.history,
                          text: 'Purchase History',
                        ),
                      ),
                      GestureDetector(
                        onTap: (){
                          isLoading = true;

                          FirebaseAuth.instance.signOut();
                          FirebaseAuth.instance.authStateChanges()
                              .listen((User? user) {
                            if(user == null){
                              Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                    builder: (c) => const LoginScreen(),
                                  ),
                                  result: (Route<dynamic> route ) => false
                              );
                            }
                          });                        },
                        child: ProfileListItem(
                          icon: Icons.logout_rounded,
                          text: 'Logout',
                          hasNavigation: false,
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          );

  }
}
