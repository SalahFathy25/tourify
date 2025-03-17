import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'app/provider/cart_model.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    final cartModel = Provider.of<CartModel>(context);
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Cart',
          style: TextStyle(
            color: Colors.white,
            fontSize: screenWidth * 0.06,
            fontWeight: FontWeight.bold,
          ),
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        backgroundColor: Color(0xFF203A58),
        elevation: 4,
        iconTheme: IconThemeData(color: Colors.white),
      ),
      body: Column(
        children: [
          Expanded(
            child: cartModel.items.isEmpty
                ? Center(
                    child: Text(
                      'Your cart is empty',
                      style: TextStyle(
                        fontSize: screenWidth * 0.05,
                        color: Colors.grey,
                      ),
                    ),
                  )
                : ListView.builder(
                    padding: EdgeInsets.all(screenWidth * 0.01),
                    itemCount: cartModel.items.length,
                    itemBuilder: (context, index) {
                      final item = cartModel.items[index];
                      return Container(
                        margin: EdgeInsets.only(bottom: screenHeight * 0.02),
                        height: screenHeight * 0.19, // Smaller box size
                        child: Card(
                          elevation: 4,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Padding(
                            padding: EdgeInsets.all(screenWidth * 0.03),
                            child: Row(
                              children: [
                                // Image Container
                                Container(
                                  width:
                                      screenWidth * 0.25, // Smaller image width
                                  height: screenHeight *
                                      0.15, // Smaller image height
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(12),
                                    image: DecorationImage(
                                      image: NetworkImage(item.image),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                SizedBox(width: screenWidth * 0.03),
                                // Item Details and Quantity Controls
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      // Item Name and Delete Button
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Expanded(
                                            child: Text(
                                              item.name,
                                              style: TextStyle(
                                                fontSize: screenWidth * 0.045,
                                                fontWeight: FontWeight.bold,
                                              ),
                                              maxLines:
                                                  2, // Allow up to 2 lines
                                              overflow: TextOverflow
                                                  .ellipsis, // Add ellipsis if text overflows
                                            ),
                                          ),
                                          IconButton(
                                            icon: Icon(
                                              Icons.delete,
                                              color: Colors.red,
                                              size: screenWidth * 0.06,
                                            ),
                                            onPressed: () {
                                              _showDeleteConfirmationDialog(
                                                  context, cartModel, index);
                                            },
                                          ),
                                        ],
                                      ),
                                      SizedBox(height: screenHeight * 0.01),
                                      // Price
                                      Text(
                                        '\$${(item.price * item.quantity).toStringAsFixed(2)}',
                                        style: TextStyle(
                                          fontSize: screenWidth * 0.04,
                                          color: Colors.grey[700],
                                        ),
                                      ),
                                      SizedBox(height: screenHeight * 0.01),
                                      // Quantity Controls
                                      Row(
                                        children: [
                                          IconButton(
                                            icon: Icon(
                                              Icons.remove_circle_outline,
                                              color: Color(0xFF203A58),
                                              size: screenWidth * 0.06,
                                            ),
                                            onPressed: () {
                                              cartModel.updateQuantity(
                                                  index, item.quantity - 1);
                                            },
                                          ),
                                          Container(
                                            padding: EdgeInsets.symmetric(
                                              horizontal: screenWidth * 0.03,
                                              vertical: screenHeight * 0.005,
                                            ),
                                            decoration: BoxDecoration(
                                              color: Colors.deepPurple[50],
                                              borderRadius:
                                                  BorderRadius.circular(8),
                                            ),
                                            child: Text(
                                              '${item.quantity}',
                                              style: TextStyle(
                                                fontSize: screenWidth * 0.045,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ),
                                          IconButton(
                                            icon: Icon(
                                              Icons.add_circle_outline,
                                              color: Color(0xFF203A58),
                                              size: screenWidth * 0.06,
                                            ),
                                            onPressed: () {
                                              cartModel.updateQuantity(
                                                  index, item.quantity + 1);
                                            },
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  ),
          ),
          // Total Amount and Checkout Button
          if (cartModel.items.isNotEmpty)
            Padding(
              padding: EdgeInsets.all(screenWidth * 0.04),
              child: Column(
                children: [
                  Text(
                    'Total Amount: \$${cartModel.totalPrice.toStringAsFixed(2)}',
                    style: TextStyle(
                      fontSize: screenWidth * 0.05,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.02),
                  ElevatedButton.icon(
                    onPressed: () {
                      // Handle checkout
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFF203A58),
                      padding: EdgeInsets.symmetric(
                        horizontal: screenWidth * 0.08,
                        vertical: screenHeight * 0.02,
                      ),
                      textStyle: TextStyle(
                        fontSize: screenWidth * 0.045,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      elevation: 4,
                    ),
                    icon: Icon(
                      Icons.shopping_cart_checkout,
                      color: Colors.white,
                      size: screenWidth * 0.06,
                    ),
                    label: Text(
                      'Checkout',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ],
              ),
            ),
        ],
      ),
    );
  }

  // Show Delete Confirmation Dialog
  void _showDeleteConfirmationDialog(
      BuildContext context, CartModel cartModel, int index) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Remove Item'),
        content:
            Text('Are you sure you want to remove this item from your cart?'),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop(); // Close the dialog
            },
            child: Text('Cancel', style: TextStyle(color: Colors.grey)),
          ),
          TextButton(
            onPressed: () {
              cartModel.removeItem(index); // Remove the item
              Navigator.of(context).pop(); // Close the dialog
            },
            child: Text('Remove', style: TextStyle(color: Colors.red)),
          ),
        ],
      ),
    );
  }
}
