import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
//import 'package:petshub/router.dart';
import 'package:petshub/features/auth/services/login_service.dart';
//import 'package:petshub/features/menu/screens/menu_screen.dart';
import 'package:petshub/features/auth/screens/home.dart';
import 'package:petshub/providers/user_provider.dart';

void main() {
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (context) => UserProvider()),
  ], child: const MyApp()));
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final LoginAuthService authService = LoginAuthService();

  @override
  void initState() {
    super.initState();
    authService.getUserData(context);
  }

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "PetsHub",
      //onGenerateRoute: (settings) => generateRoute(settings),
      //home: Provider.of<UserProvider>(context).user.token.isNotEmpty
      //    ? MenuScreen()
      //    : Home(),
      home: Home(),
    );
  }
}
