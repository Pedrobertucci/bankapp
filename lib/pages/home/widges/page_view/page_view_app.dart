import 'package:flutter/material.dart';
import 'package:nubankapp/pages/home/widges/cards/card_app.dart';
import 'package:nubankapp/pages/home/widges/cards/first_card.dart';
import 'package:nubankapp/pages/home/widges/cards/second_card.dart';
import 'package:nubankapp/pages/home/widges/cards/third_card.dart';

class PageViewApp extends StatefulWidget {
  final double top;
  final ValueChanged<int> onChange;
  final GestureDragUpdateCallback onPanUpdate;
  final bool showMenu;

  const PageViewApp(
      {Key key, this.top, this.onChange, this.onPanUpdate, this.showMenu})
      : super(key: key);

  @override
  _PageViewAppState createState() => _PageViewAppState();
}

class _PageViewAppState extends State<PageViewApp> {
  Tween<double> _tween;

 @override
  void initState() {
    super.initState();
    _tween = Tween<double>(begin: 150.0, end: 150.0);
    delayAnimation();
  }
  Future<void> delayAnimation() async{
    await Future.delayed(Duration(milliseconds: 200), () {
      setState(() {
        _tween = Tween<double>(begin: 150.0, end: 0);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder<double>(
      tween: _tween,
      duration: Duration(milliseconds: 250),
      curve: Curves.elasticInOut,
      builder: (context, value, child) {
        return AnimatedPositioned(
          duration: Duration(milliseconds: 250),
          curve: Curves.easeOut,
          top: widget.top,
          height: MediaQuery.of(context).size.height * .50,
          left: value,
          right: value * -1,
          child: GestureDetector(
            onPanUpdate: widget.onPanUpdate,
            child: PageView(
              onPageChanged: widget.onChange,
              physics: widget.showMenu
                  ? NeverScrollableScrollPhysics()
                  : BouncingScrollPhysics(),
              children: <Widget>[
                CardApp(
                  child: FirstCard(),
                ),
                CardApp(
                  child: SecondCard(),
                ),
                CardApp(
                  child: ThirdCard()
                )
              ],
            ),
          ),
        );
      }
    );
  }
}
