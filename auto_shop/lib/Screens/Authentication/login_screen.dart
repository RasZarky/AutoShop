import 'package:auto_shop/Screens/Authentication/signup_screen.dart';
import 'package:auto_shop/Screens/map_view/pages/home_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import '../../widgets/customTextField.dart';
import '../../widgets/progressdialog.dart';
import '../dashboard/dashboard.dart';


class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  final GlobalKey<ScaffoldState> scaffoldkey = GlobalKey<ScaffoldState>();
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();

  final _emailTextEditingController = TextEditingController();
  final _passwordTextEditingController = TextEditingController();
  late String userloginemail;
  late String userloginpassword;
  bool isLoading = false;

  @override
  void initState(){
    super.initState();
    bool isChecking = true;

     Center(
       child: Visibility(visible: isChecking, child: const SpinKitThreeBounce(
        color: Colors.deepOrangeAccent,
        size: 25.0,
    ),),
     );

    User? user = FirebaseAuth.instance.currentUser;
    if(user != null){
      Future.delayed(Duration.zero, (){
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (c) => HomePage(),
            ),
            result: (Route<dynamic> route ) => false
        );
      });

    }

    setState((){
      isChecking = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Center(
          child: Scaffold(
            key: scaffoldkey,
            body: SingleChildScrollView(
              child: Column(
                children: [
                  const SizedBox(height: 100),

                  Image.asset(
                    "assets/authenticaiton/logo.png",
                    width: 150,
                  ),

                  const Text(
                    "Welcome back!",
                    style: TextStyle(
                      fontSize: 30,
                      fontFamily: 'Brand-Bold',
                      letterSpacing: 1,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 10),

                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16.0),
                    child: Text(
                      "Log in to your existing account on AutoShop",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 18,
                        fontFamily: 'Brand-Regular',
                        letterSpacing: 1,
                        color: Colors.grey,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),

                  const SizedBox(height: 150),

                  Form(
                    key: _formkey,
                    child: Column(
                      children: [
                        CustomTextField(
                          controller: _emailTextEditingController,
                          textInputType: TextInputType.emailAddress,
                          data: Icons.email_outlined,
                          hintText: "Email",
                          labelText: "Email",
                          isObsecure: false,
                        ),

                        const SizedBox(height: 15),

                        CustomTextField(
                          controller: _passwordTextEditingController,
                          textInputType: TextInputType.text,
                          data: Icons.lock_outline,
                          hintText: "Password",
                          labelText: "Password",
                          isObsecure: true,
                        ),
                      ],
                    ),
                  ),


                  const SizedBox(height: 20),

                  Container(
                    width: double.infinity,
                    height: 50,
                    margin: const EdgeInsets.symmetric(horizontal: 16),

                    child: ElevatedButton(
                      style: const ButtonStyle(
                        backgroundColor: MaterialStatePropertyAll(Colors.deepOrange),
                      ),
                      child: const Text(
                        "Login",
                        style: TextStyle(
                          fontSize: 22,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),

                      onPressed: () async {
                        //-------------check Internet Connectivity--------------------//

                        //----------------checking textfield--------------------//

                        userloginemail = _emailTextEditingController.text;
                        userloginpassword = _passwordTextEditingController.text;
                        if (!userloginemail.contains("@")) {

                          var snackBar = const SnackBar(
                              content: Text( "Please provide a valid email address",
                                textAlign: TextAlign.center,
                                style: TextStyle(fontSize: 15),
                              ),
                          );
                          ScaffoldMessenger.of(context).showSnackBar(snackBar);

                          //showSnackBar("Please provide a valid email address");
                          return;
                        }

                        if (userloginpassword.length < 8) {

                          var snackBar = const SnackBar(
                            content: Text( "Password must be at least 8 characters",
                              textAlign: TextAlign.center,
                              style: TextStyle(fontSize: 15),
                            ),
                          );
                          ScaffoldMessenger.of(context).showSnackBar(snackBar);

                          //showSnackBar("Password must be at least 8 characters");
                          return;
                        }

                        final email = userloginemail.trim();
                        final password = userloginpassword.trim();

                        FirebaseAuth auth = FirebaseAuth.instance;
                        User? user;

                        setState(() {
                          isLoading = true;
                        });

                        try {
                        UserCredential userCredential = await auth.signInWithEmailAndPassword(
                        email: email,
                        password: password,
                        );
                        user = userCredential.user;
                        } on FirebaseAuthException catch (e) {
                        if (e.code == 'user-not-found') {
                        print('No user found for that email.');
                        var snackBar = const SnackBar(
                          content: Text( "User not found",
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 15),
                          ),
                          );
                          ScaffoldMessenger.of(context).showSnackBar(snackBar);

                        } else if (e.code == 'wrong-password') {
                        print('Wrong password provided.');
                        var snackBar = const SnackBar(
                          content: Text( "Wrong password provided",
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 15),
                          ),
                          );
                          ScaffoldMessenger.of(context).showSnackBar(snackBar);

                        }

                        }

                        setState(() {
                          isLoading = false;
                        });

                        if (user != null){
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (c) => HomePage(),
                            ),
                          );
                        }
                      },
                    ),
                  ),

                  Center(child: Visibility(visible: isLoading, child:  const SpinKitThreeBounce(
                    color: Colors.blue,
                    size: 25.0,
                  ),)),

                  const SizedBox(height: 10),

                  const Text(
                    'OR',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 15),

                  Center(
                    child: Container(
                      height: 2.0,
                      width: MediaQuery.of(context).size.width / 2 - 30,
                      color: Colors.black45,
                    ),
                  ),

                  const SizedBox(height: 15),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      const Text(
                        'Don\'t have an account ?',
                        style: TextStyle(
                          fontSize: 18.0,
                          color: Colors.blueGrey,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (c) => const SignUpScreen(),
                            ),
                          );
                        },
                        child: Text(
                          ' Sign up',
                          style: TextStyle(
                            color: Colors.red[300],
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 10),
                ],
              ),
            ),
          ),
        )
    );
  }

}
