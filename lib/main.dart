import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      home: myApp(),
    ));

// ignore: camel_case_types
class myApp extends StatefulWidget {
  @override
  _myAppState createState() => _myAppState();
}

// ignore: camel_case_types
class _myAppState extends State<myApp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: SingleChildScrollView(
        child: Column(
//          mainAxisAlignment: MainAxisAlignment.spaceBetween,

          children: <Widget>[
            ClipPath(
              clipper: MyClipper(),
              child: Container(
                height: 250,
                decoration: BoxDecoration(
                  color: Colors.lightBlueAccent,
                ),
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Container(
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Align(
                            alignment: Alignment.center,
                            child: Icon(
                              Icons.person,
                              size: 80,
                              color: Colors.white,
                            ),
                          ),
                          Align(
                            alignment: Alignment.bottomRight,
                            child: Text('Login',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                )),
                          ),
                        ]),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Column(
                children: <Widget>[
                  TextFormField(
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.person),
                      hintText: 'Username',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(25)),
                    ),
                  ),
                  //Spacing between login and password boxes...
                  SizedBox(
                    height: 25,
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.lock_outline),
                      hintText: 'Password',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(25)),
                    ),
                  ),
                  // Creating space between the forget password and the password boxes.
                  SizedBox(
                    height: 25,
                  ),
                  Align(
                      alignment: Alignment.centerRight,
                      child: Text("Forgot Password?"))
                ],
              ),
            ),
            //Button for login.........................
            Container(
              margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              width: double.infinity,
              child: FlatButton(
                onPressed: () {},
                color: Colors.lightBlueAccent,
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Text(
                    "Login",
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                ),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Text("Don't have account? Sign Up"),
          ],
        ),
      ),
    ));
  }
}

// ignore: camel_case_types
class MyClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = new Path();
    path.lineTo(0, size.height - 50);
    var controlledPoint = Offset(50, size.height);
    var endPoint = Offset(size.width / 2, size.height);
    path.quadraticBezierTo(
        controlledPoint.dx, controlledPoint.dy, endPoint.dy, endPoint.dy);
    path.lineTo(size.width, size.height);
    path.lineTo(size.width, 0);
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
  }
}
