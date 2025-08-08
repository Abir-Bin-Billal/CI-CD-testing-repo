import 'package:flutter/material.dart';

class RegisterForm extends StatelessWidget {
  const RegisterForm({super.key});

  @override
  Widget build(BuildContext context) {
    const Color primaryBlue = Color(0xFF1E90FF);
    const Color lightBlue = Color(0xFFE6F0FF);
    const Color grayText = Color(0xFF6C757D);
    return Container(
      height: MediaQuery.of(context).size.height * 0.6, // Adjust height as needed
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [lightBlue, Colors.white],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(10),
        boxShadow: const [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 10,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _textField(label: 'Username', icon: Icons.person),
          const SizedBox(height: 20),
         _textField(label: 'Email', icon: Icons.email),
          const SizedBox(height: 20),
          _textField(label: 'Password', icon: Icons.lock, obscureText: true),
          const SizedBox(height: 20),
         ElevatedButton(
            onPressed: () {
              // Handle login action
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: primaryBlue,
              minimumSize: const Size(double.infinity, 50), // Full width button
              padding: const EdgeInsets.symmetric(vertical: 16),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            child: const Text(
              'Register',
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(height: 20),
          const Center(
            child: Text(
              'Or continue with',
              style: TextStyle(
                color: grayText,
                fontSize: 14,
              ),
            ),
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              IconButton(
                icon: const Icon(Icons.facebook, color: Colors.blue),
                onPressed: () {
                  // Handle Facebook login
                },
              ),
               IconButton(
                icon: Icon(Icons.golf_course, color: Colors.red),
                onPressed: () {
                  // Handle Google login
                },
              ),
               IconButton(
                icon: Icon(Icons.apple, color: Colors.black),
                onPressed: () {
                  // Handle Apple login
                },
              ),
            ],
          ),
          const Spacer(),
          Align(
            alignment: Alignment.center,
            child: TextButton(
              onPressed: () {
                
              },
              child: const Text(
                'Already have an account? Login',
                style: TextStyle(
                  color: primaryBlue,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
    Widget _textField({
    required String label,
    required IconData icon,
    bool obscureText = false,
  }) {
    return TextField(
      obscureText: obscureText,
      decoration: InputDecoration(
        labelText: label,
        prefixIcon: Icon(icon),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }
}