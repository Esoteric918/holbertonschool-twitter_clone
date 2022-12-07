import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
// import 'package:twitter/screens/home_screen.dart';
import 'package:twitter/screens/signup_screen.dart';
import 'package:twitter/screens/forgot_password_screen.dart';
import '../widgets/entry_field.dart';
import '../widgets/flat_button.dart';
import 'package:twitter/providers/auth_state.dart';

class SignIn extends StatefulWidget {
  const SignIn({Key? key}) : super(key: key);
  @override
  State<SignIn> createState() {
    return _SignInState();
  }
}

class _SignInState extends State<SignIn> {
  late TextEditingController _emailController;
  late TextEditingController _passwordController;

  @override
  initState() {
    super.initState();
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
  }

  @override
  dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) => Consumer<AuthState>(
        builder: (context, state, child) {
          if (state.authState.currentUser != null) {
            state.getCurrentUserModel();
          }
          return Scaffold(
              appBar: AppBar(
                title: const Text('Spitter'),
                elevation: 0,
                centerTitle: true,
              ),
              body: Center(
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        const SizedBox(height: 20),
                        const Text(
                          'Sign In',
                          style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 20),
                        CustomEntryField(
                          hint: 'Email',
                          controller: _emailController,
                        ),
                        CustomEntryField(
                          hint: 'Password',
                          controller: _passwordController,
                          isPassword: true,
                        ),
                        const SizedBox(height: 20),
                        CustomFlatButton(
                          label: 'Submit',
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              state.attemptLogin(
                                context,
                                _emailController,
                                _passwordController,
                              );
                            }
                          },
                        ),
                        const SizedBox(height: 20),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const SignUp(),
                              ),
                            );
                          },
                          child: const Text(
                            'Sign Up',
                            style: TextStyle(
                              color: Colors.amber,
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        const SizedBox(height: 20),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const ForgetPassword(),
                                ));
                          },
                          child: const Text(
                            'Forgot Password?',
                            style: TextStyle(
                              color: Colors.blue,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ));
        },
      );
}
