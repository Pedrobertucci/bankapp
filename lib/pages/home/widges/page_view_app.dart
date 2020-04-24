import 'package:flutter/material.dart';
import 'package:nubankapp/pages/home/widges/card_app.dart';
import 'package:nubankapp/pages/home/widges/first_card.dart';

class PageViewApp extends StatelessWidget {
  final double top;
  final ValueChanged<int> onChange;
  final GestureDragUpdateCallback onPanUpdate;
  final bool showMenu;

  const PageViewApp(
      {Key key, this.top, this.onChange, this.onPanUpdate, this.showMenu})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedPositioned(
      duration: Duration(milliseconds: 250),
      curve: Curves.easeOut,
      top: top,
      height: MediaQuery.of(context).size.height * .50,
      left: 0,
      right: 0,
      child: GestureDetector(
        onPanUpdate: onPanUpdate,
        child: PageView(
          onPageChanged: onChange,
          physics: showMenu
              ? NeverScrollableScrollPhysics()
              : BouncingScrollPhysics(),
          children: <Widget>[
            CardApp(
              child: FirstCard(),
            ),
            CardApp(),
            CardApp()
          ],
        ),
      ),
    );
  }
}
