import 'package:flutter/material.dart';
import 'book_tickets_page.dart';

class ModernEgyptPage extends StatefulWidget {
  const ModernEgyptPage({super.key});

  @override
  _ModernEgyptPageState createState() => _ModernEgyptPageState();
}

class _ModernEgyptPageState extends State<ModernEgyptPage> {
  final List<int> selectedPackageIndices =
      []; // Store multiple selected indices

  final List<Map<String, String>> packages = [
    {
      'name': 'Cairo Tower & Nile Dinner Cruise',
      'details': 'Enjoy a panoramic view of Cairo and a luxurious Nile cruise.',
      'price': '\$100',
    },
    {
      'name': 'Alexandria City Tour',
      'details': 'Explore the historic city of Alexandria.',
      'price': '\$150',
    },
    {
      'name': 'New Administrative Capital Visit',
      'details': 'Discover the modern architecture of Egypt\'s new capital.',
      'price': '\$200',
    },
    {
      'name': 'Sharm El Sheikh Resort Getaway',
      'details': 'Relax at the luxurious resorts of Sharm El Sheikh.',
      'price': '\$300',
    },
    {
      'name': 'Aswan High Dam & Philae Temple',
      'details': 'Visit the Aswan High Dam and the beautiful Philae Temple.',
      'price': '\$180',
    },
  ];

  void togglePackageSelection(int index) {
    setState(() {
      if (selectedPackageIndices.contains(index)) {
        selectedPackageIndices.remove(index); // Deselect if already selected
      } else {
        selectedPackageIndices.add(index); // Select if not already selected
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Modern Egypt',
          style: TextStyle(
            fontSize: screenWidth * 0.06,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        backgroundColor: Color(0xFF203A58),
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: Padding(
        padding: EdgeInsets.all(screenWidth * 0.04),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: packages.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () => togglePackageSelection(index),
                    child: Container(
                      margin:
                          EdgeInsets.symmetric(vertical: screenHeight * 0.01),
                      decoration: BoxDecoration(
                        color: selectedPackageIndices.contains(index)
                            ? Colors.blue[50]
                            : Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                          color: selectedPackageIndices.contains(index)
                              ? Color(0xFF203A58)
                              : Colors.grey[300]!,
                          width: 2,
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.1),
                            blurRadius: 5,
                            offset: Offset(0, 2),
                          ),
                        ],
                      ),
                      child: Padding(
                        padding: EdgeInsets.all(screenWidth * 0.04),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              packages[index]['name']!,
                              style: TextStyle(
                                fontSize: screenWidth * 0.05,
                                fontWeight: FontWeight.bold,
                                color: Color(0xFF203A58),
                              ),
                            ),
                            SizedBox(height: screenHeight * 0.01),
                            Text(
                              packages[index]['details']!,
                              style: TextStyle(
                                fontSize: screenWidth * 0.04,
                                color: Colors.grey[800],
                              ),
                            ),
                            SizedBox(height: screenHeight * 0.01),
                            Text(
                              packages[index]['price']!,
                              style: TextStyle(
                                fontSize: screenWidth * 0.045,
                                fontWeight: FontWeight.bold,
                                color: Colors.green[800],
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
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: selectedPackageIndices.isNotEmpty
                    ? () {
                        // Calculate the total price of selected packages
                        double totalPrice = 0;
                        for (int index in selectedPackageIndices) {
                          totalPrice += double.parse(
                              packages[index]['price']!.replaceAll('\$', ''));
                        }

                        // Navigate to TicketBookingPage with selected packages and total price
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => TicketBookingPage(
                              type: 'Modern Egypt',
                              selectedPackages: selectedPackageIndices
                                  .map((index) => packages[index])
                                  .toList(),
                              totalPrice: totalPrice,
                            ),
                          ),
                        );
                      }
                    : null,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFF203A58),
                  padding: EdgeInsets.symmetric(vertical: screenHeight * 0.02),
                ),
                child: Text(
                  'Book Now',
                  style: TextStyle(
                    fontSize: screenWidth * 0.05,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
