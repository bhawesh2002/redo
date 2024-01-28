import 'package:flutter/material.dart';
import 'package:redo/assets/colors/colors.dart';

enum AuthMode { login, signup }

class AuthForm extends StatefulWidget {
  final AuthMode authMode;
  const AuthForm({super.key, required this.authMode});
  @override
  State<AuthForm> createState() => _AuthFormState();
}

class _AuthFormState extends State<AuthForm> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  void initState() {
    super.initState();
    emailController = TextEditingController();
    passwordController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Form(
      key: _formKey,
      child: Padding(
        padding: EdgeInsets.all(height * 0.02),
        child: Column(
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                widget.authMode == AuthMode.login ? 'Log In' : 'Sign Up',
                style:
                    const TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              ),
            ),
            Padding(padding: EdgeInsets.all(height * 0.01)),
            TextFormField(
              controller: emailController,
              autofocus: false,
              cursorColor: AppColor.primaryColor,
              decoration: InputDecoration(
                labelText: "Enter Your Email",
                contentPadding: const EdgeInsets.all(15),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide:
                      const BorderSide(width: 2, color: AppColor.primaryColor),
                ),
                enabledBorder: const OutlineInputBorder(),
              ),
              keyboardType: TextInputType.emailAddress,
            ),
            Padding(padding: EdgeInsets.all(height * 0.01)),
            widget.authMode == AuthMode.login
                ? TextFormField(
                    controller: passwordController,
                    autofocus: false,
                    obscureText: true,
                    cursorColor: AppColor.primaryColor,
                    decoration: InputDecoration(
                      labelText: "Enter Your Password",
                      contentPadding: const EdgeInsets.all(15),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: const BorderSide(
                              width: 2, color: AppColor.primaryColor)),
                      enabledBorder: const OutlineInputBorder(),
                    ),
                    keyboardType: TextInputType.emailAddress,
                  )
                : TextFormField(
                    controller: passwordController,
                    autofocus: false,
                    obscureText: true,
                    cursorColor: AppColor.primaryColor,
                    decoration: InputDecoration(
                      labelText: "Enter Your Username",
                      contentPadding: const EdgeInsets.all(15),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: const BorderSide(
                              width: 2, color: AppColor.primaryColor)),
                      enabledBorder: const OutlineInputBorder(),
                    ),
                    keyboardType: TextInputType.emailAddress,
                  ),
            Padding(padding: EdgeInsets.all(height * 0.005)),
            widget.authMode == AuthMode.login
                ? Align(
                    alignment: Alignment.centerRight,
                    child: GestureDetector(
                      onTap: () {
                        debugPrint("Proceed to reset Password");
                      },
                      child: const Text(
                        "Forgot Password?",
                      ),
                    ),
                  )
                : const Align(
                    alignment: Alignment.centerRight,
                    child: Text(
                      "Username Check",
                    ),
                  ),
          ],
        ),
      ),
    );
  }
}
