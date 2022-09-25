import 'package:academy/layout/layout.dart';
import 'package:academy/modules/login/login_screen.dart';
import 'package:academy/modules/onBoarding/onBoarding_Screen.dart';
import 'package:academy/network/cashed_helper.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:page_transition/page_transition.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await CashedHelper.init();

  Widget widget;

bool onBoarding = CashedHelper.getData("onBoarding")??false;
print(onBoarding);


if (onBoarding ) {
      widget = LoginScreen();
  } else {
    widget = OnBoardingScreen();
  }
  runApp( MyApp(
    startWidget: widget,
  ));
}

class MyApp extends StatelessWidget {
  final Widget startWidget;
    MyApp({Key? key, required this.startWidget}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        appBarTheme: AppBarTheme(
          systemOverlayStyle: SystemUiOverlayStyle(
            statusBarIconBrightness: Brightness.dark,
            statusBarColor: Colors.white
          )
        ),
        primarySwatch: Colors.blue,
      ),
      home:
      AnimatedSplashScreen(
        duration: 3000,
        splash: Container(
          decoration: BoxDecoration(
            image: DecorationImage(image: AssetImage("assets/images/6.png",),fit: BoxFit.fitWidth)
          ),
          child: Stack(
            children: [
              // Image.asset('assets/images/6.png',),
              Center(child: SizedBox(height:250,width:250,child: Image(image: AssetImage('assets/images/1.png')))),          ],
          ),
        ),
        splashIconSize: 3000,
        nextScreen: startWidget,
        splashTransition: SplashTransition.fadeTransition,
        pageTransitionType: PageTransitionType.fade,
      ),



    );
  }
}

