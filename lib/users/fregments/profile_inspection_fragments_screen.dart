import 'package:cbcreports/users/authentication/login_screen.dart';
import 'package:cbcreports/users/userPreference/current_user.dart';
import 'package:cbcreports/users/userPreference/user_preferences.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfileFragmentsScreen extends StatelessWidget {
  final CurrentUser _currentUser = Get.put(CurrentUser());
  signOutUser() async {
    var resultResponce = await Get.dialog(
      AlertDialog(
        backgroundColor: Colors.grey,
        title: const Text(
          "Logout User",
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        content: const Text(
          "Are you sure?\nYou want to logout",
        ),
        actions: [
          TextButton(
            onPressed: () {
              Get.back();
            },
            child: Text(
              "No",
              style: TextStyle(color: Colors.black),
            ),
          ),
          TextButton(
            onPressed: () {
              Get.back(result: "loggedout");
            },
            child: Text(
              "Yes",
              style: TextStyle(color: Colors.black),
            ),
          ),
        ],
      ),
    );

    if (resultResponce == "loggedout") {
      // remove ta user data from local storage
      RememberUserPrefs.removeUserInfo().then((value) {
        Get.off(LoginScreen());
      });
    }
  }

  Widget userInfoItemProfile(IconData iconData, String userData) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Colors.grey,
      ),
      padding: const EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 8,
      ),
      child: Row(
        children: [
          Icon(
            iconData,
            size: 30,
            color: Colors.black,
          ),
          const SizedBox(
            width: 16,
          ),
          Text(
            userData,
            style: const TextStyle(
              fontSize: 15,
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.all(32),
      children: [
        Center(
          child: Image.asset(
            "images/man.png",
            width: 240,
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        userInfoItemProfile(Icons.person, _currentUser.user.name),
        const SizedBox(
          height: 20,
        ),
        userInfoItemProfile(Icons.email, _currentUser.user.email),
        const SizedBox(
          height: 20,
        ),
        Center(
          child: Material(
            color: Colors.redAccent,
            borderRadius: BorderRadius.circular(8),
            child: InkWell(
              onTap: () {
                signOutUser();
              },
              borderRadius: BorderRadius.circular(32),
              child: const Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 30,
                  vertical: 12,
                ),
                child: Text(
                  "Log Out",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
