import 'package:void_demo/widgets/custom_textfield.dart';
import 'package:void_demo/screens/switch_user.dart';
import 'package:flutter/material.dart';

import '../widgets/validators.dart';

class Signup extends StatefulWidget {
  const Signup({super.key});

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  //password visibility state management

  final email = TextEditingController();
  final password = TextEditingController();
  final confrimPassword = TextEditingController();

  //form validation
  final _formKey = GlobalKey<FormState>();
  final isLoading = false;

  void _submit() {
    final isValid = _formKey.currentState?.validate() ?? false;
    if (isValid) {
      _formKey.currentState?.save();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        leading: const BackButton(
          color: Colors.white,
        ),
        forceMaterialTransparency: true,
      ),
      body: Column(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.45,
            //child: BackButton(),
            child: Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(
                      "https://img.freepik.com/free-vector/purple-circle-pattern-background-vector_53876-77826.jpg?size=626&ext=jpg&ga=GA1.1.1919089670.1695660544&semt=sph"),
                  fit: BoxFit.cover,
                ),
              ),
              child: Center(
                child: Text(
                  "VOID",
                  style: TextStyle(
                    color: Colors.grey[600],
                    fontSize: 20.0,
                  ),
                ),
              ),
            ),
          ),
          SingleChildScrollView(
            child: Form(
              key: _formKey,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              child: Container(
                padding: const EdgeInsets.all(15.0),
                child: Column(
                  children: <Widget>[
                    Container(
                      alignment: Alignment.topLeft,
                      child: const Text(
                        "Welcome to VOID",
                        style: TextStyle(
                          fontSize: 20.0,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    const CustomTextFormField(
                      label: "Email",
                      hintText: "Enter your email address",
                      validator: emailValidation,
                    ),
                    const CustomTextFormField(
                      label: "Password",
                      hintText: "Enter your password",
                      isPassword: true,
                      validator: passwordValidation,
                    ),
                    const CustomTextFormField(
                      label: "Confirm Password",
                      hintText: "Enter your password again",
                      isPassword: true,
                      validator: passwordValidation,
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    SizedBox(
                      width: double.infinity,
                      height: 50.0,
                      child: ElevatedButton(
                        onPressed: _submit,
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5.0),
                          ),
                          backgroundColor: Colors.deepPurple[400],
                        ),
                        //style:,
                        child: const Text(
                          "CREATE ACCOUNT",
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 30.0,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text("Member of Void?"),
                        GestureDetector(
                          onTap: () => Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const SwitchUser())),
                          child: Text(
                            " Log in",
                            style: TextStyle(
                              color: Colors.deepPurple[400],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
