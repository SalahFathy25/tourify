import 'package:flutter/material.dart';
import 'package:tourify/core/utils/constants/colors.dart';
import 'package:tourify/core/utils/constants/sizes.dart';
import 'package:tourify/core/utils/constants/strings.dart';

import 'app/widgets/my_sized_box.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _isPasswordVisible = false; // Track password visibility

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primary,
        title: Text(
          appStrings.appName,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: const Color.fromARGB(255, 255, 255, 255),
            fontSize: AppSizes.screenWidth(context) * 0.06,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(
              AppSizes.screenWidth(context) * 0.04), // Responsive padding
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                mySizedBox(height: AppSizes.screenHeight(context) * 0.03),
                Text(
                  'Create Your Account',
                  style: TextStyle(
                    fontSize: AppSizes.screenWidth(context) * 0.06,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF203A58),
                  ),
                ),
                mySizedBox(height: AppSizes.screenHeight(context) * 0.05),
                TextFormField(
                  controller: _nameController,
                  decoration: InputDecoration(
                    labelText: 'Full Name',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your full name';
                    }
                    return null;
                  },
                ),
                mySizedBox(
                    height: AppSizes.screenHeight(context) *
                        0.03), // Responsive spacing
                TextFormField(
                  controller: _emailController,
                  decoration: InputDecoration(
                    labelText: 'Email address',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  keyboardType: TextInputType.emailAddress,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your email address';
                    }
                    if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
                      return 'Please enter a valid email address';
                    }
                    return null;
                  },
                ),
                mySizedBox(
                    height: AppSizes.screenHeight(context) *
                        0.03), // Responsive spacing
                TextFormField(
                  controller: _passwordController,
                  decoration: InputDecoration(
                    labelText: 'Password',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    suffixIcon: IconButton(
                      icon: Icon(
                        _isPasswordVisible
                            ? Icons.visibility
                            : Icons.visibility_off,
                      ),
                      onPressed: () {
                        setState(() {
                          _isPasswordVisible =
                              !_isPasswordVisible; // Toggle visibility
                        });
                      },
                    ),
                  ),
                  obscureText:
                      !_isPasswordVisible, // Use the visibility variable
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter a password';
                    }
                    if (value.length < 6) {
                      return 'Password must be at least 6 characters';
                    }
                    return null;
                  },
                ),
                mySizedBox(height: AppSizes.screenHeight(context) * 0.05),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFF203A58),
                    minimumSize: Size(
                        double.infinity, AppSizes.screenHeight(context) * 0.07),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      Navigator.pushNamedAndRemoveUntil(
                          context, '/home', (_) => false);
                    }
                  },
                  child: Text(
                    appStrings.signUp,
                    style: TextStyle(
                      fontSize: AppSizes.screenWidth(context) * 0.045,
                      color: Colors.white,
                    ),
                  ),
                ),
                mySizedBox(height: AppSizes.screenHeight(context) * 0.03),
                TextButton(
                  onPressed: () {
                    Navigator.pushReplacementNamed(context, '/signin');
                  },
                  child: Text(
                    'Already have an account? Sign in',
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: AppSizes.screenWidth(context) *
                          0.04, // Responsive font size
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
