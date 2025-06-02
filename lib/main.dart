
import 'package:charitoon/home.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

void main() {
  runApp(const ChariToon());
}

class ChariToon extends StatelessWidget {
  const ChariToon({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ChariToon Sign Up',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'Inter',
        primaryColor: const Color(0xFFFFA500),
      ),
      home: const SignUpPage(),
    );
  }
}

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final _emailController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

  // Logo widget with orange squares and text
  Widget _buildLogo() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          width: 48,
          height: 48,
          child: Stack(
            clipBehavior: Clip.none,
            children: [
              Positioned(
                left: 0,
                top: 16,
                child: Container(
                  width: 16,
                  height: 16,
                  color: const Color(0xFFFFA500),
                ),
              ),
              Positioned(
                left: 16,
                top: 0,
                child: Container(
                  width: 16,
                  height: 16,
                  color: const Color(0xFFFFA500),
                ),
              ),
              Positioned(
                left: 32,
                top: 16,
                child: Container(
                  width: 16,
                  height: 16,
                  color: const Color(0xFFFFA500),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(width: 8),
        RichText(
          text: const TextSpan(
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
            children: [
              TextSpan(
                text: 'Chari',
                style: TextStyle(color: Color(0xFFFFA500)),
              ),
              TextSpan(
                text: 'Toon',
                style: TextStyle(color: Colors.black),
              ),
            ],
          ),
        ),
      ],
    );
  }

  // Email input field
  Widget _buildEmailInput() {
    return TextField(
      controller: _emailController,
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        hintText: 'email@domain.com',
        hintStyle: const TextStyle(color: Color(0xFFB0B0B0)),
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(6),
          borderSide: const BorderSide(color: Color(0xFFD1D5DB)),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(6),
          borderSide: const BorderSide(color: Color(0xFFD1D5DB)),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(6),
          borderSide: const BorderSide(color: Color(0xFFFFA500), width: 2),
        ),
      ),
      style: const TextStyle(color: Colors.black87),
    );
  }

  // Orange Continue button with white text
  Widget _buildContinueButton() {
    return SizedBox(
      width: double.infinity,
      height: 44,
      child: ElevatedButton(
        onPressed: () {Navigator.push(context, MaterialPageRoute(builder: (context) => Home(),),);},
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xFFFFA500),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(6),
          ),
          padding: EdgeInsets.zero,
          textStyle: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w400,
            color: Colors.white,
          ),
        ),
        child: const Center(
          child: Text(
            'Continue',
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
    );
  }

  // Divider with "or" text
  Widget _buildDividerWithText() {
    return Row(
      children: [
        const Expanded(
          child: Divider(
            color: Color(0xFFD1D5DB),
            thickness: 1,
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: Text(
            'or',
            style: TextStyle(
              color: Colors.grey[400],
              fontSize: 14,
            ),
          ),
        ),
        const Expanded(
          child: Divider(
            color: Color(0xFFD1D5DB),
            thickness: 1,
          ),
        ),
      ],
    );
  }

  // Button style for social buttons (Google and Apple)
  ButtonStyle _socialButtonStyle() {
    return OutlinedButton.styleFrom(
      backgroundColor: const Color(0xFFF3F4F6),
      side: const BorderSide(color: Color(0xFFD1D5DB)),
      padding: const EdgeInsets.symmetric(vertical: 10),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(6),
      ),
      textStyle: const TextStyle(fontSize: 14),
    );
  }

  // Google sign-in button with black icon and white text centered
  Widget _buildGoogleButton() {
    return SizedBox(
      width: double.infinity,
      height: 40,
      child: OutlinedButton(
        onPressed: () {},
        style: _socialButtonStyle(),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: const [
            FaIcon(
              FontAwesomeIcons.google,
              color: Colors.black,
              size: 20,
            ),
            SizedBox(width: 8),
            Text(
              'Continue with Google',
              style: TextStyle(
                color: Color(0xFF374151),
                fontSize: 14,
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Apple sign-in button with black icon and white text centered
  Widget _buildAppleButton() {
    return SizedBox(
      width: double.infinity,
      height: 40,
      child: OutlinedButton(
        onPressed: () {},
        style: _socialButtonStyle(),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: const [
            FaIcon(
              FontAwesomeIcons.apple,
              color: Colors.black,
              size: 20,
            ),
            SizedBox(width: 8),
            Text(
              'Continue with Apple',
              style: TextStyle(
                color: Color(0xFF374151), 
                fontSize: 14,
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Terms and privacy policy text
  Widget _buildTermsText() {
    return Padding(
      padding: const EdgeInsets.only(top: 24),
      child: Text.rich(
        TextSpan(
          style: TextStyle(
            fontSize: 11,
            color: Colors.grey[400],
            height: 1.3,
          ),
          children: [
            const TextSpan(text: 'By clicking continue, you agree to our '),
            TextSpan(
              text: 'Terms of Service',
              style: const TextStyle(decoration: TextDecoration.underline),
            ),
            const TextSpan(text: ' and '),
            TextSpan(
              text: 'Privacy Policy',
              style: const TextStyle(decoration: TextDecoration.underline),
            ),
          ],
        ),
        textAlign: TextAlign.center,
      ),
    );
  }

  // Main build method
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 360),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  _buildLogo(),
                  const SizedBox(height: 48),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: const [
                      Text(
                        'Create an account',
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 16,
                          color: Colors.black,
                        ),
                      ),
                      SizedBox(height: 4),
                      Text(
                        'Enter your email to sign up for this app',
                        style: TextStyle(
                          fontSize: 14,
                          color: Color(0xFF1F2937),
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  _buildEmailInput(),
                  const SizedBox(height: 16),
                  _buildContinueButton(),
                  const SizedBox(height: 24),
                  _buildDividerWithText(),
                  const SizedBox(height: 24),
                  _buildGoogleButton(),
                  const SizedBox(height: 12),
                  _buildAppleButton(),
                  _buildTermsText(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}