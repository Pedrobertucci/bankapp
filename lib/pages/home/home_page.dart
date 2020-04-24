import 'package:flutter/material.dart';
import 'package:nubankapp/pages/home/widges/item_menu_bottom.dart';
import 'package:nubankapp/pages/home/widges/menu_app.dart';
import 'package:nubankapp/pages/home/widges/my_app_bar.dart';
import 'package:nubankapp/pages/home/widges/my_dots_app.dart';
import 'package:nubankapp/pages/home/widges/page_view_app.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool _showMenu;
  int _currentIndex;
  double _yPosition;

  @override
  void initState() {
    super.initState();
    _showMenu = false;
    _currentIndex = 0;
  }

  @override
  Widget build(BuildContext context) {
    double _screenHeight = MediaQuery.of(context).size.height;
    if (_yPosition == null) {
      _yPosition = _screenHeight * .20;
    }
    return Scaffold(
      backgroundColor: Colors.purple[800],
      body: Stack(
        alignment: Alignment.topCenter,
        children: <Widget>[
          MyAppBar(
            showMenu: _showMenu,
            onTap: () {
              setState(() {
                _showMenu = !_showMenu;
                _yPosition =
                    _showMenu ? _screenHeight * .85 : _screenHeight * .20;
              });
            },
          ),
          MenuApp(
            top: _screenHeight * .20,
            showMenu: _showMenu,
          ),
          PageViewApp(
            showMenu: _showMenu,
            top: _yPosition,
            onChange: (index) {
              setState(() {
                _currentIndex = index;
              });
            },
            onPanUpdate: (details) {
              double positionBottomLimit = _screenHeight * .85;
              double positionTopLimit = _screenHeight * .20;
              double midlePosition = positionBottomLimit - positionTopLimit;

              setState(() {
                _yPosition += details.delta.dy;

                _yPosition = _yPosition < positionTopLimit
                    ? positionTopLimit
                    : _yPosition;

                _yPosition = _yPosition > positionBottomLimit
                    ? positionBottomLimit
                    : _yPosition;

                if (_yPosition != positionBottomLimit && details.delta.dy > 0) {
                  _yPosition =
                      _yPosition > positionBottomLimit + midlePosition - 50
                          ? positionBottomLimit
                          : _yPosition;
                }

                if (_yPosition != positionTopLimit && details.delta.dy < 0) {
                  _yPosition = _yPosition < positionBottomLimit - midlePosition
                      ? positionTopLimit
                      : _yPosition;
                }

                if (_yPosition == positionBottomLimit) {
                  _showMenu = true;
                } else if (_yPosition == positionTopLimit) {
                  _showMenu = false;
                }
              });
            },
          ),
          MyDotsApp(
            top: _screenHeight * 0.70,
            currentIndex: _currentIndex,
            showMenu: _showMenu,
          ),
          AnimatedPositioned(
            duration: Duration(milliseconds: 100),
            bottom: !_showMenu ? 0 + MediaQuery.of(context).padding.bottom : 0,
            left: 0,
            right: 0,
            height: _screenHeight * 0.13,
            child: AnimatedOpacity(
              duration: Duration(milliseconds: 100),
              opacity: !_showMenu ? 1: 0,
              child: Container(
                child: ListView(
                  physics: BouncingScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  children: <Widget>[
                    ItemMenuBottom(
                      icon: Icons.person_add,
                      text: "Indicar amigos",
                    ),
                    ItemMenuBottom(
                      icon: Icons.phone_android,
                      text: "Recarregar telefone",
                    ),
                    ItemMenuBottom(
                      icon: Icons.chat,
                      text: "Chat",
                    ),
                    ItemMenuBottom(
                      icon: Icons.monetization_on,
                      text: "Depositar",
                    ),
                    ItemMenuBottom(
                      icon: Icons.move_to_inbox,
                      text: "Transferir",
                    ),
                    ItemMenuBottom(
                      icon: Icons.lock_outline,
                      text: "Bloquear Cartão",
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
