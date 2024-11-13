import 'package:ecommerce/common/helper/navigator/app_navigator.dart';
import 'package:ecommerce/common/widgets/appbar/app_bar.dart';
import 'package:ecommerce/common/widgets/button/basic_app_button.dart';
import 'package:ecommerce/presentation/auth/pages/enter_password.dart';
import 'package:ecommerce/presentation/auth/pages/signin.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class SignupPage extends StatelessWidget {
  const SignupPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      // Appbar section
      appBar: const BasicAppbar(),

      // Content section
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 40,
          ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _signinText(context),
            const SizedBox(height: 20,),
            _firstnameField(context),
            const SizedBox(height: 20,),
            _lastnameField(context),
            const SizedBox(height: 20,),
            _emailField(context),
            const SizedBox(height: 20,),
            _passwordField(context),
            const SizedBox(height: 20,),
            _continueButton(context),
            const SizedBox(height: 20,),
            _createAccount(context),
          ],
        ),
      )
    );
  }

  // Create account text widget
  Widget _signinText(BuildContext context) {
    return Text(
      'Create Account',
      style: TextStyle(
        fontSize: 32,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  // Firstname field widget
  Widget _firstnameField(BuildContext context) {
    return const TextField(
      decoration: InputDecoration(
        hintText: 'Firstname',
      ),
    );
  }

  // Firstname field widget
  Widget _lastnameField(BuildContext context) {
    return const TextField(
      decoration: InputDecoration(
        hintText: 'Lastname',
      ),
    );
  }

  // Email field widget
  Widget _emailField(BuildContext context) {
    return const TextField(
      decoration: InputDecoration(
        hintText: 'Enter Address',
      ),
    );
  }

  // Password field widget
  Widget _passwordField(BuildContext context) {
    return const TextField(
      decoration: InputDecoration(
        hintText: 'Password',
      ),
    );
  }

  // Continue button widget
  Widget _continueButton(BuildContext context) {
    return BasicAppButton(
      onPressed: (){
        AppNavigator.push(context, const EnterPasswordPage());
      },
      title: 'Continue',
    );
  }

  // Create an account text widget
  Widget _createAccount(BuildContext context){
    return RichText(
      text: TextSpan(
        children: [
          TextSpan(
            text: 'Do you have an account? '
            ),
            TextSpan(
              text: 'Signin',
              recognizer: TapGestureRecognizer()..onTap = () {
                AppNavigator.pushReplacement(context, const SigninPage());
              },
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
        ],
      ),
    );
  }
}