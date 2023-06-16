import 'package:flutter/material.dart';

class introPage1 extends StatelessWidget {
  const introPage1({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xffFBEAE7),
      child: Column(
        children: [
          Container(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(40),
              child: Image(image: AssetImage('assets/images/42270554.jpg')),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                child: Text(
                  'Skin                    ',
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontSize: 44,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Container(
                child: Text(
                  'Problems',
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontSize: 44,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(
                height: 16,
              ),
              Container(
                width: 200,
                child: Text(
                  'Skin problems encompass various conditions that affect the health, appearance, and comfort of the skin, requiring attention and appropriate treatment',
                  textAlign: TextAlign.start,
                  style: TextStyle(
                      color: Colors.grey, fontWeight: FontWeight.bold,fontSize: 18),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
