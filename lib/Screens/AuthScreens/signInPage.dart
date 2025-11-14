import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gra_dtc/Screens/AuthScreens/signUpPage.dart';
import 'package:gra_dtc/Screens/landingPage.dart';
import 'package:gra_dtc/Utilities/color.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {

  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _obscurePassword = true;
  bool _loading = false;
  final Color _revealColor = Colors.green;
  final Color _obscureColor = Colors.red;


  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }


  void _togglePassword() {
    setState(() {
      _obscurePassword = !_obscurePassword;
    });
  }


  void _submit() async {
    // if (!_formKey.currentState!.validate()) return;
    setState(() => _loading = true);


// Simulate network call
    await Future.delayed(Duration(seconds: 1));


    setState(() => _loading = false);


// Normally: call your auth API here. For demo show a snackbar.
//     ScaffoldMessenger.of(context).showSnackBar(
//       SnackBar(content: Text('Signed in (demo)')),
//     );
    Navigator.push(
        context,
        MaterialPageRoute(builder: (context)=>LandingPage())
    );
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    final maxWidth = MediaQuery.of(context).size.width.clamp(0.0, 480.0);

    return Scaffold(
      backgroundColor: ColorPatch.pageBackground,
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: EdgeInsets.symmetric(horizontal: width*0.03),
            child: ConstrainedBox(
              constraints: BoxConstraints(maxWidth: maxWidth),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  _buildBranding(width, height),
                  SizedBox(height: 28),
                  _buildCard(context, width, height),
                  SizedBox(height: 18),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
  Widget _buildBranding(double width, double height) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
// small circular logo imitation
        Container(
          width: width*0.4,
          height: height*0.1,
          decoration: BoxDecoration(
            color: ColorPatch.primaryTeal,
            shape: BoxShape.circle,
            image: DecorationImage(
              image: AssetImage("assets/images/logo.png")
            )
          ),
        ),
        SizedBox(height: height*0.02),
        Text(
          'GRA Digital Tax Collection Portal',
          style: GoogleFonts.inter(
            fontSize: width*0.045,
            fontWeight: FontWeight.w700,
            color: ColorPatch.charcoal,
          ),
        ),
        SizedBox(height: 8),
        Text(
          'Securely manage your taxes online.',
          style: GoogleFonts.inter(fontSize: width*0.035, color: ColorPatch.charcoal.withOpacity(0.7)),
        ),
      ],
    );
  }

  Widget _buildCard(BuildContext context, double width, double height) {
    return Card(
      elevation: 0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      color: Colors.white,
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: height*0.02, horizontal: width*0.03),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                'Sign in to your Taxpayer Account',
                textAlign: TextAlign.center,
                style: GoogleFonts.inter(fontSize: width*0.04, fontWeight: FontWeight.w700, color: ColorPatch.charcoal),
              ),
              SizedBox(height: height*0.02),
              _buildEmailField(width, height),
              SizedBox(height: height*0.01),
              _buildPasswordField(width, height),
              Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                  onPressed: () {
                    // navigate to forgot password
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Forgot password tapped')));
                  },
                  style: TextButton.styleFrom(
                    backgroundColor: ColorPatch.white,
                    textStyle: GoogleFonts.inter(fontWeight: FontWeight.w600, color: ColorPatch.primaryTeal),
                  ),
                  child: Text(
                    'Forgot Password?',
                    style: TextStyle(
                      color: ColorPatch.primaryTeal,
                      fontSize: width*0.035
                    ),
                  ),
                ),
              ),
              _buildSignInButton(width, height),
              SizedBox(height: height*0.03),
              Center(
                child: Wrap(
                  children: [
                    Text('Don\'t have an account? ',
                      style: GoogleFonts.inter(
                        color: ColorPatch.charcoal
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        // ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Sign up tapped')));
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context)=>SignUpPage())
                        );
                        // print("tasking");
                      },
                      child: Text('Sign Up', style: GoogleFonts.inter(color: ColorPatch.charcoal, fontWeight: FontWeight.w600, decoration: TextDecoration.underline)),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildEmailField(double width, double height) {
    return TextFormField(
      controller: _emailController,
      keyboardType: TextInputType.emailAddress,
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
      textInputAction: TextInputAction.next,
      validator: (value) {
        if (value == null || value.isEmpty) return 'Please enter email or TIN';
        return null;
      },
    );
  }


  Widget _buildPasswordField(double width, double height) {
    return TextFormField(
      controller: _passwordController,
      obscureText: _obscurePassword,
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
        suffixIcon: IconButton(
          icon: Icon(_obscurePassword ? Icons.visibility_outlined : Icons.visibility_off_outlined),
          color: _obscurePassword ? _revealColor : _obscureColor,
          onPressed: _togglePassword,
        ),
      ),
      textInputAction: TextInputAction.done,
      keyboardType: TextInputType.text,
      validator: (value) {
        if (value == null || value.isEmpty) return 'Please enter your password';
        if (value.length < 6) return 'Password must be at least 6 characters';
        return null;
      },
    );
  }


  Widget _buildSignInButton(double width, double height) {
    return SizedBox(
      height: 52,
      child: ElevatedButton(
        onPressed: _loading ? null : _submit,
        style: ElevatedButton.styleFrom(
          backgroundColor: ColorPatch.primaryTeal,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
        ),
        child: _loading
            ? SizedBox(width: width*0.03, height: height*0.02, child: CircularProgressIndicator(strokeWidth: 2.0, valueColor: AlwaysStoppedAnimation(Colors.white)))
            : Text('Sign In',
                style: GoogleFonts.inter(
                  color: ColorPatch.white,
                  fontWeight: FontWeight.w700,
                  fontSize: width*0.04
                ),
              ),
      ),
    );
  }


  Widget _buildFooterLinks() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Column(
        children: [
          Divider(height: 1, color: ColorPatch.inputBorder),
          SizedBox(height: 12),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _footerTextButton('Help Center', () {}),
              _verticalDivider(),
              _footerTextButton('Privacy Policy', () {}),
              _verticalDivider(),
              _footerTextButton('Terms of Service', () {}),
            ],
          )
        ],
      ),
    );
  }


  Widget _footerTextButton(String text, VoidCallback onTap) {
    return TextButton(
      onPressed: onTap,
      child: Text(text, style: TextStyle(color: ColorPatch.charcoal.withOpacity(0.75))),
    );
  }


  Widget _verticalDivider() {
    return Container(
      height: 20,
      child: VerticalDivider(color: ColorPatch.inputBorder, thickness: 1),
    );
  }
}
