import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  final Map<String, dynamic> user = {
    'name': 'John Doe',
    'email': 'john.doe@example.com',
    'phone': '+1 234 567 890',
    'address': '123 Luxurious Lane, Cairo, Egypt',
    'profileImage':
        'https://images.unsplash.com/photo-1603415526960-f7e0328c63b1?q=80&w=2070&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
    'bookingHistory': [
      {
        'date': '2023-10-01',
        'description': 'Ancient Egyptian Heritage Tour',
        'amount': 99.99,
      },
      {
        'date': '2023-09-15',
        'description': 'Nile River Cruise',
        'amount': 149.99,
      },
      // Add more bookings here
    ],
  };

  ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Profile',
          style: TextStyle(
            color: Colors.white,
            fontSize: screenWidth * 0.06, // Responsive font size
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Color(0xFF203A58),
        elevation: 10,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(screenWidth * 0.04), // Responsive padding
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Profile Photo and Name
              Center(
                child: Column(
                  children: [
                    CircleAvatar(
                      radius: screenWidth * 0.15, // Responsive radius
                      backgroundImage: NetworkImage(user['profileImage']),
                    ),
                    SizedBox(height: screenHeight * 0.02), // Responsive spacing
                    Text(
                      user['name'],
                      style: TextStyle(
                        fontSize: screenWidth * 0.06, // Responsive font size
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: screenHeight * 0.01), // Responsive spacing
                    Text(
                      user['email'],
                      style: TextStyle(
                        fontSize: screenWidth * 0.04, // Responsive font size
                        color: Colors.grey[600],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: screenHeight * 0.03), // Responsive spacing

              // User Information Section (Without Boxes)
              Text(
                'Contact Information',
                style: TextStyle(
                  fontSize: screenWidth * 0.05, // Responsive font size
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: screenHeight * 0.02), // Responsive spacing
              ListTile(
                leading: Icon(Icons.email, color: Color(0xFF203A58)),
                title: Text(
                  'Email Address',
                  style: TextStyle(
                    fontSize: screenWidth * 0.045, // Responsive font size
                  ),
                ),
                subtitle: Text(
                  user['email'],
                  style: TextStyle(
                    fontSize: screenWidth * 0.04, // Responsive font size
                  ),
                ),
              ),
              const Divider(),
              ListTile(
                leading: Icon(Icons.phone, color: Color(0xFF203A58)),
                title: Text(
                  'Phone Number',
                  style: TextStyle(
                    fontSize: screenWidth * 0.045, // Responsive font size
                  ),
                ),
                subtitle: Text(
                  user['phone'],
                  style: TextStyle(
                    fontSize: screenWidth * 0.04, // Responsive font size
                  ),
                ),
              ),
              const Divider(),
              ListTile(
                leading: Icon(Icons.location_on, color: Color(0xFF203A58)),
                title: Text(
                  'Address',
                  style: TextStyle(
                    fontSize: screenWidth * 0.045, // Responsive font size
                  ),
                ),
                subtitle: Text(
                  user['address'],
                  style: TextStyle(
                    fontSize: screenWidth * 0.04, // Responsive font size
                  ),
                ),
              ),
              SizedBox(height: screenHeight * 0.03), // Responsive spacing

              // Booking History Section
              Text(
                'Booking History',
                style: TextStyle(
                  fontSize: screenWidth * 0.05, // Responsive font size
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: screenHeight * 0.02), // Responsive spacing
              ...user['bookingHistory'].map((booking) {
                return Card(
                  elevation: 4,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  margin: EdgeInsets.symmetric(
                      vertical: screenHeight * 0.01), // Responsive margin
                  child: ListTile(
                    title: Text(
                      booking['description'],
                      style: TextStyle(
                        fontSize: screenWidth * 0.045, // Responsive font size
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    subtitle: Text(
                      'Date: ${booking['date']}',
                      style: TextStyle(
                        fontSize: screenWidth * 0.04, // Responsive font size
                        color: Colors.grey[600],
                      ),
                    ),
                    trailing: Text(
                      '\$${booking['amount'].toStringAsFixed(2)}',
                      style: TextStyle(
                        fontSize: screenWidth * 0.045, // Responsive font size
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                );
              }).toList(),
            ],
          ),
        ),
      ),
    );
  }
}
