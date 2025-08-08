import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:test_flutter/controller/auth_controller.dart';
import 'package:test_flutter/widgets/login_form.dart';
import 'package:test_flutter/widgets/register_form.dart';
import 'package:animations/animations.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final AuthController authController = Get.put(AuthController());
  static const Color primaryBlue = Color(0xFF1E90FF);
  static const Color lightBlue = Color(0xFFE6F0FF);
  static const Color grayText = Color(0xFF6C757D);
  // Define the colors used in the UI for reusability
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        padding: const EdgeInsets.only(top: 50, left: 20, right: 20),
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(color: Colors.white),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'Welcome to SO',
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              SizedBox(height: 10),
              Text(
                'Login or Sign up to continue',
                style: TextStyle(fontSize: 16, color: Colors.grey),
              ),
              SizedBox(height: 30),
              _buildTabSection(),
              SizedBox(height: 20),
              Obx(() {
                return PageTransitionSwitcher(
                  duration: const Duration(milliseconds: 600),
                  reverse: !authController.isLoginActive.value,
                  transitionBuilder:
                      (
                        Widget child,
                        Animation<double> animation,
                        Animation<double> secondaryAnimation,
                      ) {
                        return SharedAxisTransition(
                          animation: animation,
                          secondaryAnimation: secondaryAnimation,
                          transitionType: SharedAxisTransitionType.horizontal,
                          child: child,
                        );
                      },
                  child: authController.isLoginActive.value
                      ? const LoginForm(key: ValueKey('login'))
                      : const RegisterForm(key: ValueKey('register')),
                );
              }),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTabSection() {
    return Container(
      padding: const EdgeInsets.all(4),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(30),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            spreadRadius: 1,
            blurRadius: 5,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Row(
        children: [
          // Login Button
          Expanded(
            child: GestureDetector(
              onTap: () {
                setState(() {
                  authController.isLoginActive.value = true;
                });
              },
              child: Container(
                decoration: BoxDecoration(
                  color: authController.isLoginActive.value
                      ? primaryBlue
                      : Colors.white,
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 12),
                  child: Text(
                    'Login',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: authController.isLoginActive.value
                          ? Colors.white
                          : primaryBlue,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            child: GestureDetector(
              onTap: () {
                setState(() {
                  authController.isLoginActive.value = false;
                });
              },
              child: Container(
                decoration: BoxDecoration(
                  color: authController.isLoginActive.value
                      ? Colors.white
                      : primaryBlue,
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 12),
                  child: Text(
                    'Sign Up',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: authController.isLoginActive.value
                          ? primaryBlue
                          : Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
