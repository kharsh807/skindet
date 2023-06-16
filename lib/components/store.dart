import 'package:det/components/shop.dart';
import 'package:flutter/material.dart';

import 'bottom_nav_bar.dart';
import 'cart.dart';

class Store extends StatefulWidget {


  @override
  State<Store> createState() => _HomePageState();
}

class _HomePageState extends State<Store>{

  int _selectedIndex = 0;

  void navigationBottomBar(int index){
    setState(() {
      _selectedIndex=index;
    });
}

final List<Widget> _pages = [

  const ShopPage(),

  const CartPage()
];
 @override
 Widget build(BuildContext context) {
  return Scaffold(
      backgroundColor: Colors.grey[300],
      bottomNavigationBar: MyBottomNavBar(
        onTabChange: (index) => navigationBottomBar(index),


      ),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
        icon:Icon(Icons.menu, color: Colors.black,),
        onPressed: () {}, 
        )
      ),
      body: _pages[_selectedIndex],
    );
  }
}
