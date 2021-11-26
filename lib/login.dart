import 'package:assignment_1/product.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

final _auth = FirebaseAuth.instance;

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String? email;
  String? password;
  bool _obscureText = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Padding(
                    padding: EdgeInsets.all(15.0),
                    child: Text(
                      'LogIn in to Get Started',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.all(15.0),
                    child: Text(
                      'Experience the all new App!',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 25.0,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 15.0),
                    child: TextField(
                      onChanged: (String? value) {
                        email = value;
                      },
                      decoration: const InputDecoration(
                        labelText: 'E-Mail ID',
                        prefixIcon: Image(
                          image: AssetImage('assets/email-24px.png'),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 15.0),
                    child: TextField(
                      obscureText: _obscureText,
                      onChanged: (String? value) {
                        password = value;
                      },
                      decoration: InputDecoration(
                        labelText: 'Password',
                        prefixIcon: const Image(
                          image: AssetImage('assets/Icon ionic-ios-lock.png'),
                        ),
                        suffixIcon: GestureDetector(
                          child: const Image(
                            image: AssetImage('assets/Icon awesome-eye.png'),
                          ),
                          onTap: () {
                            setState(() {
                              _obscureText = !_obscureText;
                            });
                          },
                        ),
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      TextButton(
                        onPressed: () {},
                        child: Text(
                          'Use Mobile Number',
                          style: TextStyle(
                            color: Colors.yellow[900],
                            fontSize: 18,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const Divider(
                    color: Colors.black87,
                    thickness: 1.0,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 5.0),
                    child: Material(
                      color: Colors.yellow[900],
                      elevation: 5.0,
                      borderRadius: BorderRadius.circular(10.0),
                      child: MaterialButton(
                        onPressed: () async {
                          try {
                            final user = await _auth.signInWithEmailAndPassword(
                              email: email!,
                              password: password!,
                            );
                            if (user != null) {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const ProductPage()));
                            }
                          } catch (e) {
                            print(e);
                          }
                        },
                        child: const Text(
                          'LOGIN',
                          style: TextStyle(color: Colors.white, fontSize: 20),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
