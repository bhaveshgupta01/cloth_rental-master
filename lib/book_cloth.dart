import 'package:flutter/material.dart';
import 'package:car_rental/constants.dart';
import 'package:car_rental/data.dart';

class BookCloth extends StatefulWidget {

  final Cloth cloth;

  BookCloth({@required this.cloth});

  @override
  _BookClothState createState() => _BookClothState();
}

class _BookClothState extends State<BookCloth> {

  int _currentImage = 0;

  List<Widget> buildPageIndicator(){
    List<Widget> list = [];
    for (var i = 0; i < widget.cloth.images.length; i++) {
      list.add(buildIndicator(i == _currentImage));
    }
    return list;
  }

  Widget buildIndicator(bool isActive){
    return AnimatedContainer(
      duration: Duration(milliseconds: 150),
      margin: EdgeInsets.symmetric(horizontal: 6),
      height: 8,
      width: isActive ? 20 : 8,
      decoration: BoxDecoration(
        color: isActive ? Colors.black : Colors.grey[400],
        borderRadius: BorderRadius.all(
          Radius.circular(12),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Container(
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              Expanded(
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: 16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [

                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 16),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [

                            GestureDetector(
                              onTap: () {
                                Navigator.pop(context);
                              },
                              child: Container(
                                width: 45,
                                height: 45,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(15),
                                  ),
                                  border: Border.all(
                                    color: Colors.grey[300],
                                    width: 1,
                                  ),
                                ),
                                child: Icon(
                                  Icons.keyboard_arrow_left,
                                  color: Colors.black,
                                  size: 28,
                                )
                              ),
                            ),

                            Row(
                              children: [

                                Container(
                                  width: 45,
                                  height: 45,
                                  decoration: BoxDecoration(
                                    color: kPrimaryColor,
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(15),
                                    ),
                                  ),
                                  child: Icon(
                                    Icons.bookmark_border,
                                    color: Colors.white,
                                    size: 22,
                                  )
                                ),

                                SizedBox(
                                  width: 16,
                                ),

                                Container(
                                  width: 45,
                                  height: 45,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(15),
                                    ),
                                    border: Border.all(
                                      color: Colors.grey[300],
                                      width: 1,
                                    ),
                                  ),
                                  child: Icon(
                                    Icons.share,
                                    color: Colors.black,
                                    size: 22,
                                  )
                                ),

                              ],
                            ),

                          ],
                        ),
                      ),

                      SizedBox(
                        height: 16,
                      ),

                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 16),
                        child: Text(
                          widget.cloth.Name,
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 36,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),

                      SizedBox(
                        height: 8,
                      ),

                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 16),
                        child: Text(
                          widget.cloth.DressType,
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: 14,
                          ),
                        ),
                      ),

                      SizedBox(
                        height: 8,
                      ),

                      Expanded(
                        child: Container(
                          child: PageView(
                            physics: BouncingScrollPhysics(),
                            onPageChanged: (int page){
                              setState(() {
                                _currentImage = page;
                              });
                            },
                            children: widget.cloth.images.map((path) {
                              return Container(
                                padding: EdgeInsets.symmetric(horizontal: 16,),
                                child: Hero(
                                  tag: widget.cloth.Name,
                                  child: Image.asset(
                                    path,
                                    fit: BoxFit.scaleDown,
                                  ),
                                ),
                              );
                            }).toList(),
                          ),
                        ),
                      ),

                      widget.cloth.images.length > 1
                      ? Container(
                        margin: EdgeInsets.symmetric(vertical: 16),
                        height: 30,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: buildPageIndicator(),
                        ),
                      )
                      : Container(),

                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 16),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [

                            buildPricePerPeriod(
                              "3",
                              (widget.cloth.price).toInt(),
                              true,
                            ),
                            SizedBox(
                              width: 16,
                            ),
                            buildPricePerPeriod(
                              "7",
                              (widget.cloth.price*2).toInt(),
                              false,
                            ),
                            SizedBox(
                              width: 16,
                            ),
                            buildPricePerPeriod(
                              "14",
                              (widget.cloth.price*3).toInt(),
                              false,
                            ),

                          ],
                        ),
                      ),

                    ],
                  ),
                ),
              ),
              
              Container(
                decoration: BoxDecoration(
                  color: Colors.grey[100],
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [

                    Padding(
                      padding: EdgeInsets.only(top: 16, left: 16, right: 16),
                      child: Text(
                        "SPECIFICATIONS",
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          color: Colors.grey[400],
                        ),
                      ),
                    ),

                    Container(
                      height: 80,
                      padding: EdgeInsets.only(top: 8, left: 16,),
                      margin: EdgeInsets.only(bottom: 16),
                      child: ListView(
                        physics: BouncingScrollPhysics(),
                        scrollDirection: Axis.horizontal,
                        children: [
                          buildSpecificationCloth("Color", widget.cloth.color),
                          buildSpecificationCloth("Size", "M"),
                          buildSpecificationCloth("Material", "Cotton"),
                          buildSpecificationCloth("Origin", "India"),
                        ],
                      ),
                    ),

                  ],
                ),
              ),

            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(
        height: 90,
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [

                Text(
                  "3 Days",
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                  ),
                ),

                SizedBox(
                  height: 4,
                ),

                Row(
                  children: [

                    Text(
                      "INR 4999",
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 22,
                      ),
                    ),

                    SizedBox(
                      width: 8,
                    ),

                    Text(
                      "per day",
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 14,
                      ),
                    ),

                  ],
                ),

              ],
            ),
            Container(
              height: 50,
              decoration: BoxDecoration(
                color: kPrimaryColor,
                borderRadius: BorderRadius.all(
                  Radius.circular(15),
                ),
              ),
              child: Center(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 24),
                  child: Text(
                    "Book this Cloth",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildPricePerPeriod(String months, int price, bool selected){
    return Expanded(
      child: Container(
        height: 110,
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: selected ? kPrimaryColor : Colors.white,
          borderRadius: BorderRadius.all(
            Radius.circular(15),
          ),
          border: Border.all(
            color: Colors.grey[300],
            width: selected ? 0 : 1,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            Text(
              months + " Days",
              style: TextStyle(
                color: selected ? Colors.white : Colors.black,
                fontSize: 14,
                fontWeight: FontWeight.bold,
              ),
            ),

            Expanded(
              child: Container(),
            ),

            Text(
              "$price",
              style: TextStyle(
                color: selected ? Colors.white : Colors.black,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),

            Text(
              "INR",
              style: TextStyle(
                color: selected ? Colors.white : Colors.black,
                fontSize: 14,
              ),
            ),

          ],
        ),
      ),
    );
  }

  Widget buildSpecificationCloth(String title, String data){
    return Container(
      width: 130,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(
          Radius.circular(15),
        ),
      ),
      padding: EdgeInsets.symmetric(vertical: 8, horizontal: 16,),
      margin: EdgeInsets.only(right: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [

          Text(
            title,
            style: TextStyle(
              color: Colors.grey,
              fontSize: 14,
            ),
          ),

          SizedBox(
            height: 8,
          ),

          Text(
            data,
            style: TextStyle(
              color: Colors.black,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),

        ],
      ),
    );
  }

}