import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import '../../widgets/customTextField.dart';
import 'login_screen.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {

  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  final GlobalKey<ScaffoldState> scaffoldkey = GlobalKey<ScaffoldState>();

  final _nameTextEditingController = TextEditingController();
  final _emailTextEditingController = TextEditingController();
  final _passwordTextEditingController = TextEditingController();
  final _cpasswordTextEditingController = TextEditingController();
  String userImage = "";
  //late File avatarImageFile;
  final databaseRef = FirebaseDatabase.instance.ref();
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {

    var size = MediaQuery.of(context).size;
    /*Future getImage() async {
      var image = await ImagePicker.pickImage(source: ImageSource.gallery);
      setState(() {
        avatarImageFile = image as File;
      });
    }*/

    return SafeArea(
      child: Scaffold(
        key: scaffoldkey,
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 25),

              const Text(
                "Let\'s Get Started!",
                style: TextStyle(
                  fontSize: 30,
                  fontFamily: 'Brand-Bold',
                  letterSpacing: 1,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 15),

              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.0),
                child: Text(
                  "Create an account with AutoShop to use all features",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 20,
                    fontFamily: 'Brand-Regular',
                    letterSpacing: 1,
                    color: Colors.grey,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),

              const SizedBox(height: 50),

              SizedBox(
                width: 130,
                child: GestureDetector(
                  onTap: () {
                    //getImage();
                  },
                  child: CircleAvatar(
                    radius: size.width * 0.15,
                    backgroundColor: Colors.deepOrange,
                    backgroundImage: /*(avatarImageFile != null)
                        ? FileImage(avatarImageFile)
                        :*/ const AssetImage("assets/authenticaiton/user_icon.png"),
                  ),
                ),
              ),

              const SizedBox(height: 50),

              Form(
                key: _formkey,
                child: Column(
                  children: [
                    CustomTextField(
                      controller: _nameTextEditingController,
                      textInputType: TextInputType.text,
                      data: Icons.account_circle,
                      hintText: "Full Name",
                      labelText: "Full Name",
                      isObsecure: false,
                    ),

                    const SizedBox(height: 10),

                    CustomTextField(
                      controller: _emailTextEditingController,
                      textInputType: TextInputType.emailAddress,
                      data: Icons.email_outlined,
                      hintText: "Email",
                      labelText: "Email",
                      isObsecure: false,
                    ),

                    const SizedBox(height: 10),

                    CustomTextField(
                      controller: _passwordTextEditingController,
                      textInputType: TextInputType.text,
                      data: Icons.lock_outline,
                      hintText: "Password",
                      labelText: "Password",
                      isObsecure: true,
                    ),

                    const SizedBox(height: 10),

                    CustomTextField(
                      controller: _cpasswordTextEditingController,
                      textInputType: TextInputType.text,
                      data: Icons.lock_outline,
                      hintText: "Confirm Password",
                      labelText: "Confirm Password",
                      isObsecure: true,
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 15),

              //--------------------Create Button-----------------------//
              Container(
                width: double.infinity,
                height: 50,
                margin: const EdgeInsets.symmetric(horizontal: 16),
                child: ElevatedButton(
                  style: const ButtonStyle(
                    backgroundColor: MaterialStatePropertyAll(Colors.deepOrange),
                  ),

                  onPressed: () async {
                    //-------------Internet Connectivity--------------------//

                    //----------------checking textfield--------------------//
                    if (_nameTextEditingController.text.length < 4) {
                      var snackBar = const SnackBar(
                        content: Text( "Name must be at least 4 characters",
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 15),
                        ),
                      );
                      ScaffoldMessenger.of(context).showSnackBar(snackBar);
                      //showSnackBar("Name must be at least 4 characters");
                      return;
                    }
                    if (!_emailTextEditingController.text.contains("@")) {
                      var snackBar = const SnackBar(
                        content: Text( "Please provide a valid email address",
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 15),
                        ),
                      );
                      ScaffoldMessenger.of(context).showSnackBar(snackBar);
                     // showSnackBar("Please provide a valid email address");
                      return;
                    }

                    if (_passwordTextEditingController.text.length < 8) {
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
                    if (_passwordTextEditingController.text !=
                        _cpasswordTextEditingController.text) {
                      var snackBar = const SnackBar(
                        content: Text( "Password does not match",
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 15),
                        ),
                      );
                      ScaffoldMessenger.of(context).showSnackBar(snackBar);
                      //showSnackBar("Confirm Password is not match");
                      return;
                    }

                    setState(() {
                      isLoading = true;
                    });

                    try {
                      await FirebaseAuth.instance
                          .createUserWithEmailAndPassword(
                          email: _emailTextEditingController.text.trim(),
                          password: _passwordTextEditingController.text.trim()
                      );

                      FirebaseAuth.instance.authStateChanges()
                      .listen((User? user) {
                        if(user != null){
                          databaseRef.child("users").child(_emailTextEditingController
                              .text.trim().replaceAll(RegExp('[^A-Za-z]'), '')).set({
                            'name': _nameTextEditingController.text.trim(),
                            'email': _emailTextEditingController.text.trim()
                          });
                        }
                      });

                    } on FirebaseAuthException catch (e) {
                      if (e.code == "weak-password") {
                        print('The password provided is too weak.');
                        var snackBar = const SnackBar(
                          content: Text( "The password provided is too weak",
                            textAlign: TextAlign.center,
                            style: TextStyle(fontSize: 15),
                          ),
                        );
                        ScaffoldMessenger.of(context).showSnackBar(snackBar);

                      } else if (e.code == "email-already-in-use") {
                        print('An account already exists for that email.');
                        var snackBar = const SnackBar(
                          content: Text( "An account already exist for that email",
                            textAlign: TextAlign.center,
                            style: TextStyle(fontSize: 15),
                          ),
                        );
                        ScaffoldMessenger.of(context).showSnackBar(snackBar);

                      }
                    } catch (e) {
                      print(e);
                    }

                    setState(() {
                      isLoading = false;
                    });

                    var snackBar = const SnackBar(
                      content: Text( "Account created successfully",
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 15),
                      ),
                    );
                    ScaffoldMessenger.of(context).showSnackBar(snackBar);

                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (c) => const LoginScreen(),
                      ),
                    );
                  },
                  child: Text(
                    "Create".toUpperCase(),
                    style: const TextStyle(
                      fontSize: 22,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),

              Center(child: Visibility(visible: isLoading, child:  const SpinKitThreeBounce(
                color: Colors.blue,
                size: 25.0,
              ),)),

              const SizedBox(height: 15),

              Center(
                child: Container(
                  height: 2.0,
                  width: size.width / 2 - 30,
                  color: Colors.black45,
                ),
              ),

              const SizedBox(height: 10),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  const Text(
                    'Already have an account ?',
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
                          builder: (c) => const LoginScreen(),
                        ),
                      );
                    },
                    child: Text(
                      ' Login here',
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
        )
      ),
    );
  }
}
