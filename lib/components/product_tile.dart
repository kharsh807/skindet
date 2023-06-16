import 'package:det/components/product.dart';
import 'package:flutter/material.dart';



//import 'product.dart';
class ProductTile extends StatelessWidget {
  Product product;
  ProductTile({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 25),
      width: 280,
      decoration: BoxDecoration(
        color: Colors.grey[100],
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(16),
            child: Image.asset(product.imagePath),
          ),
          Text(
            product.description,
            style: TextStyle(color: Colors.grey),
          ),
          Padding(
            padding: const EdgeInsets.only(left:25),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
          
           
                    Text(product.name,style: const TextStyle(fontWeight: FontWeight.bold,
                    fontSize: 20,) ,),
                    const SizedBox(height: 5,),
          
                    Text('Rs.'+product.price, style: const TextStyle(
                    fontSize: 15,) )
          
          
                  ],
                ),
                
                Container(
                  padding:EdgeInsets.all(20),
                  decoration: BoxDecoration(color: Colors.black,borderRadius: BorderRadius.only(topLeft: Radius.circular(12),
                  bottomRight: Radius.circular(12 ))),
                  
                   child: const Icon(Icons.add)) 
              ],
            ),
          ),
        ],
      ),
    );
  }
}
