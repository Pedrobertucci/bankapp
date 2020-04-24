import 'package:flutter/material.dart';
import 'package:nubankapp/pages/home/widges/card_app.dart';

class PageViewApp extends StatelessWidget {
  final double top;
  final ValueChanged<int> onChange;

  const PageViewApp({Key key, this.top, this.onChange}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: top,
      height: MediaQuery.of(context).size.height * .45,
      left: 0,
      right: 0,
      child: PageView(
        onPageChanged: onChange,
        physics: BouncingScrollPhysics(),
        children: <Widget>[CardApp(), CardApp(), CardApp()],
      ),
    );
  }
}
