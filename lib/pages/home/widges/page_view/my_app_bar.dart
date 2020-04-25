import 'package:flutter/material.dart';

class MyAppBar extends StatelessWidget {
  final bool showMenu;
  final VoidCallback onTap;

  const MyAppBar({Key key, this.showMenu, this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(children: <Widget>[
      SizedBox(
        height: MediaQuery.of(context).padding.top,
      ),
      GestureDetector(
        onTap: onTap,
        child: Container(
          color: Colors.purple[800],
          height: MediaQuery.of(context).size.height * 0.15,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Image.asset(
                    "assets/images/nu.png",
                    height: 30,
                    color: Colors.white,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    "Bertucci",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  )
                ],
              ),
              Icon(!showMenu ? Icons.expand_more : Icons.expand_less)
            ],
          ),
        ),
      ),
    ]);
  }
}
