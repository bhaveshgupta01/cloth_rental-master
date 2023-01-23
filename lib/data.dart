import 'package:flutter/material.dart';

class NavigationItem {

  IconData iconData;

  NavigationItem(this.iconData);

}

List<NavigationItem> getNavigationItemList(){
  return <NavigationItem>[
    NavigationItem(Icons.home),
    NavigationItem(Icons.calendar_today),
    NavigationItem(Icons.notifications),
    NavigationItem(Icons.person),
  ];
}

class Cloth {

  String DressType;
  String Name;
  double price;
  String condition;
  List<String> images;
  String color;

  Cloth(this.DressType, this.Name, this.price, this.condition, this.images, this.color);

}

List<Cloth> getClothList(){
  return <Cloth>[
    Cloth(
      "Indo Ethnic",
      "Red Dress",
      4999,
      "Weekly",
      [
        "assets/images/0_0.jpg",
        "assets/images/0_1.jpg",
        "assets/images/0_2.jpg",
      ],
      "Red"
    ),
    Cloth(
      "One Piece",
      "Yellow Dress",
      3580,
      "Monthly",
      [
        "assets/images/1_0.jpg",
        "assets/images/1_1.jpg",
        "assets/images/1_2.jpg",
      ],
      "Yellow"
    ),
    Cloth(
      "Party Dress",
      "Two Piece Black",
      1100,
      "Daily",
      [
        "assets/images/2_0.jpg",
        "assets/images/2_1.jpg",
        "assets/images/2_2.jpg",
      ],
      "Black"
    ),
    Cloth(
      "Formal Wear",
      "Office Wear",
      2200,
      "Monthly",
      [
        "assets/images/3_0.jpg",
        "assets/images/3_1.jpg",
      ],
      "White"
    ),
    Cloth(
      "Party Dress",
      "Multi Colour Top",
      3400,
      "Weekly",
      [
        "assets/images/4_0.jpg",
        "assets/images/4_1.jpg",
      ],
      "Grey"
    ),
    Cloth(
      "Kurti",
      "Green Kurti",
      3200,
      "Weekly",
      [
      "assets/images/5_0.jpg",
      "assets/images/5_1.jpg",
      "assets/images/5_2.jpg",
      ],
      "Green"
    ),
    Cloth(
      "Jacket",
      "Leather Jacket",
      2300,
      "Weekly",
      [
        "assets/images/6_0.jpg",
        "assets/images/6_1.jpg",
        "assets/images/6_2.jpg",
        "assets/images/6_3.jpg",
      ],
      "Black"
    ),
    Cloth(
      "Gown",
      "Red Ethnic",
      4450,
      "Weekly",
      [
        "assets/images/7_0.jpg",
        "assets/images/7_1.jpg",
        "assets/images/7_2.jpg",
      ],
      "Red"
    ),
    Cloth(
      "Party",
      "Black Dress",
      9000,
      "Daily",
      [
        "assets/images/8_0.jpg",
        "assets/images/8_1.jpg",
      ],
      "Black"
    ),
    Cloth(
      "Bridal",
      "Red Lehanga",
      12000,
      "Monthly",
      [
        "assets/images/9_0.jpg",
        "assets/images/9_1.jpg",
      ],
      "Red"
    ),
  ];
}

class Dealer {

  String name;
  int sale;
  String image;


  Dealer(this.name, this.sale, this.image);

}

List<Dealer> getDealerList(){
  return <Dealer>[
    Dealer(
      "H&M",
      10,
      "assets/images/B1.png",
    ),
    Dealer(
      "FabIndia",
      12,
      "assets/images/B2.jpg",
    ),
    Dealer(
      "Old Delhi",
      25,
      "assets/images/B3.png",
    ),
  ];
}

class Filter {

  String name;

  Filter(this.name);

}

List<Filter> getFilterList(){
  return <Filter>[
    Filter("Best Match"),
    Filter("Highest Price"),
    Filter("Lowest Price"),
  ];
}