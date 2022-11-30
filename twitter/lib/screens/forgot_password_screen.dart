import 'package:flutter/material.dart';
import '../widgets/entry_field.dart';
import '../widgets/flat_button.dart';

class ForgetPassword extends StatefulWidget {
  const ForgetPassword({Key? key}) : super(key: key);

  @override
  State<ForgetPassword> createState() => _ForgetPasswordState();
}

class _ForgetPasswordState extends State<ForgetPassword> {
  late final TextEditingController _emailController;
  final _formKey = GlobalKey<FormState>();

  @override
  initState() {
    super.initState();
    _emailController = TextEditingController();
  }

  @override
  dispose() {
    _emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(
          onPressed: () {
            Navigator.pop(context);
          },
          color: Theme.of(context).primaryColor,
        ),
        title: const Text(
          'Forget Password ?',
          style: TextStyle(
            color: Colors.black,
          ),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              const SizedBox(height: 20),
              const Text(
                'Forget Password ?',
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 20),
              Container(
                  padding: const EdgeInsets.fromLTRB(45, 0, 45, 0),
                  margin: const EdgeInsets.fromLTRB(0, 0, 0, 20),
                  child: const Text(
                    'Enter your email address and we will send you a link to reset your password',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                  )),
              const SizedBox(height: 20),
              CustomEntryField(
                hint: 'Enter Email',
                controller: _emailController,
              ),
              const SizedBox(height: 20),
              CustomFlatButton(
                label: 'Submit',
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Processing Data'),
                      ),
                    );
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
