import 'package:flutter/material.dart';
import 'package:nubankapp/pages/home/widges/item_menu_bottom.dart';

class BottomMenu extends StatelessWidget {
  final bool showMenu;

  const BottomMenu({Key key, this.showMenu}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedPositioned(
      duration: Duration(milliseconds: 100),
      bottom: !showMenu ? 0 + MediaQuery.of(context).padding.bottom : 0,
      left: 0,
      right: 0,
      height: MediaQuery.of(context).size.height * 0.14,
      child: IgnorePointer(
        ignoring: showMenu,
        child: AnimatedOpacity(
          duration: Duration(milliseconds: 100),
          opacity: !showMenu ? 1 : 0,
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
}
