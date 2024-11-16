import 'package:ecommerce/common/helper/navigator/app_navigator.dart';
import 'package:ecommerce/common/widgets/appbar/app_bar.dart';
import 'package:ecommerce/common/widgets/button/basic_reactive_button.dart';
import 'package:ecommerce/domain/auth/usecases/signin.dart';
import 'package:ecommerce/presentation/auth/pages/forgot_password.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../common/bloc/button/button_state.dart';
import '../../../common/bloc/button/button_state_cubit.dart';
import '../../../data/auth/models/user_signin_req.dart';

class EnterPasswordPage extends StatelessWidget {
  final UserSigninReq signinReq;
  EnterPasswordPage({
    required this.signinReq,
    super.key});

  final TextEditingController _passwordCon = TextEditingController();

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
        child: BlocProvider(
          create: (context) => ButtonStateCubit(),
          child: BlocListener<ButtonStateCubit, ButtonState>(
            listener: (context, state) {
              if (state is ButtonFailureState){
                var snackbar = SnackBar(
                content: Center(child: Text(state.errorMessage)), // Center the text
                behavior: SnackBarBehavior.floating, // Set width to center
                );
                ScaffoldMessenger.of(context).showSnackBar(snackbar);
              } 
            },
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _signinText(context),
                const SizedBox(height: 20,),
                _passwordField(context),
                const SizedBox(height: 20,),
                _continueButton(context),
                const SizedBox(height: 20,),
                _forgotPassword(context),
              ],
            ),
          ),
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
    return TextField(
      controller: _passwordCon,
      decoration: const InputDecoration(
        hintText: 'Enter Password',
      ),
    );
  }

  // Continue button widget
  Widget _continueButton(BuildContext context) {
    return Builder(
      builder: (context) {
        return BasicReactiveButton(
          onPressed: (){
            signinReq.password = _passwordCon.text;
            context.read<ButtonStateCubit>().execute(
              usecase: SigninUseCase(),
              params: signinReq,
            );
          },
          title: 'Continue',
        );
      }
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
                AppNavigator.push(context, ForgotPasswordPage());
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