import 'package:det/components/product.dart';
import 'package:det/components/product_tile.dart';
import 'package:flutter/material.dart';


class ShopPage extends StatelessWidget {
  const ShopPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: const [
              Text(
                "Products",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 24,
                ),
              ),
              Text(
                'See all',
                style:
                    TextStyle(fontWeight: FontWeight.bold, color: Colors.blue),
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 18,
        ),
        Expanded(
            child: ListView.builder(
                itemCount: 4,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  Product product = Product(
                      name: 'Anti Wrinkle',
                      price: '1000',
                      imagePath: 'assets/m020t0173_c_cosmetic_jar_27june22.jpg',
                      description: ' Contain active ingredients that help hydrate, nourish, and rejuvenate the skin, reducing the appearance of wrinkles and promoting a more youthful complexion.');
                  return ProductTile(
                    product: product,
                  );
                }))
      ],
    );
  }
}
