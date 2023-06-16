import 'package:flutter/material.dart';

class introPage3 extends StatelessWidget {
  const introPage3({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xffFBEAE7),
      child: Column(
        children: [
          SizedBox(height: 40,),
          Container(
            height:350,
            width: 400,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(40),
              child: Image(image: AssetImage('assets/images/face.jpg')
            ),
          ),),
          SizedBox(height: 30,),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                child: Center(
                  child: Text(
                    ' If you care for skin, then you are on the right place!',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 36,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),

              SizedBox(
                height: 22,
              ),
              SizedBox(width: 12,),
              Container(
                width: 200,
                child: Text(
                  '',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Colors.grey, fontWeight: FontWeight.bold,fontSize: 22),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
