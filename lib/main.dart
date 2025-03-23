import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:provider/provider.dart';
import 'home_page.dart';
import 'store_page.dart';
import 'book_tickets_page.dart';
import 'cart_page.dart';
import 'profile_page.dart';
import 'app/screens/register/signin_page.dart';
import 'signup_page.dart';
import 'about_page.dart';
import 'app/provider/cart_model.dart';
import 'videos_page.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => CartModel(), // Wrap your app with Provider
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Tourify',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: 'Roboto',
      ),
      // home: const MainScreen(),
      home: SignInPage(),
      routes: {
        '/home': (context) => const MainScreen(),
        '/signup': (context) => const SignUpPage(),
        '/signin': (context) => const SignInPage(),
        '/about': (context) => const AboutPage(),
        '/cart': (context) => CartPage(),
      },
    );
  }
}

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0; // Track the selected index for the bottom nav bar

  // List of pages to display
  final List<Widget> _pages = [
    HomePage(),
    StorePage(),
    VideosPage(),
    TicketBookingPage(type: "type", selectedPackages: [], totalPrice: 0.0),
    CartPage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      // No AppBar here
      drawer: const AppDrawer(),
      body: _pages[_selectedIndex],

      // Add the CurvedNavigationBar here
      bottomNavigationBar: Container(
        height: screenHeight * 0.08, // Responsive height
        color: Colors.transparent,
        child: CurvedNavigationBar(
          backgroundColor:
              Colors.transparent, // Make the background transparent
          color: Color(0xFF203A58), // Use your app's primary color
          animationDuration: const Duration(milliseconds: 300),
          items: <Widget>[
            Icon(Icons.home, size: screenWidth * 0.06, color: Colors.white),
            Icon(Icons.store, size: screenWidth * 0.06, color: Colors.white),
            Icon(Icons.video_library,
                size: screenWidth * 0.06, color: Colors.white),
            Icon(Icons.airplane_ticket,
                size: screenWidth * 0.06, color: Colors.white),
            Icon(Icons.shopping_basket,
                size: screenWidth * 0.06, color: Colors.white),
          ],
          onTap: (index) {
            setState(() {
              _selectedIndex = index;
            });
          },
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
          // Tickets
          ListTile(
            leading: Icon(Icons.confirmation_number, color: Color(0xFF203A58)),
            title: const Text("Tickets"),
            onTap: () {
              Navigator.pop(context); // Close the drawer
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const TicketBookingPage(
                        type: "type", selectedPackages: [], totalPrice: 0.0)),
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
