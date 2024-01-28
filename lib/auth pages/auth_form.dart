import 'package:flutter/material.dart';
import 'package:redo/assets/colors/colors.dart';

class AuthForm extends StatefulWidget {
  const AuthForm({super.key});
  @override
  State<AuthForm> createState() => _AuthFormState();
}

class _AuthFormState extends State<AuthForm> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Form(
      key: _formKey,
      child: Padding(
        padding: EdgeInsets.all(height * 0.02),
        child: Column(
          children: [
            const Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Login",
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
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
            TextFormField(
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
            ),
            Padding(padding: EdgeInsets.all(height * 0.005)),
            Align(
              alignment: Alignment.centerRight,
              child: GestureDetector(
                onTap: () {
                  debugPrint("Proceed to reset Password");
                },
                child: const Text(
                  "Forgot Password?",
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
