import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gra_dtc/Utilities/color.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {

  bool obscurePassword = true;
  bool obscureConfirm = true;
  bool agreed = false;


  final TextEditingController fullNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController tinController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmController = TextEditingController();


// ✅ Regex-based password strength detection
  String getPasswordStrength(String password) {
    if (password.isEmpty) return '';


    final strongRegex = RegExp(
        r'^(?=.*[A-Z])(?=.*[a-z])(?=.*\d)(?=.*[!@#\\$%^&*(),.?":{}|<>]).{8,}\$');
    final mediumRegex = RegExp(r'^(?=.*[A-Za-z])(?=.*\d).{6,}\$');


    if (strongRegex.hasMatch(password)) return 'Strong';
    if (mediumRegex.hasMatch(password)) return 'Medium';
    return 'Weak';
  }


  Map<String, dynamic> evaluatePassword(String password) {
    final result = getPasswordStrength(password);


    switch (result) {
      case 'Strong':
        return {'label': 'Strong', 'color': Colors.green, 'value': 1.0};
      case 'Medium':
        return {'label': 'Medium', 'color': Colors.orange, 'value': 0.6};
      case 'Weak':
        return {'label': 'Weak', 'color': Colors.red, 'value': 0.3};
      default:
        return {'label': '', 'color': Colors.grey, 'value': 0.0};
    }
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    final passwordEval = evaluatePassword(passwordController.text);
    return Scaffold(
      backgroundColor: ColorPatch.pageBackground,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: width*0.03, vertical: height*0.04),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Text(
                  'Create Your Taxpayer Account',
                  style: GoogleFonts.inter(
                    fontSize: width*0.045,
                    fontWeight: FontWeight.bold,
                    color: ColorPatch.charcoal,
                  ),
                ),
              ),
              SizedBox(height: height*0.015),
              Center(
                child: Text(
                  'Please fill in the details, create your secure account.',
                  style: GoogleFonts.inter(
                    fontSize: width*0.035,
                    color: ColorPatch.charcoal,
                  ),
                ),
              ),
              SizedBox(height: height*0.03),

              _buildTextField(width, height, 'Full Name', 'Enter your full name', fullNameController),
              _buildTextField(width, height, 'Email', 'Enter your email address', emailController, keyboardType: TextInputType.emailAddress),
              _buildTextField(width, height, 'TIN (Taxpayer Identification Number)', 'Enter your 11-digit TIN', tinController, keyboardType: TextInputType.number),

              Text('Password', style: GoogleFonts.inter(fontWeight: FontWeight.w600), textAlign: TextAlign.left,),
              SizedBox(height: height*0.01),
              TextField(
                controller: passwordController,
                obscureText: obscurePassword,
                onChanged: (_) => setState(() {}),
                decoration: InputDecoration(
                  hintText: 'Enter your password',
                  hintStyle: GoogleFonts.inter(
                      fontSize: width*0.035
                  ),
                  filled: true,
                  fillColor: ColorPatch.white,
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: ColorPatch.inputBorder),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: ColorPatch.inputBorder),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: ColorPatch.inputBorder, width: width*0.008),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  contentPadding: EdgeInsets.symmetric(vertical: height*0.02, horizontal: width*0.04),
                ),
              ),
              const SizedBox(height: 8),
              LinearProgressIndicator(
                value: passwordEval['value'],
                color: passwordEval['color'],
                backgroundColor: Colors.grey[300],
                minHeight: 4,
              ),
              const SizedBox(height: 4),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Use upper, lower, number & symbol (8+ chars)',
                    style: GoogleFonts.manrope(fontSize: 12, color: Colors.grey[600]),
                  ),
                  Text(
                    passwordEval['label'],
                    style: GoogleFonts.manrope(
                      fontSize: 12,
                      color: passwordEval['color'],
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),

              Text('Confirm Password', style: GoogleFonts.manrope(fontWeight: FontWeight.w600)),
              const SizedBox(height: 6),
              TextField(
                controller: confirmController,
                obscureText: obscureConfirm,
                decoration: InputDecoration(
                  hintText: 'Confirm password',
                  hintStyle: GoogleFonts.inter(
                      fontSize: width*0.035
                  ),
                  filled: true,
                  fillColor: ColorPatch.white,
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: ColorPatch.inputBorder),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: ColorPatch.inputBorder),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: ColorPatch.inputBorder, width: width*0.008),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  contentPadding: EdgeInsets.symmetric(vertical: height*0.02, horizontal: width*0.04),
                ),
              ),

              const SizedBox(height: 24),
              Row(
                children: [
                  Checkbox(
                    value: agreed,
                    onChanged: (v) => setState(() => agreed = v ?? false),
                    activeColor: ColorPatch.primaryTeal,
                  ),
                  Expanded(
                    child: Text.rich(
                      TextSpan(
                        text: 'I agree to the ',
                        style: GoogleFonts.manrope(fontSize: 13, color: Colors.grey[700]),
                        children: [
                          TextSpan(
                            text: 'Terms and Conditions',
                            style: const TextStyle(color: Color(0xFF0B4E6B), fontWeight: FontWeight.w600),
                          ),
                          const TextSpan(text: ' and '),
                          TextSpan(
                            text: 'Privacy Policy',
                            style: const TextStyle(color: Color(0xFF0B4E6B), fontWeight: FontWeight.w600),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 24),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: agreed ? () {} : null,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: ColorPatch.primaryTeal,
                    padding: const EdgeInsets.symmetric(vertical: 14),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: Text(
                    'Sign Up',
                    style: GoogleFonts.manrope(
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                      fontSize: 16,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 16),
              Center(
                child: Text.rich(
                  TextSpan(
                    text: 'Already have an account? ',
                    style: GoogleFonts.manrope(fontSize: 13, color: Colors.grey[700]),
                    children: [
                      TextSpan(
                        text: 'Sign In',
                        style: GoogleFonts.inter(
                          color: Color(0xFF0B4E6B),
                          fontWeight: FontWeight.w600,
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
  Widget _buildTextField(double width, double height,String label, String hint, TextEditingController controller, {TextInputType? keyboardType}) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(label, style: GoogleFonts.manrope(fontWeight: FontWeight.w600)),
          const SizedBox(height: 6),
          TextField(
            controller: controller,
            keyboardType: keyboardType,
            decoration: InputDecoration(
              hintText: 'Enter your email or TIN',
              hintStyle: GoogleFonts.inter(
                  fontSize: width*0.035
              ),
              filled: true,
              fillColor: ColorPatch.white,
              border: OutlineInputBorder(
                borderSide: BorderSide(color: ColorPatch.inputBorder),
                borderRadius: BorderRadius.circular(10.0),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: ColorPatch.inputBorder),
                borderRadius: BorderRadius.circular(10.0),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: ColorPatch.inputBorder, width: width*0.008),
                borderRadius: BorderRadius.circular(10.0),
              ),
              contentPadding: EdgeInsets.symmetric(vertical: height*0.02, horizontal: width*0.04),
            ),
          ),
        ],
      ),
    );
  }
}

