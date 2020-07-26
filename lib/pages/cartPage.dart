import 'package:flutter/material.dart';
import 'package:shopping_cart/components/cartCard.dart';
import 'package:shopping_cart/components/priceDetailsCard.dart';
import 'package:shopping_cart/model/itemModel.dart';
import 'package:shopping_cart/repo/cartRepo.dart';

class Cartpage extends StatefulWidget {
  @override
  _CartpageState createState() => _CartpageState();
}

class _CartpageState extends State<Cartpage> {
  List<Item> allItems = CartRepo().getAllCartItems();
  @override
  Widget build(BuildContext context) {
    final _media = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text("My Cart"),
      ),
      body: Stack(
        children: <Widget>[
          Container(
            decoration: BoxDecoration(color: Color(0xFFeeeeee)),
            height: _media.height,
            width: _media.width,
          ),
          ListView(
            shrinkWrap: true,
            children: <Widget>[
              CartCard(
                item: allItems[0],
              ),
              CartCard(
                item: allItems[1],
              ),
              CartCard(
                item: allItems[2],
              ),
              PriceDetailsCard(),
              SizedBox(
                height: 100,
              )
            ],
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              width: _media.width,
              height: _media.height * .08,
              decoration: BoxDecoration(color: Colors.white, boxShadow: [
                BoxShadow(color: Colors.black87, blurRadius: 5.0),
                BoxShadow(color: Colors.white, blurRadius: 10.0),
              ]),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(left: 10.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          "\u20B9 150",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 20),
                        ),
                        Text(
                          "View price details",
                          style: TextStyle(
                              color: Colors.blueGrey,
                              fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 10.0),
                    child: Container(
                        width: _media.width * .4,
                        child: RaisedButton(
                          onPressed: () {},
                          color: Colors.orange[900],
                          child: Text(
                            "PLACE ORDER",
                            style: TextStyle(color: Colors.white),
                          ),
                        )),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
