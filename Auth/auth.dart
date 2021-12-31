import 'package:bees/Auth/sign_up.dart';
import 'package:bees/View/home_page.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

class AuthScreen extends StatefulWidget {
  static const routName = '/LOGIN';

  const AuthScreen({Key? key}) : super(key: key);

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  final _formKey = GlobalKey<FormState>();

  bool visible = false;
  final _passwordController = TextEditingController();
  var _isLoading = false;
  String _email = '';
  String _password = '';

  @override
  Widget build(BuildContext context) {
    final device = MediaQuery.of(context).size;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    colors: [
                      const Color.fromRGBO(46, 76, 109, 1).withOpacity(0.9),
                      const Color.fromRGBO(57, 110, 176, 1).withOpacity(0.5),
                      const Color.fromRGBO(218, 221, 252, 1).withOpacity(0.8),
                    ],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    stops: const [0, 0.5, 1])),
          ),
          Expanded(
            child: SizedBox(
              height: device.height * 0.4,
              child: Center(
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Image.asset(
                      'image/new.png',
                      height: 200,
                      width: 200,
                    ),
                  ],
                ),
              ),
            ),
          ),
          Column(
            children: [
              Expanded(
                flex: 4,
                child: Padding(
                  padding: EdgeInsets.only(top: device.height * 0.42),
                  child: Container(
                    margin: const EdgeInsets.symmetric(horizontal: 10),
                    child: Form(
                        key: _formKey,
                        child: Column(children: [
                          TextFormField(
                            decoration: const InputDecoration(
                              focusedBorder: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(15)),
                                  borderSide: BorderSide(
                                    width: 2,
                                    color: Color.fromRGBO(46, 76, 109, 1),
                                  )),
                              errorBorder: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(15))),
                              prefixIcon: Icon(
                                Icons.email,
                                color: Colors.black87,
                              ),
                              filled: true,
                              border: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(15))),
                              hintText: "E_Mail",
                              hintStyle: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            keyboardType: TextInputType.emailAddress,
                            validator: (val) {
                              if (val!.isEmpty || !val.contains('@')) {
                                return 'Valid Email Address';
                              }
                              return null;
                            },
                            onSaved: (val) {
                              _email = val!;
                            },
                          ),
                          const SizedBox(height: 20),
                          TextFormField(
                            decoration: InputDecoration(
                              focusedBorder: const OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(15)),
                                  borderSide: BorderSide(
                                    width: 2,
                                    color: Color.fromRGBO(46, 76, 109, 1),
                                  )),
                              errorBorder: const OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(15))),
                              suffixIcon: GestureDetector(
                                child: Icon(
                                  visible
                                      ? Icons.visibility
                                      : Icons.visibility_off,
                                  color: Colors.black87,
                                ),
                                onTap: () {
                                  setState(() {
                                    visible = !visible;
                                  });
                                },
                              ),
                              filled: true,
                              border: const OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(15))),
                              hintStyle:
                                  const TextStyle(fontWeight: FontWeight.bold),
                              hintText: "Password",
                            ),
                            obscureText: visible,
                            controller: _passwordController,
                            keyboardType: TextInputType.visiblePassword,
                            validator: (val) {
                              if (val!.isEmpty || val.length < 5) {
                                return 'Password Is too Short';
                              }
                              return null;
                            },
                            onSaved: (val) {
                              _password = val!;
                            },
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          if (_isLoading) const CircularProgressIndicator(),
                          ButtonTheme(
                            height: device.height * .06,
                            minWidth: device.width * 0.4,
                            child: RaisedButton(
                              elevation: 3,
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    PageTransition(
                                        curve: Curves.bounceOut,
                                        type: PageTransitionType.rotate,
                                        duration: const Duration(seconds: 1),
                                        alignment: Alignment.bottomLeft,
                                        child: const HomePage()));
                              },
                              child: const Text(
                                "LOGIN",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                    color: Colors.white),
                              ),
                              color: const Color.fromRGBO(46, 76, 109, 1)
                                  .withOpacity(0.7),
                              shape: const RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(15)),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text("Don't have any account ?",
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: const Color.fromRGBO(46, 76, 109, 1)
                                        .withOpacity(0.7),
                                  )),
                              FlatButton(
                                  onPressed: () {
                                    Navigator.pushReplacement(
                                      context,
                                      PageTransition(
                                        curve: Curves.bounceOut,
                                        type: PageTransitionType.rotate,
                                        duration: const Duration(seconds: 1),
                                        alignment: Alignment.bottomLeft,
                                        child: const SignUp(),
                                      ),
                                    );
                                  },
                                  child: const Text("SignUp",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white,
                                          fontSize: 18)))
                            ],
                          ),
                          const SizedBox(height: 20),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: const [
                              Text(
                                  "ـــــــــــــــــــــــــــــــــــــــــــــــــــــــــ",
                                  style: TextStyle(
                                    fontSize: 10,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black87,
                                  )),
                              Text("   Or Join With   ",
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black87,
                                  )),
                              Text(
                                  "ـــــــــــــــــــــــــــــــــــــــــــــــــــــــــ",
                                  style: TextStyle(
                                    fontSize: 10,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black87,
                                  )),
                            ],
                          ),
                          const SizedBox(height: 15),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              GestureDetector(
                                onTap: () {},
                                child: const SizedBox(
                                    width: 50,
                                    height: 50,
                                    child: Image(
                                      image: AssetImage('image/face.png'),
                                    )),
                              ),
                              const SizedBox(width: 20),
                              GestureDetector(
                                onTap: () {},
                                child: const SizedBox(
                                    width: 50,
                                    height: 50,
                                    child: Image(
                                      image: AssetImage('image/google.png'),
                                    )),
                              )
                            ],
                          ),
                        ])),
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
