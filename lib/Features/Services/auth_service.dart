import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:petshub/Models/user.dart';
import 'package:petshub/Constants/utils.dart';
import 'package:petshub/Constants/error_handling.dart';
import 'package:petshub/Constants/global_variables.dart';

class AuthService {
  void signupUser({
    required BuildContext context,
    required String firstname,
    required String lastname,
    required String email,
    required String password,
  }) async {
    try {
      User user = User(
        id: '',
        firstname: firstname,
        lastname: lastname,
        email: email,
        password: password,
        token: '',
      );
      http.Response res = await http.post(Uri.parse('$uri/api/signup'),
          body: user.toJson(),
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
          });
      httpErrorHandle(
          response: res,
          context: context,
          onSuccess: () {
            showSnackBar(
                context, "Account created. Login with same credentials !");
          });
    } catch (e) {
      showSnackBar(context, e.toString());
    }
  }
}
