import 'package:flutter/material.dart';
import 'package:nubankapp/pages/home/widges/bottom_menu/item_menu_bottom.dart';

class BottomMenu extends StatefulWidget {
  final bool showMenu;

  const BottomMenu({Key key, this.showMenu}) : super(key: key);

  @override
  _BottomMenuState createState() => _BottomMenuState();
}

class _BottomMenuState extends State<BottomMenu> {
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
      curve: Curves.easeOutCubic,
      builder: (context, value, child) {
        return AnimatedPositioned(
          duration: Duration(milliseconds: 200),
          bottom: !widget.showMenu ? 0 + MediaQuery.of(context).padding.bottom : 0,
          left: value,
          right: value * -1,
          height: MediaQuery.of(context).size.height * 0.14,
          child: IgnorePointer(
            ignoring: widget.showMenu,
            child: AnimatedOpacity(
              duration: Duration(milliseconds: 200),
              opacity: !widget.showMenu ? 1 : 0,
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
          ),
        );
      }
    );
  }
}
