import 'package:flutter/material.dart';

class introPage2 extends StatelessWidget {
  const introPage2({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xffFBEAE7),
      child: Column(
        children: [
          SizedBox(height: 40,),
          Container(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(40),
              child: Image(image: AssetImage('assets/images/beauty-products-recipients-assortment-grey-stones (3).jpg')),
            ),
          ),
          SizedBox(height: 30,),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                child: Center(
                  child: Text(
                    ' Solution                    ',
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      fontSize: 44,
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
                  'Taking care of your skin is essential for maintaining its health and appearance.',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Colors.grey, fontWeight: FontWeight.bold,fontSize: 26),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
