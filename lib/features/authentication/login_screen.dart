import 'package:flutter/material.dart';
import 'package:titok_clone/constants/gaps.dart';
import 'package:titok_clone/constants/sizes.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  void onSignUpTap(BuildContext context) {
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: Sizes.size40),
          child: Column(
            children: [
              Gaps.v80,
              Text("Log in to TikTok",
                  style: TextStyle(
                    fontSize: Sizes.size24,
                    fontWeight: FontWeight.w700,
                  )),
              Gaps.v20,
              Text(
                "Manage your account, check notifications, comment on videos, and more.",
                style: TextStyle(
                  fontSize: Sizes.size16,
                  fontWeight: FontWeight.w400,
                  color: Colors.black45,
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.grey.shade100,
        elevation: 2,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: Sizes.size20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text("Don't have an account?"),
              Gaps.h5,
              GestureDetector(
                onTap: () => onSignUpTap(context),
                child: Text(
                  'Sign up',
                  style: TextStyle(
                      fontWeight: FontWeight.w600,
                      color: Theme.of(context).primaryColor),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
