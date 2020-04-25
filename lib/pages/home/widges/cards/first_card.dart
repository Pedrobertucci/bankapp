import 'package:flutter/material.dart';

class FirstCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(5),
      child: Column(
        children: <Widget>[
          Expanded(
            flex: 3,
            child: Container(
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.all(20),
                          child: Row(
                            children: <Widget>[
                              Icon(
                                Icons.credit_card,
                                color: Colors.grey,
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Text("Cartão de Crédito",
                                  style: TextStyle(
                                      color: Colors.grey, fontSize: 13)),
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
                                Text("FATURA ATUAL",
                                    textAlign: TextAlign.start,
                                    style: TextStyle(
                                        color: Colors.teal,
                                        fontSize: 13,
                                        fontWeight: FontWeight.bold)),
                                Text.rich(
                                  TextSpan(text: "€ ", children: [
                                    TextSpan(
                                        text: "9300",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold)),
                                    TextSpan(text: ",80"),
                                  ]),
                                  textAlign: TextAlign.start,
                                  style: TextStyle(
                                    color: Colors.teal,
                                    fontSize: 28,
                                  ),
                                ),
                                Text.rich(
                                  TextSpan(
                                      text: "Limite Disponível ",
                                      children: [
                                        TextSpan(
                                            text: "€ 699,20",
                                            style: TextStyle(
                                                color: Colors.green,
                                                fontWeight: FontWeight.bold)),
                                      ]),
                                  textAlign: TextAlign.start,
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 12,
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                        SizedBox(height: MediaQuery.of(context).size.height * 0.1,)
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        top: 12, bottom: 12, left: 10, right: 15),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(5),
                      child: Container(
                        child: Column(
                          children: <Widget>[
                            Expanded(
                                flex: 3,
                                child: Container(color: Colors.orange)),
                            Expanded(
                                flex: 1, child: Container(color: Colors.blue)),
                            Expanded(
                                flex: 2, child: Container(color: Colors.green)),
                          ],
                        ),
                        width: 7,
                        decoration: BoxDecoration(
                            color: Colors.teal,
                            borderRadius: BorderRadius.circular(5)),
                      ),
                    ),
                  ),
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
                    Icon(Icons.shopping_cart, color: Colors.grey),
                    SizedBox(
                      width: 5,
                    ),
                    Flexible(
                      child: Text("compra mais recebem em Super Mercado no valor de € 19.82 Sexta",
                          style: TextStyle(color: Colors.black, fontSize: 13)),
                    ),
                    Icon(Icons.chevron_right, color: Colors.grey[400], size: 18),
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
}
