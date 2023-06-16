import 'package:flutter/material.dart';

class HomePage1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cart'),
      ),
      body: ListView(
        children: const [
          ListTile(
            leading: Icon(Icons.shopping_cart),
            title: Text('Product 1'),
            subtitle: Text('Price: \$10'),
          ),
          ListTile(
            leading: Icon(Icons.shopping_cart),
            title: Text('Product 2'),
            subtitle: Text('Price: \$20'),
          ),
          ListTile(
            leading: Icon(Icons.shopping_cart),
            title: Text('Product 3'),
            subtitle: Text('Price: \$15'),
          ),
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Total: \$45',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              ElevatedButton(
                onPressed: () {
                  // Add your logic for checkout here
                },
                child: Text('Checkout'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}



