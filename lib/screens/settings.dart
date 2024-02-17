import 'package:flutter/material.dart';
import 'package:redo/assets/colors/colors.dart';
import 'package:redo/screens/ac_page.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Settings"),
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(
            vertical: MediaQuery.of(context).size.height * 0.01,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //Appearence
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: MediaQuery.of(context).size.width * 0.05,
                  vertical: MediaQuery.of(context).size.height * 0.01,
                ),
                child: const Text(
                  "Appearence",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              //Appearence: Theme
              ListTile(
                onTap: () {
                  //TODO: Implement theme change from light to darka dn vice versa
                },
                contentPadding: EdgeInsets.symmetric(
                  horizontal: MediaQuery.of(context).size.width * 0.05,
                ),
                leading: const Icon(
                  Icons.light_mode_rounded,
                  color: AppColor.primaryColor,
                ),
                title: const Text(
                  "Theme",
                  style: TextStyle(fontWeight: FontWeight.w500),
                ),
                trailing: const Text("Light"),
              ),
              //Appearence: Color Scheme
              ListTile(
                onTap: () {
                  //TODO: Implement ability to chnage theme from list of available themes
                },
                contentPadding: EdgeInsets.symmetric(
                  horizontal: MediaQuery.of(context).size.width * 0.05,
                ),
                leading: const Icon(
                  Icons.format_paint_rounded,
                  color: AppColor.primaryColor,
                ),
                title: const Text(
                  "Color Scheme",
                  style: TextStyle(fontWeight: FontWeight.w500),
                ),
                trailing: const Text("Default"),
              ),
              //Appearence:Change Font
              ListTile(
                onTap: () {
                  //TODO: Implement the ability to chnange font
                },
                contentPadding: EdgeInsets.symmetric(
                  horizontal: MediaQuery.of(context).size.width * 0.05,
                ),
                leading: const Icon(
                  Icons.format_color_text,
                  color: AppColor.primaryColor,
                ),
                title: const Text(
                  "Chnage Font",
                  style: TextStyle(fontWeight: FontWeight.w500),
                ),
                trailing: const Text("Roboto"),
              ),
              //General Settings
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: MediaQuery.of(context).size.width * 0.05,
                  vertical: MediaQuery.of(context).size.height * 0.01,
                ),
                child: const Text(
                  "General Settings",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              //General Settings: Language
              ListTile(
                onTap: () {
                  //TODO: Implement language change functionality
                },
                contentPadding: EdgeInsets.symmetric(
                  horizontal: MediaQuery.of(context).size.width * 0.05,
                ),
                leading: const Icon(
                  Icons.language_rounded,
                  color: AppColor.primaryColor,
                ),
                title: const Text(
                  "Language",
                  style: TextStyle(fontWeight: FontWeight.w500),
                ),
                trailing: const Text("English"),
              ),
              //General Settings: Accessibility
              ListTile(
                onTap: () {
                  //TODO: Navigate to Accessibility Settings Page
                },
                contentPadding: EdgeInsets.symmetric(
                  horizontal: MediaQuery.of(context).size.width * 0.05,
                ),
                leading: const Icon(
                  Icons.accessibility_new_rounded,
                  color: AppColor.primaryColor,
                ),
                title: const Text(
                  "Accessibility",
                  style: TextStyle(fontWeight: FontWeight.w500),
                ),
              ),

              //Account and Security
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: MediaQuery.of(context).size.width * 0.05,
                  vertical: MediaQuery.of(context).size.height * 0.01,
                ),
                child: const Text(
                  "Account and Security",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              //Account and Security : Manage Account
              ListTile(
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const AccountPage(),
                    ),
                  );
                },
                contentPadding: EdgeInsets.symmetric(
                  horizontal: MediaQuery.of(context).size.width * 0.05,
                ),
                leading: const Icon(
                  Icons.account_circle_rounded,
                  color: AppColor.primaryColor,
                ),
                title: const Text(
                  "Manage Account",
                  style: TextStyle(fontWeight: FontWeight.w500),
                ),
              ),
              //Account and Security: App Lock
              ListTile(
                onTap: () {
                  //Implement functionality to lock the app
                },
                contentPadding: EdgeInsets.symmetric(
                  horizontal: MediaQuery.of(context).size.width * 0.05,
                ),
                leading: const Icon(
                  Icons.lock_outline_rounded,
                  color: AppColor.primaryColor,
                ),
                title: const Text(
                  "App Lock",
                  style: TextStyle(fontWeight: FontWeight.w500),
                ),
              ),
              //More
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: MediaQuery.of(context).size.width * 0.05,
                  vertical: MediaQuery.of(context).size.height * 0.01,
                ),
                child: const Text(
                  "More",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              //More: About
              ListTile(
                onTap: () {
                  //TODO: Create apps About Page
                },
                contentPadding: EdgeInsets.symmetric(
                  horizontal: MediaQuery.of(context).size.width * 0.05,
                ),
                leading: const Icon(
                  Icons.info_outline_rounded,
                  color: AppColor.primaryColor,
                ),
                title: const Text(
                  "About",
                  style: TextStyle(fontWeight: FontWeight.w500),
                ),
              ),
              //More: Help
              ListTile(
                onTap: () {
                  //TODO: Create apps Help Page
                },
                contentPadding: EdgeInsets.symmetric(
                  horizontal: MediaQuery.of(context).size.width * 0.05,
                ),
                leading: const Icon(
                  Icons.help,
                  color: AppColor.primaryColor,
                ),
                title: const Text(
                  "Help",
                  style: TextStyle(fontWeight: FontWeight.w500),
                ),
              ),
              //More: Feedback
              ListTile(
                onTap: () {
                  //TODO: Create a feedback form
                },
                contentPadding: EdgeInsets.symmetric(
                  horizontal: MediaQuery.of(context).size.width * 0.05,
                ),
                leading: const Icon(
                  Icons.feedback_outlined,
                  color: AppColor.primaryColor,
                ),
                title: const Text(
                  "Feedback",
                  style: TextStyle(fontWeight: FontWeight.w500),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
