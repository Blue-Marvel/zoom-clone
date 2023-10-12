import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:zoom_clone/resources/auth_class.dart';
import 'package:zoom_clone/screens/home.dart';
import 'package:zoom_clone/screens/home_menu.dart';
import 'package:zoom_clone/utils/btn_loader.dart';
import 'package:zoom_clone/widgets/button.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    final deviceHeight = MediaQuery.of(context).size.height;
    final deviceWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: deviceWidth * 0.03),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Start or join a meeting",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: deviceHeight * 0.03,
                ),
              ),
              SizedBox(height: deviceHeight * 0.03),
              Image.asset('assets/images/onboarding.jpg'),
              SizedBox(height: deviceHeight * 0.03),
              CustomButton(
                  placeholder: isLoading == false
                      ? const Text("Google Sign In")
                      : const BtnLoader(),
                  onTap: () async {
                    setState(() {
                      isLoading = true;
                    });
                    final res = await AuthMethod.googleSignIn(context);
                    setState(() {
                      isLoading = false;
                    });
                    if (res) {
                      // ignore: use_build_context_synchronously
                      context.pushReplacement(HomeMenu.routeName);
                    }
                    print(res);
                  })
            ],
          ),
        ),
      ),
    );
  }
}
