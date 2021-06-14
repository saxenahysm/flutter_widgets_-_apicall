import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_widgets/Utils/constants.dart';
import 'package:flutter_widgets/bg_image.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final userNameController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Login Screen"),
        ),
        body: Stack(
          children: [
            BgImage(),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Center(
                child: SingleChildScrollView(
                  child: Card(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          Form(
                              child: Column(
                            children: [
                              TextFormField(
                                decoration: InputDecoration(
                                    hintText: "Enter User Name",
                                    labelText: "Username"),
                              ),
                              TextFormField(
                                obscureText: true,
                                decoration: InputDecoration(
                                    hintText: "Enter Password",
                                    labelText: "Password"),
                              ),
                              SizedBox(
                                height: 8.0,
                              ),
                              RaisedButton(
                                onPressed: () {
                                  /*  Navigator.push(context, MaterialPageRoute(
                                          builder: (context) => HomeScreen()));*/
                                  Constants.prefs.setBool("LoggedIn", true);
                                  Navigator.pushReplacementNamed(
                                      context, "/home");
                                },
                                textColor: Colors.white,
                                color: Colors.green,
                                child: Text("Sign In"),
                              )
                            ],
                          ))
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            )
          ],
        ));
  }
}
