import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:university_chat_app/core/authentication/login/sign_up_form.dart';
import 'package:university_chat_app/provider/providers.dart';
import 'package:university_chat_app/widgets/google_signin_button.dart';
import 'package:university_chat_app/widgets/line_between_text.dart';
import 'package:university_chat_app/widgets/responsive.dart';
import 'package:university_chat_app/widgets/signin_widgets.dart';

class LoginForm extends ConsumerStatefulWidget {
  const LoginForm({Key? key}) : super(key: key);

  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends ConsumerState<LoginForm> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _isPasswordVisible = false;
  bool _isLoading = false;
  final String rootImage = 'assets/images';

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    bool _isDarkTheme = Theme.of(context).brightness == Brightness.dark;
    bool _isDesktop = Responsive.isDesktop(context);
    Size querySize = MediaQuery.of(context).size;

    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: _isDesktop ? querySize.width * 0.2 : querySize.width * 0.05,
      ),
      child: Form(
        key: _formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: 10),
            // Text(
            //   'IMAGINE A UNIVERSITY...',
            //   style: GoogleFonts.balsamiqSans(
            //     textStyle: const TextStyle(
            //       fontSize: 25,
            //       fontWeight: FontWeight.bold,
            //     ),
            //   ),
            // ),
            SizedBox(
              height: 30,
              child: DefaultTextStyle(
                style: GoogleFonts.lilitaOne(
                  textStyle: const TextStyle(fontSize: 30),
                  color: Colors.blue,
                  shadows: [
                    const Shadow(color: Colors.blueAccent, blurRadius: 2)
                  ],
                ),
                child: AnimatedTextKit(
                  repeatForever: true,
                  animatedTexts: [
                    FlickerAnimatedText('IMAGINE'),
                    FlickerAnimatedText('A'),
                    FlickerAnimatedText('UNIVERSITY'),
                    FlickerAnimatedText(
                      'IMAGINE A UNIVERSITY',
                      speed: const Duration(seconds: 5),
                    ),
                  ],
                  onTap: () {
                    print("Tap Event");
                  },
                ),
              ),
            ),
            Image.asset(
              _isDarkTheme ? '$rootImage/dark.jpg' : '$rootImage/light.jpg',
              scale: querySize.aspectRatio,
            ),
            const Text(
              'Log In',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 15),
            TextForm(
              labelText: 'Email',
              controller: _emailController,
              prefixIcon: Icons.email,
              autofillHints: const [AutofillHints.email],
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Enter your email address';
                }
                if (!EmailValidator.validate(value)) {
                  return 'Invalid email address';
                }
              },
              keyboardType: TextInputType.emailAddress,
            ),
            const SizedBox(height: 10),
            TextForm(
              labelText: 'Password',
              prefixIcon: Icons.password,
              suffixIcon: IconButton(
                icon: Icon(
                  _isPasswordVisible ? Icons.visibility : Icons.visibility_off,
                ),
                onPressed: () {
                  setState(
                    () => _isPasswordVisible = !_isPasswordVisible,
                  );
                },
              ),
              controller: _passwordController,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Enter your password';
                }
              },
              keyboardType: TextInputType.visiblePassword,
              obscureText: !_isPasswordVisible,
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const SignupButton(),
                LoginButton(
                  isLoading: _isLoading,
                  onPressed: () {
                    if (_formKey.currentState?.validate() == true) {
                      setState(() => _isLoading = true);
                      ref
                          .watch(authUserNotifierProvider.notifier)
                          .signInWithEmailAndPassword(
                            context: context,
                            email: _emailController.text,
                            password: _passwordController.text,
                          )
                          .then(
                        (_) {
                          setState(() => _isLoading = false);
                        },
                      );
                    }
                  },
                ),
              ],
            ),
            const SizedBox(height: 10),
            const LineBetweenText(text: 'OR'),
            GoogleSignInButton(
              onPressed: () {
                ref
                    .watch(authUserNotifierProvider.notifier)
                    .signInWithGoogle(context)
                    .then((value) => null);
              },
            ),
          ],
        ),
      ),
    );
  }
}

class LoginButton extends StatelessWidget {
  const LoginButton({
    Key? key,
    required this.onPressed,
    required this.isLoading,
  }) : super(key: key);

  final bool isLoading;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: isLoading ? null : onPressed,
      child: const Text('Log In'),
    );
  }
}

class SignupButton extends StatelessWidget {
  const SignupButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: () {
        showBottomSheet(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
            side: const BorderSide(
              // color: Theme.of(context).primaryColorDark,
              width: 0.2,
            ),
          ),
          context: context,
          builder: (context) => const SingleChildScrollView(
            child: SignUpForm(),
          ),
        );
      },
      child: const Text('Sign Up'),
    );
  }
}



            // width: size.width * 0.7,
            // height: size.height * 0.9,