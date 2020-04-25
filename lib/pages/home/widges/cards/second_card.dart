import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SecondCard extends StatefulWidget {
  @override
  _SecondCardState createState() => _SecondCardState();
}

class _SecondCardState extends State<SecondCard> with AutomaticKeepAliveClientMixin {
  bool _showRevanue = true;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(5),
      child: Column(
        children: <Widget>[
          Expanded(
            flex: 3,
            child: Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Row(
                          children: <Widget>[
                            Icon(
                              Icons.euro_symbol,
                              color: Colors.grey,
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Text("Conta",
                                style: TextStyle(
                                    color: Colors.grey, fontSize: 13)),
                          ],
                        ),
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              _showRevanue = !_showRevanue;
                            });
                          },
                          child: SvgPicture.asset(
                            !_showRevanue
                                ? "assets/icons/eye-off.svg"
                                : "assets/icons/eye.svg",
                            color: Colors.grey,
                            semanticsLabel: "eye",
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20, top: 20),
                    child: SizedBox(
                      width: double.infinity,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text("Saldo Disponível",
                              textAlign: TextAlign.start,
                              style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 13,
                                  fontWeight: FontWeight.bold)),
                          _showRevanue ? Text.rich(
                            TextSpan(text: "€ 3950,23"),
                            textAlign: TextAlign.start,
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 28,
                            ),
                          ) :
                          Container (
                            height: 32,
                            width: 160,
                            color: Colors.grey[300],
                          )
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.1,
                  )
                ],
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Container(
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Icon(Icons.credit_card, color: Colors.grey),
                    SizedBox(
                      width: 5,
                    ),
                    Flexible(
                      child: Text(
                          "compra mais recebem em Super Mercado no valor de € 249.32 Segunda",
                          style: TextStyle(color: Colors.black, fontSize: 13)),
                    ),
                    Icon(Icons.chevron_right,
                        color: Colors.grey[400], size: 18),
                  ],
                ),
              ),
              color: Colors.grey[200],
            ),
          )
        ],
      ),
    );
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}
