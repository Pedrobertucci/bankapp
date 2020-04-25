import 'package:flutter/material.dart';
import 'package:nubankapp/pages/home/widges/menu/item_menu.dart';

class MenuApp extends StatelessWidget {
  final double top;
  final bool showMenu;

  const MenuApp({Key key, this.top, this.showMenu}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: top,
      left: 0,
      right: 0,
      child: AnimatedOpacity(
        opacity: showMenu ? 1 : 0,
        duration: Duration(milliseconds: 100),
        child: Container(
          color: Colors.purple[800],
          height: MediaQuery.of(context).size.height * 0.60,
          child: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Column(
              children: <Widget>[
                Image.network(
                  "https://webmobtuts.com/wp-content/uploads/2019/02/QR_code_for_mobile_English_Wikipedia.svg_.png",
                  height: 100,
                  color: Colors.white,
                ),
                Text.rich(
                  TextSpan(
                    text: "Banco ",
                    children: [
                      TextSpan(
                          text: "260 - Nu Pagamentos S.A ",
                          style: TextStyle(fontWeight: FontWeight.bold))
                    ],
                  ),
                  style: TextStyle(fontSize: 12),
                ),
                Text.rich(
                  TextSpan(
                    text: "Agencia ",
                    children: [
                      TextSpan(
                          text: "0001",
                          style: TextStyle(fontWeight: FontWeight.bold))
                    ],
                  ),
                  style: TextStyle(fontSize: 12),
                ),
                Text.rich(
                  TextSpan(
                    text: "Conta ",
                    children: [
                      TextSpan(
                          text: "9999999-9",
                          style: TextStyle(fontWeight: FontWeight.bold))
                    ],
                  ),
                  style: TextStyle(fontSize: 12),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                  child: Column(
                    children: <Widget>[
                      ItemMenu(icon: Icons.info_outline, text: 'Help me'),
                      ItemMenu(icon: Icons.person_outline, text: 'Profile'),
                      ItemMenu(
                          icon: Icons.settings_applications,
                          text: 'Account Settings'),
                      ItemMenu(icon: Icons.credit_card, text: 'Cards Settings'),
                      ItemMenu(
                          icon: Icons.store_mall_directory,
                          text: 'Business Account'),
                      ItemMenu(icon: Icons.phone_android, text: 'App settings'),
                      SizedBox(
                        height: 25,
                      ),
                      Container(
                        height: 35,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          border: Border.all(width: 0.7, color: Colors.white54),
                        ),
                        child: RaisedButton(
                          color: Colors.purple[800],
                          highlightColor: Colors.transparent,
                          elevation: 0,
                          focusElevation: 0,
                          highlightElevation: 0,
                          hoverElevation: 0,
                          splashColor: Colors.purple[900],
                          child: Text("Logout App", style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold)),
                          onLongPress: () {}, onPressed: () {},
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
