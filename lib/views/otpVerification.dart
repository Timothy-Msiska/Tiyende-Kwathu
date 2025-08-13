import 'package:flutter/material.dart';

class OTPVerificationPage extends StatelessWidget {
  final String identifier;

  const OTPVerificationPage({super.key, required this.identifier});

  @override
  Widget build(BuildContext context) {
    final otpController = TextEditingController();

    return Scaffold(
      backgroundColor: const Color(0xFFF8F1E4),
      appBar: AppBar(
        title: const Text("Verify OTP"),
        backgroundColor: const Color(0xFF0A2F5A),
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            const SizedBox(height: 30),
            Text(
              'Enter the OTP sent to $identifier',
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 20),
            TextField(
              controller: otpController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'OTP Code',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 30),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF0A2F5A),
                  foregroundColor: Colors.white,
                ),
                onPressed: () {
                  // Here, verify the OTP
                  print('Verifying OTP: ${otpController.text}');
                  // Navigate to Home or Dashboard
                },
                child: const Text('Verify'),
              ),
            )
          ],
        ),
      ),
    );
  }
}
