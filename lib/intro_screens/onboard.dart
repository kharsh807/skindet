import 'package:det/home.dart';
import 'package:det/intro_screens/1stPage.dart';
import 'package:det/intro_screens/2ndpage.dart';
import 'package:det/intro_screens/3rdpage.dart';
import 'package:det/que/testing.dart';
import 'package:flutter/material.dart';

import 'package:smooth_page_indicator/smooth_page_indicator.dart';
class onBoard extends StatefulWidget {

  @override
  State<onBoard> createState() => _onBoardState();
}

class _onBoardState extends State<onBoard> {
//controller to keep track of the page we are on
  PageController _controller= PageController();
  bool OnLastPage = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Stack(
        children: [
          PageView(
            controller: _controller,
            onPageChanged: (index){
                setState(() {
                  OnLastPage = (index==2);
                });
            },
            children: [
              introPage1(),
              introPage2(),
              introPage3(),
            ],
          ),

          Container(
              alignment: Alignment(0.4,0.75),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SmoothPageIndicator(controller: _controller , count: 3),
                  SizedBox(width: 20,),

                  OnLastPage
                      ? GestureDetector(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context){
                        return Testing();
                      }));
                    },
                    child: Container(
                      child: Center(child: Text('Get started',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),),
                      width: 110,
                      height: 50,
                      decoration: BoxDecoration(
                        color: Colors.redAccent,
                        borderRadius: BorderRadius.circular(16),
                      ),
                    ),):
                  GestureDetector(
                    onTap: (){
                      _controller.nextPage(duration: Duration(microseconds: 500), curve:Curves.decelerate);
                    },
                    child: Container(
                      child: Center(child: Text('Next',style: TextStyle(color: Colors.white),),),
                      width: 110,
                      height: 50,
                      decoration: BoxDecoration(
                        color: Colors.redAccent,
                        borderRadius: BorderRadius.circular(16),
                      ),
                    ),)
                ],
              ))
        ],
      ),

    );
  }
}

