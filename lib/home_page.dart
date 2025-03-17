import 'package:flutter/material.dart';
//import 'package:tourify/videos_page.dart';
import 'cultural_tourism_data.dart';
import 'details_page.dart';
import 'store_page.dart';
import 'book_tickets_page.dart';
import 'cart_page.dart';
import 'profile_page.dart';
//import 'about_page.dart';
//import 'videos_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Tourify',
          style: TextStyle(
            color: Colors.white, // White text
            fontSize: screenWidth * 0.06, // Responsive font size
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true, // Center the title
        backgroundColor: Color(0xFF203A58), // Match the theme
        iconTheme:
            const IconThemeData(color: Colors.white), // White hamburger menu
        actions: [
          // Search icon
          IconButton(
            icon: const Icon(Icons.search, color: Colors.white),
            onPressed: () {
              // Open a search dialog or navigate to a search page
              showSearch(
                context: context,
                delegate: AppSearchDelegate(),
              );
            },
          ),
        ],
      ),
      drawer: const AppDrawer(), // Use the AppDrawer widget
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Hero Section
            Container(
              height: screenHeight * 0.8, // Responsive height
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(
                    'https://images.unsplash.com/photo-1664695382720-8bb449396d47?q=80&w=1887&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
                  ),
                  fit: BoxFit.cover,
                ),
              ),
              child: Padding(
                padding:
                    EdgeInsets.all(screenWidth * 0.04), // Responsive padding
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Discover the Magic of Egypt',
                      style: TextStyle(
                        fontSize: screenWidth * 0.08, // Responsive font size
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(height: screenHeight * 0.02), // Responsive spacing
                    Text(
                      'Embark on a journey through time. Experience ancient wonders, rich culture, and unforgettable adventures in the land of the pharaohs.',
                      style: TextStyle(
                        fontSize: screenWidth * 0.045, // Responsive font size
                        color: Colors.grey[300],
                      ),
                    ),
                    SizedBox(height: screenHeight * 0.03), // Responsive spacing
                    ElevatedButton(
                      onPressed: () {
                        Navigator.pushNamed(context, '/about');
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFFF4C430),
                        padding: EdgeInsets.symmetric(
                          vertical: screenHeight * 0.02, // Responsive padding
                          horizontal: screenWidth * 0.06, // Responsive padding
                        ),
                      ),
                      child: Text(
                        'Explore More',
                        style: TextStyle(
                          fontSize: screenWidth * 0.045, // Responsive font size
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            // Featured Sections
            Padding(
              padding: EdgeInsets.all(screenWidth * 0.04), // Responsive padding
              child: GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, // 2 items per row
                  crossAxisSpacing: screenWidth * 0.04, // Responsive spacing
                  mainAxisSpacing: screenHeight * 0.02, // Responsive spacing
                  childAspectRatio: 0.8, // Adjust aspect ratio
                ),
                itemCount: culturalTourismTypes.length,
                itemBuilder: (context, index) {
                  final type = culturalTourismTypes[index];
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => DetailsPage(type: type),
                        ),
                      );
                    },
                    child: Card(
                      elevation: 4, // Add shadow
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Image
                          ClipRRect(
                            borderRadius: const BorderRadius.vertical(
                              top: Radius.circular(10),
                            ),
                            child: Image.network(
                              type.mainImage,
                              height: screenHeight * 0.15, // Responsive height
                              width: double.infinity,
                              fit: BoxFit.cover,
                            ),
                          ),
                          // Title
                          Padding(
                            padding: EdgeInsets.all(
                                screenWidth * 0.03), // Responsive padding
                            child: Center(
                              child: Text(
                                type.title,
                                style: TextStyle(
                                  fontSize: screenWidth *
                                      0.045, // Responsive font size
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xFF203A58),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Custom AppDrawer
class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          // Profile Section
          UserAccountsDrawerHeader(
            accountName: const Text("John Doe"), // Replace with user's name
            accountEmail:
                const Text("johndoe@example.com"), // Replace with user's email
            currentAccountPicture: CircleAvatar(
              backgroundImage: NetworkImage(
                'https://images.unsplash.com/photo-1603415526960-f7e0328c63b1?q=80&w=2070&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D', // Replace with user's image
              ),
            ),
            decoration: BoxDecoration(
              color: Color(0xFF203A58),
            ),
          ),
          // Profile
          ListTile(
            leading: Icon(Icons.person, color: Color(0xFF203A58)),
            title: const Text("Profile"),
            onTap: () {
              Navigator.pop(context); // Close the drawer
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ProfilePage()),
              );
            },
          ),
          // Store
          ListTile(
            leading: Icon(Icons.store, color: Color(0xFF203A58)),
            title: const Text("Store"),
            onTap: () {
              Navigator.pop(context); // Close the drawer
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => StorePage()),
              );
            },
          ),
          // ListTile(
          //   leading: Icon(Icons.video_library, color: Color(0xFF203A58)),
          //   title: const Text("Videos"),
          //   onTap: () {
          //     Navigator.pop(context); // Close the drawer
          //     Navigator.push(
          //       context,
          //       MaterialPageRoute(builder: (context) => VideosPage()),
          //     );
          //   },
          // ),
          // Tickets
          ListTile(
            leading: Icon(Icons.confirmation_number, color: Color(0xFF203A58)),
            title: const Text("Tickets"),
            onTap: () {
              Navigator.pop(context); // Close the drawer

              // Example data for selected packages and total price
              final List<Map<String, String>> selectedPackages = [
                {
                  'name': 'Example Package 1',
                  'details': 'This is an example package.',
                  'price': '\$100',
                },
                {
                  'name': 'Example Package 2',
                  'details': 'This is another example package.',
                  'price': '\$150',
                },
              ];
              final double totalPrice = 250.0; // Example total price

              // Navigate to TicketBookingPage with required parameters
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => TicketBookingPage(
                    type: 'Example Type', // Pass the type
                    selectedPackages:
                        selectedPackages, // Pass selected packages
                    totalPrice: totalPrice, // Pass total price
                  ),
                ),
              );
            },
          ),
          // Cart
          ListTile(
            leading: Icon(Icons.shopping_cart, color: Color(0xFF203A58)),
            title: const Text("Cart"),
            onTap: () {
              Navigator.pop(context); // Close the drawer
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => CartPage()),
              );
            },
          ),
          const Divider(),
          // Log Out
          ListTile(
            leading: Icon(Icons.logout, color: Color(0xFF203A58)),
            title: const Text("Log Out"),
            onTap: () {
              // Add logout logic here
              Navigator.pop(context); // Close the drawer
            },
          ),
        ],
      ),
    );
  }
}

// Custom Search Delegate for App-Wide Search
class AppSearchDelegate extends SearchDelegate<String> {
  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: const Icon(Icons.clear),
        onPressed: () {
          query = '';
        },
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.arrow_back),
      onPressed: () {
        close(context, ""); // Return an empty string instead of null
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
    // Placeholder for search results
    return Center(
      child: Text('Search results for: $query'),
    );
  }
}
