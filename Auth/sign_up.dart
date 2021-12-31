import 'package:bees/View/home_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:vs_scrollbar/vs_scrollbar.dart';
import 'package:csc_picker/csc_picker.dart';

import 'auth.dart';

class SignUp extends StatefulWidget {
  static const routName = '/sign';

  const SignUp({Key? key}) : super(key: key);

  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final _formKey = GlobalKey<FormState>();
  ScrollController _scrollController = ScrollController();

  String _email = '';
  final String _name = '';
  final String _Lname = '';
  String _password = '';
  String _confirmPass = '';
  final _passwordController = TextEditingController();
  var _isLoading = false;


  bool visible = true;
  bool _verticalList = true;

  String? countryValue='';
  String? stateValue='';
  String? cityValue='' ;
  String address = "";


  @override
  Widget build(BuildContext context) {
    final device = MediaQuery.of(context).size;

    return Scaffold(
      //resizeToAvoidBottomInset:false,
      body:  Stack(
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
          SizedBox(
            height: device.height * 0.35,
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
          Padding(
            padding: const EdgeInsets.only(top: 195),
            child: VsScrollbar(
              controller: _scrollController,
              showTrackOnHover: true,
              isAlwaysShown: true,
              scrollbarFadeDuration: const Duration(milliseconds: 500),
              scrollbarTimeToFade:const Duration(milliseconds: 800),
              style:const VsScrollbarStyle(
                hoverThickness: 8.0, // default 12.0
                radius:  Radius.circular(8), // default Radius.circular(8.0)
                thickness: 8.0, // [ default 8.0 ]
                color: Colors.black26, // default ColorScheme Theme
              ),
              child: SingleChildScrollView(
                scrollDirection:
                _verticalList ? Axis.vertical : Axis.horizontal,
                controller: _scrollController, // use same scrollController object to support drag functionality
                physics: const BouncingScrollPhysics(),

                child: Container(
                  margin:const  EdgeInsets.symmetric(horizontal: 10),
                  child: Padding(
                    padding: EdgeInsets.only(top: device.height*0),
                    child: Form(
                        key: _formKey,
                        child: Column(
                          children: [
                            buildTextFormField('Name', _name, 'Valid Name',
                                icon: Icons.person),
                            const SizedBox(height: 8),
                            buildTextFormField(
                                'Last Name', 'Valid Last Name', _Lname,
                                icon: Icons.person),
                            const SizedBox(height: 8),
                            TextFormField(
                              cursorColor: const Color.fromRGBO(46, 76, 109, 1),
                              key: const ValueKey("email"),
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
                                hintStyle:
                                TextStyle(fontWeight: FontWeight.bold),
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
                            const SizedBox(height: 8),
                            TextFormField(
                              cursorColor: const Color.fromRGBO(46, 76, 109, 1),
                              key: const ValueKey("password"),
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
                                  onTap: () {
                                    setState(() {
                                      visible = !visible;
                                    });
                                  },
                                  child: Icon(
                                    visible
                                        ? Icons.visibility
                                        : Icons.visibility_off,
                                    color: Colors.black87,
                                  ),
                                ),
                                filled: true,
                                border: const OutlineInputBorder(
                                    borderRadius:
                                    BorderRadius.all(Radius.circular(15))),
                                hintStyle: const TextStyle(
                                    fontWeight: FontWeight.bold),
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
                            const SizedBox(height: 8),
                            TextFormField(
                              cursorColor: const Color.fromRGBO(46, 76, 109, 1),
                              key: const ValueKey("confirm"),
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
                                  onTap: () {
                                    setState(() {
                                      visible = !visible;
                                    });
                                  },
                                  child: Icon(
                                    visible
                                        ? Icons.visibility
                                        : Icons.visibility_off,
                                    color: Colors.black87,
                                  ),
                                ),
                                filled: true,
                                border: const OutlineInputBorder(
                                    borderRadius:
                                    BorderRadius.all(Radius.circular(15))),
                                hintStyle: const TextStyle(
                                    fontWeight: FontWeight.bold),
                                hintText: "Confirm Password",
                              ),
                              obscureText: visible,
                              keyboardType: TextInputType.visiblePassword,
                              validator: (val) {
                                if (val!.isEmpty || _password != _confirmPass) {
                                  return "please enter match password";
                                }
                                return null;
                              },
                              onSaved: (val) {
                                _confirmPass = val!;
                              },
                            ),
                            const SizedBox(height: 8),
                            CSCPicker(
                              showStates: true,
                              showCities: true,
                              flagState: CountryFlag.ENABLE,
                              dropdownDecoration: BoxDecoration(
                                  borderRadius:const  BorderRadius.all(Radius.circular(10)),
                                  //color: const Color.fromRGBO(240, 165, 0, 1),
                                  border:
                                  Border.all(color: Colors.black, width: 1)),
                              disabledDropdownDecoration: BoxDecoration(
                                  borderRadius:const BorderRadius.all(Radius.circular(12)),
                                  border:
                                  Border.all(color: Colors.black87)),
                              countrySearchPlaceholder: "Country",
                              stateSearchPlaceholder: "State",
                              citySearchPlaceholder: "City",
                              countryDropdownLabel:countryValue!.isEmpty?"Country":countryValue!,
                              stateDropdownLabel:"State",
                              cityDropdownLabel:"City",
                              selectedItemStyle: TextStyle(
                                color: const Color.fromRGBO(0, 0, 0, 1).withOpacity(0.7),
                                fontWeight: FontWeight.bold,
                              ),
                              dropdownHeadingStyle:const  TextStyle(
                                  color: Colors.black87,
                                  fontSize: 17,
                                  fontWeight: FontWeight.bold),
                              dropdownItemStyle:const TextStyle(
                                color: Colors.black87,
                                fontSize: 14,
                              ),
                              dropdownDialogRadius: 10.0,
                              searchBarRadius: 10.0,
                              onCountryChanged: (value) {
                                setState(() {
                                  countryValue = value;
                                });
                              },
                              onStateChanged: (value) {
                                setState(() {
                                  stateValue = value;
                                });
                              },
                              onCityChanged: (value) {
                                setState(() {
                                  cityValue = value;
                                });
                              },
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                TextButton(
                                    onPressed: () {

                                      setState(() {
                                        address = "$cityValue/$stateValue/$countryValue";
                                      });
                                    },
                                      child:const Text("Submit Address"
                                        ,style: TextStyle(color: Colors.black87),),
                                    ),
                                const SizedBox(width: 10),
                                Flexible(child: Text(address,overflow: TextOverflow.ellipsis,maxLines: 2))
                              ],
                            ),
                            const SizedBox(height: 8),
                            if (_isLoading) const CircularProgressIndicator(),
                            ButtonTheme(
                              height: device.height * .06,
                              minWidth: device.width * 0.4,
                              child: RaisedButton(
                                elevation: 3,
                                onPressed: () {
                                  Navigator.push(context, PageTransition(
                                      curve: Curves.bounceOut,
                                      type: PageTransitionType.rotate,
                                      duration:const  Duration(seconds:1),
                                      alignment: Alignment.bottomRight,
                                      child:const HomePage()));
                                },
                                child: const Text(
                                  "SignUp",
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
                            const SizedBox(height: 8),
                            FlatButton(
                                onPressed: () {
                                  Navigator.push(context, PageTransition(
                                  curve: Curves.bounceOut,
                                  type: PageTransitionType.rotate,
                                      duration:const  Duration(seconds:1),
                                      alignment: Alignment.bottomRight,
                                      child:const AuthScreen()));
                                },
                                child: const Text("Already Member ? Login",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white,
                                        fontSize: 18))),
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
                            const SizedBox(height: 8),
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
                            const SizedBox(height: 10),




                          ],
                        ),
                          ),
                        ),
                )),
                ),
              ),
            ]),
    );
  }

  TextFormField buildTextFormField(name, variable, str, {icon}) {
    return TextFormField(
      cursorColor: const Color.fromRGBO(46, 76, 109, 1),
      decoration: InputDecoration(
        focusedBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(15)),
            borderSide: BorderSide(
              width: 2,
              color: Color.fromRGBO(46, 76, 109, 1),
            )),
        errorBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(15))),
        prefixIcon: Icon(
          icon,
          color: Colors.black87,
        ),
        filled: true,
        border: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(15))),
        hintText: name,
        hintStyle: const TextStyle(fontWeight: FontWeight.bold),
      ),
      keyboardType: TextInputType.emailAddress,
      validator: (val) {
        if (val!.isEmpty) {
          return str;
        }
        return null;
      },
      onSaved: (val) {
        variable = val!;
      },
    );
  }
}
