import 'package:flutter/material.dart';
import 'package:petshub/Pages/Login Page/login_screen.dart';
import 'package:petshub/Pages/Signup Page/signup_screen.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var sizeManager = SizedManager(context);
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(
                top: sizeManager.scaledHeight(15),
                bottom: sizeManager.scaledHeight(5),
                left: sizeManager.scaledWidth(5),
                right: sizeManager.scaledWidth(1)),
            child: const Center(
              child: Text(
                'PetsHub',
                style: TextStyle(
                    // color: Colors.blue,
                    fontSize: 35,
                    fontWeight: FontWeight.w700),
              ),
            ),
          ),
          Center(
            child: SizedBox(
              height: 200,
              child: Image.asset(
                "assets/splash_image.png",
                fit: BoxFit.contain,
              ),
            ),
          ),
          const Center(
            child: Text(
              "MARKETPLACE & BREED SCANNER FOR PETS ",
              style: TextStyle(
                  // color: Colors.blue,
                  fontSize: 16,
                  fontWeight: FontWeight.w700),
            ),
          ),
          Row(
            children: <Widget>[
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(top: 270, left: 10),
                  child: ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all<Color>(Colors.white),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30.0),
                          side: const BorderSide(
                            color: Colors.black,
                            width: 1.0,
                          ),
                        ),
                      ),
                    ),
                    child: const Padding(
                      padding: EdgeInsets.fromLTRB(20, 15, 20, 15),
                      child: Text(
                        "Login",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const LoginScreen()));
                    },
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(top: 270, left: 10, right: 10),
                  child: Material(
                    elevation: 5,
                    borderRadius: BorderRadius.circular(30),
                    color: Colors.black,
                    child: MaterialButton(
                      padding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
                      minWidth: MediaQuery.of(context).size.width,
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const SignUpScreen()));
                      },
                      child: const Text(
                        "Signup",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class SizedManager {
  // ignore: prefer_typing_uninitialized_variables
  var context;
  double _screenHeight = 0.0;
  double _screenWidth = 0.0;

  SizedManager(this.context) {
    _screenHeight = MediaQuery.of(context).size.height;
    _screenWidth = MediaQuery.of(context).size.width;
  }

  double scaledHeight(double value) {
    return value * _screenHeight / 100;
  }

  double scaledWidth(double value) {
    return value * _screenWidth / 100;
  }
}
