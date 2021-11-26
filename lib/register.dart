import 'package:assignment_1/login.dart';
import 'package:assignment_1/product.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

final _auth = FirebaseAuth.instance;

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  String? email;
  String? name;
  String? phone;
  String? password;
  String? conpswd;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: ListView(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const Padding(
                    padding: EdgeInsets.all(15.0),
                    child: Text(
                      'Register in to Get Started',
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
                    height: 30,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 15.0),
                    child: TextField(
                      onChanged: (String? value) {
                        name = value;
                      },
                      decoration: const InputDecoration(
                        labelText: 'Name',
                        prefixIcon: Image(
                          image: AssetImage('assets/person-24px.png'),
                        ),
                      ),
                    ),
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
                      onChanged: (String? value) {
                        phone = value;
                      },
                      decoration: const InputDecoration(
                        labelText: 'Phone Number',
                        prefixIcon: Image(
                          image: AssetImage('assets/phone-24px.png'),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 15.0),
                    child: TextField(
                      obscureText: true,
                      onChanged: (String? value) {
                        password = value;
                      },
                      decoration: const InputDecoration(
                        labelText: 'Password',
                        prefixIcon: Image(
                          image: AssetImage('assets/Icon ionic-ios-lock.png'),
                        ),
                        suffixIcon: Image(
                          image: AssetImage('assets/Icon awesome-eye.png'),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 15.0),
                    child: TextField(
                      obscureText: true,
                      onChanged: (String? value) {
                        conpswd = value;
                      },
                      decoration: const InputDecoration(
                        labelText: 'Confirm Password',
                        prefixIcon: Image(
                          image: AssetImage('assets/Icon ionic-ios-lock.png'),
                        ),
                        suffixIcon: Image(
                          image: AssetImage('assets/Icon awesome-eye.png'),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 20),
                    child: Material(
                      color: Colors.yellow[800],
                      elevation: 5.0,
                      borderRadius: BorderRadius.circular(8.0),
                      child: MaterialButton(
                        onPressed: () {
                          try {
                            final newUser =
                                _auth.createUserWithEmailAndPassword(
                              email: email!,
                              password: password!,
                            );
                            if (newUser != null) {
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
                          'REGISTER',
                          style: TextStyle(color: Colors.white, fontSize: 20),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 10.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          'Already have an Account ?',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w300,
                          ),
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const LoginPage()));
                          },
                          child: const Text(
                            'Login',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 20,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
