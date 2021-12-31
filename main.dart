import 'package:bees/view_model/list_of_articale_view_model.dart';
import 'package:flutter/material.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';

import 'Auth/auth.dart';
import 'Auth/sign_up.dart';
import 'View/details_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<ArticleListViewModel>(
      create: (context)=>ArticleListViewModel() ,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        routes: {
          SignUp.routName :(context)=>const SignUp(),
          AuthScreen.routName :(context)=>const AuthScreen(),
          DetailsScreen.routName:(context)=>const DetailsScreen(),
        },
        home: AnimatedSplashScreen(nextScreen: const AuthScreen(),
          splash: Image.asset('image/new.png'),
          backgroundColor:const  Color.fromRGBO(89, 128, 180, 1.0).withOpacity(0.4),
          splashIconSize: double.maxFinite,
          duration:900,
          splashTransition: SplashTransition.sizeTransition,
            ),
      ),
    );
  }
}

