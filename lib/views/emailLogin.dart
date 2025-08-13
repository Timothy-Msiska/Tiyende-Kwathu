import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:tiyende_kwathu/views/id.dart';
import 'package:tiyende_kwathu/views/register.dart';
import 'package:tiyende_kwathu/views/forgotPassword.dart';

class HomepageEmail extends StatefulWidget {
  const HomepageEmail({super.key});

  @override
  State<HomepageEmail> createState() => _HomepageEmailState();
}

class _HomepageEmailState extends State<HomepageEmail> {
  bool isIdLogin = false; // Default to email login
  bool _obscureText = true; // Controls password visibility

  // Add FirebaseAuth instance
  final FirebaseAuth _auth = FirebaseAuth.instance;

  // Controllers for the email and password TextFields
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  String loginMessage = '';

  // Method to handle email/password login
  Future<void> login() async {
    try {
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
        email: emailController.text.trim(),
        password: passwordController.text.trim(),
      );
      setState(() {
        loginMessage = 'Login Successful! Welcome ${userCredential.user?.email}';
      });

      // TODO: Navigate to next page or home screen after successful login
      // Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => YourNextPage()));

    } on FirebaseAuthException catch (e) {
      setState(() {
        loginMessage = e.message ?? 'Login failed. Please try again.';
      });
    }
  }

  @override
  void dispose() {
    // Dispose controllers when widget is removed from widget tree
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0A2F5A),
      body: SafeArea(
        child: Column(
          children: [
            // AppBar Branding
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Text(
                    'Tiyende Kwathu',
                    style: TextStyle(
                      fontSize: 32,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Icon(Icons.help_outline, color: Colors.white),
                ],
              ),
            ),
            const SizedBox(height: 70),

            // Login Container
            Expanded(
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.all(20),
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
                ),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      // Toggle Buttons
                      const SizedBox(height: 40),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => const Homepage()),
                              );
                            },
                            child: Container(
                              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                              decoration: BoxDecoration(
                                color: isIdLogin ? const Color(0xFF0A2F5A) : Colors.grey[200],
                                borderRadius: const BorderRadius.horizontal(left: Radius.circular(30)),
                              ),
                              child: Text(
                                'ID/Passport Login',
                                style: TextStyle(
                                  color: isIdLogin ? Colors.white : Colors.black87,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                          ),
                          GestureDetector(
                            onTap: () => setState(() => isIdLogin = false),
                            child: Container(
                              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                              decoration: BoxDecoration(
                                color: !isIdLogin ? const Color(0xFF0A2F5A) : Colors.grey[200],
                                borderRadius: const BorderRadius.horizontal(right: Radius.circular(30)),
                              ),
                              child: Text(
                                'Email Login',
                                style: TextStyle(
                                  color: !isIdLogin ? Colors.white : Colors.black87,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),

                      const SizedBox(height: 40),

                      // Email Input with controller
                      TextField(
                        controller: emailController,
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(
                          labelText: 'Email',
                          hintText: 'you@example.com',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          filled: true,
                          fillColor: Colors.grey[100],
                        ),
                      ),

                      const SizedBox(height: 20),

                      // Password Input with visibility toggle and controller
                      TextField(
                        controller: passwordController,
                        obscureText: _obscureText,
                        decoration: InputDecoration(
                          labelText: 'Password',
                          suffixIcon: IconButton(
                            icon: Icon(
                              _obscureText ? Icons.visibility_off : Icons.visibility,
                            ),
                            onPressed: () {
                              setState(() {
                                _obscureText = !_obscureText;
                              });
                            },
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          filled: true,
                          fillColor: Colors.grey[100],
                        ),
                      ),

                      const SizedBox(height: 10),

                      // Display login message
                      if (loginMessage.isNotEmpty)
                        Text(
                          loginMessage,
                          style: const TextStyle(color: Colors.red),
                        ),

                      const SizedBox(height: 30),

                      // Forgot Password
                      Align(
                        alignment: Alignment.centerRight,
                        child: TextButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => const ForgotPasswordPage()),
                            );
                          },
                          child: const Text(
                            'Forgot your password?',
                            style: TextStyle(color: Color(0xFF0A2F5A)),
                          ),
                        ),
                      ),

                      const SizedBox(height: 40),

                      // Register
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => const RegisterPage()),
                          );
                        },
                        child: Text.rich(
                          TextSpan(
                            text: "Don't have an account? ",
                            style: TextStyle(color: Colors.black87),
                            children: [
                              TextSpan(
                                text: 'Register',
                                style: TextStyle(
                                  color: Color(0xFF0A2F5A),
                                  fontWeight: FontWeight.bold,
                                  decoration: TextDecoration.underline,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),

                      const SizedBox(height: 20),

                      // Login Button triggers Firebase sign-in
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: login, // <-- Call login method here
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFF0A2F5A),
                            padding: const EdgeInsets.symmetric(vertical: 16),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                          child: const Text(
                            'LOGIN',
                            style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
                          ),
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
    );
  }
}
