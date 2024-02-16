import 'package:flutter/material.dart';
import 'package:redo/assets/colors/colors.dart';

class AccountPage extends StatefulWidget {
  const AccountPage({super.key});

  @override
  State<AccountPage> createState() => _TestPageState();
}

class _TestPageState extends State<AccountPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Account"),
        actions: [
          IconButton(
              onPressed: () {
                //TODO: Implement Edit functionality
              },
              icon: const Icon(Icons.mode_edit_outline_rounded)),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(
          vertical: MediaQuery.of(context).size.height * 0.01,
          horizontal: MediaQuery.of(context).size.width * 0.05,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //Profile picture
            Center(
              child: CircleAvatar(
                radius: MediaQuery.of(context).size.width * 0.25,
                child: Image.asset(
                  'lib/assets/images/avataaars.png',
                ),
              ),
            ),
            SizedBox(
              width: double.infinity,
              height: MediaQuery.of(context).size.height * 0.04,
            ),
            //Username
            infoTile(
              context,
              label: "Username",
              data: "aditya.singh65",
              icon: Icons.verified_user,
            ),
            SizedBox(
              width: double.infinity,
              height: MediaQuery.of(context).size.height * 0.03,
            ),
            //Name
            infoTile(
              context,
              label: "Name",
              data: "Aditya Singh",
              icon: Icons.person,
            ),
            SizedBox(
              width: double.infinity,
              height: MediaQuery.of(context).size.height * 0.03,
            ),
            //Email Id
            infoTile(
              context,
              label: "Email",
              data: "adityasingh65@redo.com",
              icon: Icons.email,
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                  vertical: MediaQuery.of(context).size.height * 0.04),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.grey,
                  border: Border.all(
                    width: 1,
                    color: Colors.grey,
                  ),
                ),
              ),
            ),
            //Change Password Button
            actionButtons(context, onTap: () {
              //TODO: Implement Change Password Functionality
            }, actionLabel: "Chnage Password", icon: Icons.key),
            SizedBox(
              width: double.infinity,
              height: MediaQuery.of(context).size.height * 0.02,
            ),
            //Backup Data to cloud
            actionButtons(context, onTap: () {
              //TODO: Implement data backup Functionality
            }, actionLabel: "Backup Your Data", icon: Icons.cloud_upload),
            SizedBox(
              width: double.infinity,
              height: MediaQuery.of(context).size.height * 0.02,
            ),
            //Delete Tour Account
            actionButtons(
              context,
              onTap: () {
                //TODO: Implement account deletion Functionality
              },
              actionLabel: "Delete Your Account",
              icon: Icons.delete_forever,
              buttonColor: Colors.white,
              splashColor: Colors.red.shade100,
              labelColor: Colors.redAccent,
              iconColor: Colors.redAccent,
            ),
          ],
        ),
      ),
    );
  }
}

Widget infoTile(BuildContext context,
    {required String label, required String data, required IconData icon}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        label,
        style: const TextStyle(fontWeight: FontWeight.bold),
      ),
      Padding(
        padding: EdgeInsets.symmetric(
            vertical: MediaQuery.of(context).size.width * 0.005),
      ),
      Row(
        children: [
          Icon(
            icon,
            color: AppColor.primaryColor,
          ),
          Padding(
            padding: EdgeInsets.symmetric(
                horizontal: MediaQuery.of(context).size.width * 0.01),
          ),
          Text(
            data,
            style: TextStyle(
                fontSize: MediaQuery.of(context).size.width * 0.04,
                fontWeight: FontWeight.w500),
          ),
        ],
      ),
    ],
  );
}

Widget actionButtons(
  BuildContext context, {
  required String actionLabel,
  required IconData icon,
  required VoidCallback onTap,
  Color? buttonColor,
  Color? splashColor,
  Color? labelColor,
  Color? iconColor,
}) {
  return Material(
    color: buttonColor ?? Colors.teal.shade50,
    borderRadius:
        BorderRadius.circular(MediaQuery.of(context).size.width * 0.04),
    child: InkWell(
      onTap: onTap,
      splashColor: splashColor ?? Colors.teal.shade100,
      borderRadius:
          BorderRadius.circular(MediaQuery.of(context).size.width * 0.04),
      child: Padding(
        padding: EdgeInsets.symmetric(
            vertical: MediaQuery.of(context).size.height * 0.02,
            horizontal: MediaQuery.of(context).size.width * 0.05),
        child: Row(
          children: [
            Icon(
              icon,
              color: iconColor ?? AppColor.primaryColor,
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: MediaQuery.of(context).size.width * 0.02),
            ),
            Text(
              actionLabel,
              style: TextStyle(
                fontSize: MediaQuery.of(context).size.width * 0.04,
                fontWeight: FontWeight.bold,
                color: labelColor ?? Colors.black,
              ),
            ),
          ],
        ),
      ),
    ),
  );
}
