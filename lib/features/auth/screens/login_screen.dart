import 'package:flutter/material.dart';
import 'package:petshub/features/auth/screens/signup_screen.dart';
import 'package:petshub/features/auth/services/login_service.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  //////////  FORM KEY  //////////
  final _loginformkey = GlobalKey<FormState>();

  //////////  EDITING CONTROLLERS  //////////
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  ////////// EDITING AUTH SERVICE //////////
  final LoginAuthService authService = LoginAuthService();

  ////////// GETTING AUTH SERVICE //////////
  void loginUser() {
    authService.loginUser(
        context: context,
        email: emailController.text,
        password: passwordController.text);
  }

  @override
  Widget build(BuildContext context) {
    //////////  EMAIL FIELD  //////////
    final emailField = TextFormField(
      autofocus: false,
      controller: emailController,
      keyboardType: TextInputType.emailAddress,
      onSaved: (value) {
        emailController.text = value!;
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
          prefixIcon: const Icon(Icons.mail),
          contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
          hintText: "Email",
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          )),
    );

    //////////  PASSWORD FIELD  //////////
    final passwordField = TextFormField(
      autofocus: false,
      controller: passwordController,
      obscureText: true,
      onSaved: (value) {
        passwordController.text = value!;
      },
      textInputAction: TextInputAction.done,
      decoration: InputDecoration(
          prefixIcon: const Icon(Icons.vpn_key),
          contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
          hintText: "Password",
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          )),
    );

    //////////  LOGIN BUTTON  //////////
    final loginButton = Material(
      elevation: 5,
      borderRadius: BorderRadius.circular(30),
      color: Colors.black,
      child: MaterialButton(
        padding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
        minWidth: MediaQuery.of(context).size.width,
        onPressed: () {
          if (_loginformkey.currentState!.validate()) {
            loginUser();
          }
        },
        child: const Text(
          "Login",
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 20,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );

    //////////  SCAFFOLD  //////////
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: SingleChildScrollView(
          child: Container(
            color: Colors.white,
            child: Padding(
              padding: const EdgeInsets.only(
                  top: 20, bottom: 100, left: 36, right: 36),
              child: Form(
                key: _loginformkey,
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      SizedBox(
                        height: 300,
                        child: Image.asset(
                          "assets/login_image.png",
                          fit: BoxFit.contain,
                        ),
                      ),
                      const SizedBox(
                        height: 100,
                      ),
                      emailField,
                      const SizedBox(
                        height: 25,
                      ),
                      passwordField,
                      const SizedBox(
                        height: 35,
                      ),
                      loginButton,
                      const SizedBox(
                        height: 15,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          const Text("Don't have an account? "),
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const SignUpScreen()));
                            },
                            child: const Text(
                              "Signup",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 15),
                            ),
                          ),
                        ],
                      )
                    ]),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
