import 'package:flutter/material.dart';
import 'package:petshub/features/auth/screens/login_screen.dart';
import 'package:petshub/features/auth/services/signup_service.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreen();
}

class _SignUpScreen extends State<SignUpScreen> {
  //////////  FORMKEY  //////////
  final _signupformkey = GlobalKey<FormState>();

  //////////  EDITING  CONTROLLERS  //////////
  final TextEditingController firstnameController = TextEditingController();
  final TextEditingController lastnameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmpasswordController =
      TextEditingController();

  ////////// EDITING AUTH SERVICE //////////
  final SignupAuthService authService = SignupAuthService();

  ////////// GETTING AUTH SERVICE //////////
  void signupUser() {
    authService.signupUser(
        context: context,
        firstname: firstnameController.text,
        lastname: lastnameController.text,
        email: emailController.text,
        password: passwordController.text);
  }

  @override
  Widget build(BuildContext context) {
    //////////  FIRST NAME FIELD  //////////
    final firstnameField = TextFormField(
      autofocus: false,
      controller: firstnameController,
      keyboardType: TextInputType.text,
      onSaved: (value) {
        firstnameController.text = value!;
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
          prefixIcon: const Icon(Icons.account_circle),
          contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
          hintText: "First Name",
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          )),
    );

    ////////// LAST NAME FIELD  //////////
    final lastnameField = TextFormField(
      autofocus: false,
      controller: lastnameController,
      keyboardType: TextInputType.text,
      onSaved: (value) {
        lastnameController.text = value!;
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
          prefixIcon: const Icon(Icons.account_circle),
          contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
          hintText: "Last Name",
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          )),
    );

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

    ////////// CONFIRM PASSWORD FIELD  //////////
    final confirmpasswordField = TextFormField(
      autofocus: false,
      controller: confirmpasswordController,
      obscureText: true,
      onSaved: (value) {
        confirmpasswordController.text = value!;
      },
      textInputAction: TextInputAction.done,
      decoration: InputDecoration(
          prefixIcon: const Icon(Icons.vpn_key),
          contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
          hintText: "Confirm Password",
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          )),
    );

    //////////  SIGNUP BUTTON  //////////
    final signUpButton = Material(
      elevation: 5,
      borderRadius: BorderRadius.circular(30),
      color: Colors.black,
      child: MaterialButton(
          padding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
          minWidth: MediaQuery.of(context).size.width,
          onPressed: () {
            if (_signupformkey.currentState!.validate()) {
              signupUser();
            }
          },
          child: const Text(
            "Signup",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 20,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          )),
    );

    //////////  SCAFFOLD  //////////
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: SingleChildScrollView(
          child: Container(
            color: Colors.white,
            child: Padding(
              padding: const EdgeInsets.all(36.0),
              child: Form(
                key: _signupformkey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    // Text('Sign Up'),
                    SizedBox(
                      height: 220,
                      child: Image.asset(
                        "assets/signup_image.png",
                        fit: BoxFit.contain,
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    firstnameField,
                    const SizedBox(
                      height: 20,
                    ),
                    lastnameField,
                    const SizedBox(
                      height: 20,
                    ),
                    emailField,
                    const SizedBox(
                      height: 20,
                    ),
                    passwordField,
                    const SizedBox(
                      height: 20,
                    ),
                    confirmpasswordField,
                    const SizedBox(
                      height: 40,
                    ),
                    signUpButton,
                    const SizedBox(
                      height: 15,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        const Text("Already have an account? "),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const LoginScreen()));
                          },
                          child: const Text(
                            "Login",
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w600,
                                fontSize: 15),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
