import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:tourify/app/widgets/register/custom_text_form_field.dart';
import 'package:tourify/core/utils/constants/colors.dart';
import 'package:tourify/core/utils/constants/strings.dart';

import '../../widgets/my_sized_box.dart';
import '../../../core/utils/constants/sizes.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  _SignInPageState createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primary,
        title: Text(
          'Tourify',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white,
            fontSize: AppSizes.screenWidth(context) * 0.06,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(AppSizes.screenWidth(context) * 0.04),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                mySizedBox(height: AppSizes.screenHeight(context) * 0.03),
                Text(
                  appStrings.welcome,
                  style: TextStyle(
                    fontSize: AppSizes.screenWidth(context) * 0.06,
                    fontWeight: FontWeight.bold,
                    color: AppColors.primary,
                  ),
                ),
                mySizedBox(height: AppSizes.screenHeight(context) * 0.05),
                CustomTextFormField(
                  controller: _emailController,
                  label: 'Email address',
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
                mySizedBox(height: AppSizes.screenHeight(context) * 0.03),
                CustomTextFormField(
                  controller: _passwordController,
                  label: 'Password',
                  obscure: true,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your password';
                    }
                    if (value.length < 6) {
                      return 'Password must be at least 6 characters';
                    }
                    return null;
                  },
                  keyboardType: TextInputType.visiblePassword,
                  enabled: true,
                ),
                mySizedBox(height: AppSizes.screenHeight(context) * 0.05),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primary,
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
                    appStrings.signIn,
                    style: TextStyle(
                      fontSize: AppSizes.screenWidth(context) * 0.045,
                      color: Colors.white,
                    ),
                  ),
                ),
                mySizedBox(height: AppSizes.screenHeight(context) * 0.03),
                RichText(
                  text: TextSpan(
                    text: 'New to Tourify?',
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: AppSizes.screenWidth(context) * 0.04,
                    ),
                    children: [
                      TextSpan(
                        text: ' Create an account',
                        style: TextStyle(
                          color: AppColors.primary,
                          fontSize: AppSizes.screenWidth(context) * 0.04,
                        ),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            Navigator.pushReplacementNamed(context, '/signup');
                          },
                      ),
                    ],
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
