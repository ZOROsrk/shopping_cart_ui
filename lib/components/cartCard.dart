import 'package:flutter/material.dart';
import 'package:shopping_cart/model/itemModel.dart';

class CartCard extends StatefulWidget {
  final Item item;

  const CartCard({Key key, this.item}) : super(key: key);
  @override
  _CartCardState createState() => _CartCardState();
}

class _CartCardState extends State<CartCard> {
  String quantity = "1";
  @override
  Widget build(BuildContext context) {
    final _media = MediaQuery.of(context).size;
    return Container(
      height: _media.height * .4,
      child: Card(
        color: Colors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding:
                      const EdgeInsets.only(left: 10.0, top: 10, bottom: 8),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        width: _media.width * .6,
                        child: Text(
                          widget.item.desc,
                          maxLines: 2,
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 18,
                              fontWeight: FontWeight.w500),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        widget.item.quantity,
                        style: TextStyle(color: Colors.grey, fontSize: 14),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: <Widget>[
                          Text(
                            "Seller: ${widget.item.seller}",
                            style: TextStyle(color: Colors.grey, fontSize: 14),
                          ),
                          Icon(
                            Icons.check_circle,
                            color: Colors.grey,
                            size: 15,
                          )
                        ],
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: <Widget>[
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: <Widget>[
                                  Text(
                                    "\u20B9 ${widget.item.offPrice}",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 23),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 10.0),
                                    child: Text(
                                      "\u20B9 ${widget.item.realPrice}",
                                      style: TextStyle(
                                          color: Colors.grey,
                                          decoration:
                                              TextDecoration.lineThrough),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Text(
                                    widget.item.off + "%off",
                                    style: TextStyle(
                                        color: Colors.green,
                                        fontSize: 13,
                                        fontWeight: FontWeight.w600),
                                  )
                                ],
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                "2 offers available",
                                style: TextStyle(
                                    color: Colors.green,
                                    fontSize: 13,
                                    fontWeight: FontWeight.w600),
                              )
                            ],
                          )
                        ],
                      )
                    ],
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.only(top: 10.0, right: 8, bottom: 8),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        color: Colors.white,
                        child: Row(
                          children: <Widget>[
                            Container(
                              width: _media.width * .3,
                              height: _media.height * .2,
                              child: Image.network(
                                widget.item.image,
                                fit: BoxFit.cover,
                              ),
                            )
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 8.0),
                        child: Row(
                          children: <Widget>[
                            Text(
                              "Qty:",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            DropdownButton<String>(
                              value: quantity,
                              items: <String>["1", "2", "3", "4", "5"]
                                  .map((String value) =>
                                      DropdownMenuItem<String>(
                                          value: value, child: Text(value)))
                                  .toList(),
                              onChanged: (_value) {
                                setState(() {
                                  quantity = _value;
                                });
                              },
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Container(
                  height: _media.height * .08,
                  width: _media.width * .4875,
                  child: RaisedButton(
                    onPressed: () {},
                    color: Colors.white,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Icon(
                          Icons.favorite,
                          size: 15,
                          color: Colors.grey,
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Text(
                          "SAVE FOR LATER",
                          style: TextStyle(fontSize: 15),
                        )
                      ],
                    ),
                  ),
                ),
                Container(
                  height: _media.height * .08,
                  width: _media.width * .4875,
                  child: RaisedButton(
                    onPressed: () {},
                    color: Colors.white,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Icon(
                          Icons.delete,
                          size: 15,
                          color: Colors.grey,
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Text(
                          "REMOVE",
                          style: TextStyle(fontSize: 15),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
