import 'package:flutter/material.dart';
import 'ancient_wonders_page.dart.dart';
import 'modern_egypt_page.dart.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Tourify',
          style: TextStyle(
            fontSize: screenWidth * 0.06, // Responsive font size
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        backgroundColor: Color(0xFF203A58), // Solid color for the app bar
        elevation: 0, // Remove shadow
        iconTheme: IconThemeData(color: Colors.white), // White back button
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(screenWidth * 0.04), // Responsive padding
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Description
              Text(
                'Egypt, a country linking northeast Africa with the Middle East, dates to the time of the pharaohs.',
                style: TextStyle(
                  fontSize: screenWidth * 0.045, // Responsive font size
                  color: Colors.grey[800],
                  height: 1.5,
                ),
              ),
              SizedBox(height: screenHeight * 0.03), // Responsive spacing

              // Ancient Wonders Section
              GestureDetector(
                onTap: () {
                  // Navigate to AncientWondersPage
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const AncientWondersPage(),
                    ),
                  );
                },
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white, // Normal white background
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.1),
                        blurRadius: 10,
                        offset: Offset(0, 4),
                      ),
                    ],
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(
                        screenWidth * 0.04), // Responsive padding
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            // Image for Ancient Wonders
                            Container(
                              width: screenWidth * 0.2, // Responsive width
                              height: screenWidth * 0.2, // Responsive height
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                image: DecorationImage(
                                  image: NetworkImage(
                                    'https://images.unsplash.com/photo-1584719866406-c76ddee48493?q=80&w=1974&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D', // Replace with your image URL
                                  ),
                                  fit: BoxFit.cover,
                                ),
                                border: Border.all(
                                  color: Color(0xFF203A58),
                                  width: 2,
                                ),
                              ),
                            ),
                            SizedBox(
                                width:
                                    screenWidth * 0.03), // Responsive spacing
                            Text(
                              'Ancient Wonders',
                              style: TextStyle(
                                fontSize:
                                    screenWidth * 0.06, // Responsive font size
                                fontWeight: FontWeight.bold,
                                color: Color(0xFF203A58),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                            height: screenHeight * 0.02), // Responsive spacing
                        Text(
                          'Explore the magnificent pyramids and ancient temples that have stood for thousands of years.',
                          style: TextStyle(
                            fontSize:
                                screenWidth * 0.045, // Responsive font size
                            color: Colors.grey[800],
                            height: 1.5,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(height: screenHeight * 0.03), // Responsive spacing

              // Modern Egypt Section
              GestureDetector(
                onTap: () {
                  // Navigate to ModernEgyptPage
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const ModernEgyptPage(),
                    ),
                  );
                },
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white, // Normal white background
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.1),
                        blurRadius: 10,
                        offset: Offset(0, 4),
                      ),
                    ],
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(
                        screenWidth * 0.04), // Responsive padding
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            // Image for Modern Egypt
                            Container(
                              width: screenWidth * 0.2, // Responsive width
                              height: screenWidth * 0.2, // Responsive height
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                image: DecorationImage(
                                  image: NetworkImage(
                                    'https://www.propertyfinder.eg/blog/wp-content/uploads/2019/03/New-El-Alamein.jpg', // Replace with your image URL
                                  ),
                                  fit: BoxFit.cover,
                                ),
                                border: Border.all(
                                  color: Color(0xFF203A58),
                                  width: 2,
                                ),
                              ),
                            ),
                            SizedBox(
                                width:
                                    screenWidth * 0.03), // Responsive spacing
                            Text(
                              'Modern Egypt',
                              style: TextStyle(
                                fontSize:
                                    screenWidth * 0.06, // Responsive font size
                                fontWeight: FontWeight.bold,
                                color: Color(0xFF203A58),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                            height: screenHeight * 0.02), // Responsive spacing
                        Text(
                          'Discover the vibrant cities, bustling markets, and rich culture of modern Egypt.',
                          style: TextStyle(
                            fontSize:
                                screenWidth * 0.045, // Responsive font size
                            color: Colors.grey[800],
                            height: 1.5,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
