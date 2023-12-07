import 'package:void_demo/screens/switch_user.dart';
import 'package:flutter/material.dart';
import 'package:void_demo/widgets/custom_textfield.dart';
import 'package:void_demo/widgets/validators.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  // bool _obscureText = true;
  // void _togglePassword() {
  //   setState(() {
  //     _obscureText = !_obscureText;
  //   });
  // }

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
    String username = "Jeolad";

    return Scaffold(
      extendBodyBehindAppBar: true,
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        leading: BackButton(
          color: Colors.white,
        ),
        forceMaterialTransparency: true,
      ),
      body: Column(
        children: <Widget>[
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.5,
            //child: BackButton(),
            child: Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(
                        "https://img.freepik.com/free-vector/purple-circle-pattern-background-vector_53876-77826.jpg?size=626&ext=jpg&ga=GA1.1.1919089670.1695660544&semt=sph"),
                    fit: BoxFit.cover,
                  ),
                ),
                child: Container(
                  child: Center(
                    child: Text(
                      "VOID",
                      style: TextStyle(
                        color: Colors.grey[600],
                        fontSize: 20.0,
                      ),
                    ),
                  ),
                )),
          ),
          SingleChildScrollView(
            child: Form(
              key: _formKey,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              child: Container(
                padding: EdgeInsets.all(15.0),
                child: Column(
                  children: <Widget>[
                    Container(
                      alignment: Alignment.topLeft,
                      child: Text(
                        "Welcome back, ${username}",
                        style: TextStyle(
                          fontSize: 20.0,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    CustomTextFormField(
                      label: "Password",
                      hintText: "Enter your password",
                      isPassword: true,
                      validator: passwordValidation,
                    ),
                    SizedBox(
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
                        child: Text(
                          "LOG IN",
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 50.0,
                    ),
                    Container(
                      alignment: Alignment.topCenter,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          GestureDetector(
                            onTap: () => Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Switch_user())),
                            child: Text(
                              "Switch account",
                              style: TextStyle(
                                color: Colors.deepPurple[400],
                              ),
                            ),
                          ),
                          Text(
                            "Forgot password?",
                            style: TextStyle(
                              color: Colors.deepPurple[400],
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    Container(
                      child: RichText(
                        text: TextSpan(
                            text: "Not ${username}?",
                            style: TextStyle(
                              color: Colors.black,
                            ),
                            children: <TextSpan>[
                              TextSpan(
                                text: " Sign up",
                                style: TextStyle(color: Colors.deepPurple[400]),
                              ),
                            ]),
                      ),
                    )
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
