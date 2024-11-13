import 'package:ecommerce/common/helper/navigator/app_navigator.dart';
import 'package:ecommerce/common/widgets/appbar/app_bar.dart';
import 'package:ecommerce/common/widgets/button/basic_app_button.dart';
import 'package:ecommerce/presentation/auth/pages/forgot_password.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class EnterPasswordPage extends StatelessWidget {
  const EnterPasswordPage({super.key});

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
            _passwordField(context),
            const SizedBox(height: 20,),
            _continueButton(),
            const SizedBox(height: 20,),
            _forgotPassword(context),
          ],
        ),
      )
    );
  }

  // Signin text widget
  Widget _signinText(BuildContext context) {
    return Text(
      'Sign In',
      style: TextStyle(
        fontSize: 32,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  // Email field widget
  Widget _passwordField(BuildContext context) {
    return const TextField(
      decoration: InputDecoration(
        hintText: 'Enter Password',
      ),
    );
  }

  // Continue button widget
  Widget _continueButton() {
    return BasicAppButton(
      onPressed: (){},
      title: 'Continue',
    );
  }

  // Create an account text widget
  Widget _forgotPassword(BuildContext context){
    return RichText(
      text: TextSpan(
        children: [
          TextSpan(
            text: 'Forgot password? ',
            ),
            TextSpan(
              text: 'Reset',
              recognizer: TapGestureRecognizer()..onTap = () {
                AppNavigator.push(context, const ForgotPasswordPage());
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