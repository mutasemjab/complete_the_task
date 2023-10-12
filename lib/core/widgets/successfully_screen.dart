import 'package:echo_cash/core/constants/app_constants.dart';
import 'package:echo_cash/core/constants/app_globals.dart';
import 'package:flutter/material.dart';

class SuccessfullScreen extends StatelessWidget {
  final String title;
  final String subtitle;
  final String message;

  const SuccessfullScreen({
    Key? key,
    required this.title,
    required this.subtitle,
    required this.message,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Column(
            children: <Widget>[
              Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [secondaryColor, secondaryColor],
                  ),
                ),
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(height: 100,),
                      Image.asset("assets/images/check.png", height: 100, width: 100),
                      SizedBox(height: 30),
                      Text(
                        "Your account has been created",
                        style: textStyleWhite18.copyWith(
                          fontWeight: FontWeight.w500,
                          fontSize: 20,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              ClipPath(
                clipper: MyClipper(),
                child: Container(
                  height: 100.0,
                  color: secondaryColor,
                ),
              ),
              Expanded(
                child: Container(
                  color: Colors.white,
                  child: FractionallySizedBox(
                    widthFactor: 0.8, // Adjust this value as needed to control the content's width
                    alignment: Alignment.center,
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            "Thank you for Registering",
                            style: headingStyle,
                          ),
                          SizedBox(height: 20),
                          Text(
                            "A verification link has been sent to your email",
                            style: backAndSkipButtonTextWhiteBgStyle,
                          ),
                          SizedBox(height: 20),
                          Text(
                            "Please sign in to your email to verify your account",
                            style: descriptionStyle,
                          ),
                          SizedBox(height: 50),
                          Image.asset("assets/images/logo_in_app.png", scale: 3),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          Positioned(
            bottom: 25.0,
            right: 25.0,
            child: FloatingActionButton(
              backgroundColor: whiteColor, // Customize the background color
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30.0), // Adjust the radius as needed
              ),
              onPressed: () {
               Navigator.pop(context);
              },
              child: Image.asset("assets/images/close.png",width: 25,height: 25,), // Replace with your desired icon
            ),
          ),
        ],
      ),
    );
  }
}


class MyClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    path.lineTo(0, size.height - 30.0);
    path.quadraticBezierTo(
        size.width / 2, size.height + 30.0, size.width, size.height - 30.0);
    path.lineTo(size.width, 0);
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}