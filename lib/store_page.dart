import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'app/lists/store_items.dart';
import 'app/models/cart_item.dart';
import 'app/provider/cart_model.dart';
import 'core/utils/constants/sizes.dart';
//import 'cart_page.dart';

class StorePage extends StatefulWidget {
  const StorePage({super.key});

  @override
  _StorePageState createState() => _StorePageState();
}

class _StorePageState extends State<StorePage> {
  List<Map<String, dynamic>> filteredItems = [];
  TextEditingController searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    filteredItems = storeItems;
  }

  void filterItems(String query) {
    setState(() {
      filteredItems = storeItems.where((item) {
        String name = item['name'].toLowerCase();
        return name.contains(query.toLowerCase());
      }).toList();
    });
  }

  void updateQuantity(int index, int newQuantity, CartModel cartModel) {
    setState(() {
      if (newQuantity >= 0) {
        filteredItems[index]['quantity'] = newQuantity;
        if (newQuantity > 0) {
          cartModel.addItem(CartItem(
            name: filteredItems[index]['name'],
            price: filteredItems[index]['price'],
            image: filteredItems[index]['image'],
            quantity: newQuantity,
          ));
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final cartModel = Provider.of<CartModel>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Store",
          style: TextStyle(
            fontSize: AppSizes.screenWidth(context) * 0.06,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        backgroundColor: Color(0xFF203A58),
        iconTheme: IconThemeData(color: Colors.white),
        actions: [
          IconButton(
            icon: Icon(Icons.shopping_cart, color: Colors.white),
            onPressed: () {
              Navigator.pushNamed(context, '/cart');
            },
          ),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(AppSizes.screenWidth(context) * 0.03),
            child: TextField(
              controller: searchController,
              onChanged: filterItems,
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.grey[200],
                labelText: "Search for an item",
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
                prefixIcon: Icon(Icons.search),
              ),
            ),
          ),
          Expanded(
            child: GridView.builder(
              padding: EdgeInsets.all(AppSizes.screenWidth(context) * 0.03),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: AppSizes.screenWidth(context) > 600 ? 3 : 2,
                crossAxisSpacing: AppSizes.screenWidth(context) * 0.03,
                mainAxisSpacing: AppSizes.screenHeight(context) * 0.02,
                childAspectRatio: 0.5,
              ),
              itemCount: filteredItems.length,
              itemBuilder: (context, index) {
                var item = filteredItems[index];
                return Card(
                  elevation: 4,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Stack(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: AppSizes.screenHeight(context) * 0.2,
                            child: ClipRRect(
                              borderRadius: BorderRadius.vertical(
                                  top: Radius.circular(12)),
                              child: Image.asset(
                                item['image'],
                                width: double.infinity,
                                height: AppSizes.screenHeight(context) * 0.2,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          Padding(
                            padding:
                                EdgeInsets.all(AppSizes.screenWidth(context) * 0.03),
                            child: Text(
                              item['name'],
                              style: TextStyle(
                                fontSize: AppSizes.screenWidth(context) * 0.045,
                                fontWeight: FontWeight.bold,
                              ),
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: AppSizes.screenWidth(context) * 0.03),
                            child: Text(
                              '\$${item['price'].toString()}',
                              style: TextStyle(
                                fontSize: AppSizes.screenWidth(context) * 0.04,
                                color: Colors.grey[700],
                              ),
                            ),
                          ),
                          Spacer(),
                          Padding(
                            padding:
                                EdgeInsets.all(AppSizes.screenWidth(context) * 0.03),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                    color: Color(0xFF203A58),
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  child: IconButton(
                                    icon:
                                        Icon(Icons.remove, color: Colors.white),
                                    onPressed: () {
                                      updateQuantity(index,
                                          item['quantity'] - 1, cartModel);
                                    },
                                  ),
                                ),
                                Container(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: AppSizes.screenWidth(context) * 0.03,
                                      vertical: AppSizes.screenHeight(context) * 0.01),
                                  decoration: BoxDecoration(
                                    color: Colors.deepPurple[50],
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  child: Text(
                                    '${item['quantity']}',
                                    style: TextStyle(
                                      fontSize: AppSizes.screenWidth(context) * 0.045,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                Container(
                                  decoration: BoxDecoration(
                                    color: Color(0xFF203A58),
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  child: IconButton(
                                    icon: Icon(Icons.add, color: Colors.white),
                                    onPressed: () {
                                      updateQuantity(index,
                                          item['quantity'] + 1, cartModel);
                                    },
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
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

class StoreSearchDelegate extends SearchDelegate<String> {
  final List<Map<String, dynamic>> storeItems;
  final Function(String) filterItems;

  StoreSearchDelegate(this.storeItems, this.filterItems);

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: () {
          query = '';
        },
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.arrow_back),
      onPressed: () {
        close(context, "");
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return _buildSearchResults();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return _buildSearchResults();
  }

  Widget _buildSearchResults() {
    final results = storeItems.where((item) {
      String name = item['name'].toLowerCase();
      return name.contains(query.toLowerCase());
    }).toList();

    return ListView.builder(
      itemCount: results.length,
      itemBuilder: (context, index) {
        var item = results[index];
        return ListTile(
          leading: ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Image.asset(
              item['image'],
              width: 50,
              height: 50,
              fit: BoxFit.cover,
            ),
          ),
          title: Text(item['name']),
          subtitle: Text('\$${item['price'].toString()}'),
          onTap: () {
            // Navigate to item details or add to cart
          },
        );
      },
    );
  }
}
