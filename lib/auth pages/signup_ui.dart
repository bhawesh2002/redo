import 'package:flutter/material.dart';
import 'package:redo/assets/colors/colors.dart';
import 'package:redo/auth%20pages/auth_form.dart';
import 'package:redo/auth%20pages/login_ui.dart';
import 'package:redo/widgets/redologo.dart';

class SignupPage extends StatelessWidget {
  const SignupPage({super.key});
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(
                    vertical: height * 0.05,
                  ),
                  child: redoLogo(context, 0.3),
                ),
                const AuthForm(
                  authMode: AuthMode.signup,
                ),
                Padding(padding: EdgeInsets.all(height * 0.01)),
                actionButton(context, "Continue"),
                Padding(padding: EdgeInsets.all(height * 0.02)),
                seperation("OR"),
                Padding(padding: EdgeInsets.all(height * 0.02)),
                const Text(
                  "SignUp Using",
                  style: TextStyle(fontSize: 12),
                ),
                Padding(padding: EdgeInsets.all(height * 0.01)),
                authAlternatives(
                  context,
                  "Google",
                  imgPath: "lib/assets/images/google-color-icon.svg",
                ),
                Padding(padding: EdgeInsets.all(height * 0.02)),
                const Text(
                  "Acount Exists?",
                  style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const LoginPage()));
                  },
                  child: Container(
                    color: Colors.transparent,
                    width: MediaQuery.of(context).size.width * 0.3,
                    height: MediaQuery.of(context).size.height * 0.05,
                    child: const Center(
                      child: Text(
                        "LogIn",
                        style: TextStyle(
                            color: AppColor.primaryColor,
                            fontSize: 15,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
