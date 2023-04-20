import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '/pages/home_page.dart';
import '/utils/routes.dart';
import 'package:link_text/link_text.dart';

class LoginPage extends StatefulWidget {
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  String name = "";
  bool changeButton = false;
  final _formkey = GlobalKey<FormState>();
  movetoHome(BuildContext) async {
    if (_formkey.currentState!.validate()) {
      setState(() {
        changeButton = true;
      });
      await Future.delayed(const Duration(seconds: 1));
      await Navigator.pushNamed(context, MyRoutes.homeRoute);
      setState(() {
        changeButton = false;
      });
    }
  }

  // final String _text = "Lorem ipsum https://flutter.dev\nhttps://pub.dev";
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      child: SingleChildScrollView(
        child: Form(
          key: _formkey,
          child: Column(
            children: [
              const SizedBox(
                height: 50,
              ),
              Text(
                "Welcome Back $name !",
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 21,
                ),
              ),
              Image.asset(
                'assets/images/login_page.png',
                fit: BoxFit.cover,
              ),
              const SizedBox(
                height: 10,
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 16, horizontal: 32),
                child: Column(
                  children: [
                    TextFormField(
                      decoration: const InputDecoration(
                        prefixIcon: Icon(Icons.person),
                        border: OutlineInputBorder(),
                        // border: BorderRadiusDirectional.circular(10),
                        hintText: "Enter your username",
                        labelText: "Username",
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Username cannot be empty";
                        } else {
                          return null;
                        }
                      },
                      onChanged: (value) {
                        name = value;
                        setState(() {});
                      },
                    ),
                    const Padding(padding: EdgeInsets.all(5)),
                    TextFormField(
                      obscureText: true,
                      decoration: const InputDecoration(
                        prefixIcon: Icon(Icons.password),
                        border: OutlineInputBorder(),
                        hintText: "Enter your password",
                        labelText: "Password",
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Password cannot be empty";
                        } else if (value.length < 6) {
                          return "Password should greater than 6 digits";
                        }
                      },
                    ),
                    Text("Forgot password",
                        style: TextStyle(
                          fontSize: 14,
                          color: Theme.of(context).primaryColor,
                        )),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 32),
                child: Material(
                  color: Colors.deepPurple,
                  borderRadius: BorderRadius.circular(changeButton ? 40 : 8),
                  child: InkWell(
                    // splashColor: Colors.red,
                    onTap: () => movetoHome(context),
                    child: AnimatedContainer(
                      duration: const Duration(seconds: 1),
                      width: changeButton ? 40 : 200,
                      height: 40,
                      // padding: const EdgeInsets.symmetric(horizontal: 32),
                      alignment: Alignment.center,

                      child: changeButton
                          ? const Icon(
                              Icons.done,
                              color: Colors.white,
                            )
                          : const Text(
                              "LOGIN",
                              style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                            ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 30,
                child: Text(
                  // _text,
                  "Don't have an account? Sign Up",
                  style: TextStyle(
                    color: Theme.of(context).primaryColor,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
