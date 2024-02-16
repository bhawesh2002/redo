import 'package:flutter/material.dart';
import 'package:redo/assets/colors/colors.dart';
import 'package:redo/screens/ac_page.dart';

Future<void> accountDialog(BuildContext context, String name) {
  return showDialog(
    context: context,
    builder: (BuildContext context) {
      return SimpleDialog(
        contentPadding: EdgeInsets.symmetric(
            vertical: MediaQuery.of(context).size.height * 0.02,
            horizontal: MediaQuery.of(context).size.width * 0.05),
        surfaceTintColor: Colors.white,
        children: [
          Column(
            children: [
              //Account Info Section
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  //Profile Pic
                  CircleAvatar(
                    radius: MediaQuery.of(context).size.width * 0.08,
                    backgroundColor: Colors.white,
                    child: Image.asset('lib/assets/images/avataaars.png'),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: MediaQuery.of(context).size.width * 0.01),
                  ),
                  //Name and "Access Account Settings" button
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      //Name section
                      Text(
                        name,
                        style: TextStyle(
                            fontSize: MediaQuery.of(context).size.width * 0.05,
                            fontWeight: FontWeight.bold),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                            vertical:
                                MediaQuery.of(context).size.height * 0.005),
                      ),
                      //"Access Account Settings" button
                      Material(
                        shape: RoundedRectangleBorder(
                          side: const BorderSide(
                              width: 2, color: AppColor.primaryColor),
                          borderRadius: BorderRadius.circular(
                              MediaQuery.of(context).size.width * 0.02),
                        ),
                        child: InkWell(
                          borderRadius: BorderRadius.circular(
                              MediaQuery.of(context).size.width * 0.02),
                          onTap: () {
                            Navigator.of(context).pop();
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => const AccountPage()));
                          },
                          splashColor: Colors.teal.shade100,
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                                vertical:
                                    MediaQuery.of(context).size.height * 0.005,
                                horizontal:
                                    MediaQuery.of(context).size.width * 0.05),
                            child: const Text(
                              "Access Account Settings",
                              style: TextStyle(fontWeight: FontWeight.w600),
                            ),
                          ),
                        ),
                      )
                    ],
                  )
                ],
              ),
              //Seperation Line
              Padding(
                padding: EdgeInsets.symmetric(
                  vertical: MediaQuery.of(context).size.height * 0.02,
                ),
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height * 0.001,
                  decoration: const BoxDecoration(color: Colors.grey),
                ),
              ),
              //Settings Button
              acDialogButton(
                context,
                onTap: () {
                  //TODO: Navigate to Settings Page
                },
                label: "Settings",
                icon: Icons.settings,
              ),
            ],
          ),
        ],
      );
    },
  );
}

Widget acDialogButton(
  BuildContext context, {
  required String label,
  required IconData icon,
  required VoidCallback onTap,
}) {
  return Material(
    color: Colors.teal.shade50,
    borderRadius:
        BorderRadius.circular(MediaQuery.of(context).size.width * 0.04),
    child: InkWell(
      splashColor: Colors.teal.shade100,
      onTap: onTap,
      borderRadius:
          BorderRadius.circular(MediaQuery.of(context).size.width * 0.04),
      child: Padding(
        padding: EdgeInsets.symmetric(
          vertical: MediaQuery.of(context).size.height * 0.02,
          horizontal: MediaQuery.of(context).size.width * 0.04,
        ),
        child: Row(
          children: [
            Icon(icon),
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: MediaQuery.of(context).size.width * 0.01),
            ),
            Text(
              label,
              style: const TextStyle(fontWeight: FontWeight.w600),
            ),
          ],
        ),
      ),
    ),
  );
}
