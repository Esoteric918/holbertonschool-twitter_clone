import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../widgets/entry_field.dart';
import '../widgets/flat_button.dart';
import '../providers/auth_state.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _SignUpState();
  }
}

class _SignUpState extends State<SignUp> {
  late final TextEditingController _emailController;
  late final TextEditingController _passwordController;
  late final TextEditingController _usernameController;
  late final TextEditingController _nameController;
  late final TextEditingController _confirmController;

  @override
  initState() {
    super.initState();
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
    _usernameController = TextEditingController();
    _nameController = TextEditingController();
    _confirmController = TextEditingController();
  }

  @override
  dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _usernameController.dispose();
    _nameController.dispose();
    _confirmController.dispose();
    super.dispose();
  }

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sign Up'),
        backgroundColor: Colors.lightBlue,
        elevation: 0,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Consumer<AuthState>(
          builder: ((context, state, child) {
            return Container(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      const SizedBox(height: 20),
                      const Text(
                        'Sign Up',
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
                        hint: 'Username',
                        controller: _usernameController,
                      ),
                      CustomEntryField(
                        hint: 'Name',
                        controller: _nameController,
                      ),
                      CustomEntryField(
                        hint: 'Password',
                        isPassword: true,
                        controller: _passwordController,
                      ),
                      CustomEntryField(
                        hint: 'Confirm Password',
                        isPassword: true,
                        controller: _confirmController,
                      ),
                      const SizedBox(height: 20),
                      CustomFlatButton(
                          label: 'Sign Up',
                          onPressed: () {
                            state.attemptSignUp(
                                context,
                                _nameController.text,
                                _usernameController.text,
                                _emailController.text,
                                _passwordController.text,
                                _confirmController.text);
                          }),
                      const SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text('Already have an account?'),
                          TextButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: const Text(
                              'Sign In',
                              style: TextStyle(
                                color: Colors.blue,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ));
          }),
        ),
      ),
    );
  }
}
