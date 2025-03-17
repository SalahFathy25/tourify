import 'package:flutter/material.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final List<Map<String, dynamic>> products = [
    {
      'name': 'Egyptian Souvenir',
      'price': 15.99,
      'image': 'https://via.placeholder.com/150',
      'rating': 4.5,
    },
    {
      'name': 'Pyramid Model',
      'price': 29.99,
      'image': 'https://via.placeholder.com/150',
      'rating': 4.7,
    },
    {
      'name': 'Pharaoh Statue',
      'price': 45.99,
      'image': 'https://via.placeholder.com/150',
      'rating': 4.8,
    },
    {
      'name': 'Egyptian Book',
      'price': 19.99,
      'image': 'https://via.placeholder.com/150',
      'rating': 4.6,
    },
    // Add more products here
  ];

  String _searchQuery = '';
  double _minPrice = 0;
  double _maxPrice = 100;

  @override
  Widget build(BuildContext context) {
    final filteredProducts = products.where((product) {
      final nameMatch =
          product['name'].toLowerCase().contains(_searchQuery.toLowerCase());
      final priceMatch =
          product['price'] >= _minPrice && product['price'] <= _maxPrice;
      return nameMatch && priceMatch;
    }).toList();

    return Scaffold(
      appBar: AppBar(
        title: Text('Search'),
        backgroundColor: Color(0xFF203A58),
      ),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(16),
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Search products...',
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              onChanged: (value) {
                setState(() {
                  _searchQuery = value;
                });
              },
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              children: [
                Text('Price Range:'),
                SizedBox(width: 8),
                Expanded(
                  child: RangeSlider(
                    values: RangeValues(_minPrice, _maxPrice),
                    min: 0,
                    max: 100,
                    onChanged: (values) {
                      setState(() {
                        _minPrice = values.start;
                        _maxPrice = values.end;
                      });
                    },
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              padding: EdgeInsets.all(16),
              itemCount: filteredProducts.length,
              itemBuilder: (context, index) {
                final product = filteredProducts[index];
                return Card(
                  elevation: 4,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: ListTile(
                    leading: ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: Image.network(
                        product['image'],
                        width: 50,
                        height: 50,
                        fit: BoxFit.cover,
                      ),
                    ),
                    title: Text(product['name']),
                    subtitle: Text('\$${product['price'].toStringAsFixed(2)}'),
                    trailing: Icon(Icons.arrow_forward_ios, size: 16),
                    onTap: () {
                      // Navigate to product details
                    },
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
