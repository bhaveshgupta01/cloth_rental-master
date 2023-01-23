import 'package:car_rental/shop.dart';
import 'package:flutter/material.dart';
import 'package:car_rental/constants.dart';


class Selection extends StatefulWidget {
  @override
  _State createState() => _State();
}

class _State extends State<Selection> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Saste Kapade Project',
              style: TextStyle(fontSize: 22,
            fontWeight: FontWeight.bold,
            color: Colors.grey[400],)
          ),
          backgroundColor: Colors.white,
        ),
        body: Padding(
            padding: EdgeInsets.all(10),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.all(10),
                    child:
                    RaisedButton(
                      shape: StadiumBorder(),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: new Text('Buyer',
                          style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                    ),
                      ),
                      color: kPrimaryColor,
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Showroom()),
                        );
                      },
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(10),
                    child:
                    RaisedButton(
                      shape: StadiumBorder(),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: new Text('Seller',
                          style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                    ),
                      ),
                      color: kPrimaryColor,
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Showroom()),
                        );
                      },
                    ),
                  ),
                ],
              ),
            )
        )
    );
  }
}