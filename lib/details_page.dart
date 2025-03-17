import 'package:flutter/material.dart';
import 'package:tourify/about_page.dart';
import 'package:tourify/cultural_tourism_data.dart'; // Ensure this import is correct

class DetailsPage extends StatelessWidget {
  final TourismType type; // Ensure the correct import is used

  const DetailsPage({super.key, required this.type});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          type.title,
          style: TextStyle(
            fontSize: screenWidth * 0.06, // Responsive font size
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Main Image
            Image.network(
              type.mainImage,
              height: screenHeight * 0.3, // Responsive height
              width: double.infinity,
              fit: BoxFit.cover,
            ),
            // Content Section
            Padding(
              padding: EdgeInsets.all(screenWidth * 0.04), // Responsive padding
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Title
                  Text(
                    type.title,
                    style: TextStyle(
                      fontSize: screenWidth * 0.06, // Responsive font size
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.02), // Responsive spacing
                  // Description
                  Text(
                    type.description,
                    style: TextStyle(
                      fontSize: screenWidth * 0.045, // Responsive font size
                      color: Color(0xFF203A58),
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.03), // Responsive spacing
                  // Highlights Section
                  Text(
                    'Highlights',
                    style: TextStyle(
                      fontSize: screenWidth * 0.07, // Responsive font size
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.02), // Responsive spacing
                  // Highlights List
                  ...type.details.map((detail) => Padding(
                        padding:
                            EdgeInsets.symmetric(vertical: screenHeight * 0.01),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Icon(
                              Icons.circle,
                              size: screenWidth * 0.03, // Responsive icon size
                              color: Color(0xFF203A58),
                            ),
                            SizedBox(
                                width:
                                    screenWidth * 0.02), // Responsive spacing
                            Expanded(
                              child: Text(
                                detail,
                                style: TextStyle(
                                  fontSize: screenWidth *
                                      0.04, // Responsive font size
                                  color: Colors.grey[700],
                                ),
                              ),
                            ),
                          ],
                        ),
                      )),
                  SizedBox(height: screenHeight * 0.03), // Responsive spacing
                  // Gallery Section
                  Text(
                    'Gallery',
                    style: TextStyle(
                      fontSize: screenWidth * 0.05, // Responsive font size
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.02), // Responsive spacing
                  // Gallery Grid
                  GridView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2, // 2 images per row
                      crossAxisSpacing:
                          screenWidth * 0.03, // Responsive spacing
                      mainAxisSpacing:
                          screenHeight * 0.02, // Responsive spacing
                    ),
                    itemCount: type.additionalImages.length,
                    itemBuilder: (context, index) {
                      return ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.network(
                          type.additionalImages[index],
                          fit: BoxFit.cover,
                        ),
                      );
                    },
                  ),
                  SizedBox(height: screenHeight * 0.03), // Responsive spacing
                  // Book Tickets Button
                  Center(
                    child: ElevatedButton(
                      onPressed: () {
                        // Navigate to another page
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                AboutPage(), // Replace with your destination page
                          ),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor:
                            Color(0xFF203A58), // Button background color
                        padding: EdgeInsets.symmetric(
                          vertical: screenHeight * 0.02, // Responsive padding
                          horizontal: screenWidth * 0.1, // Responsive padding
                        ),
                        textStyle: TextStyle(
                          fontSize: screenWidth * 0.045, // Responsive font size
                        ),
                      ),
                      child: Text(
                        'Book Now',
                        style: TextStyle(
                          color: Colors.white, // Set text color to white
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
