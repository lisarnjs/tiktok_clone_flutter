import 'package:flutter/material.dart';
import 'package:titok_clone/constants/sizes.dart';
import 'package:titok_clone/features/authentication/sign_up_screen.dart';
import 'package:titok_clone/features/main_navigation/main_navigation_screen.dart';
import 'package:titok_clone/features/onboarding/interests_screen.dart';
import 'package:titok_clone/features/videos/widgets/video_post.dart';

void main() {
  runApp(const TikTokApp());
}

class TikTokApp extends StatelessWidget {
  const TikTokApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TikTok Clone',
      theme: ThemeData(
          appBarTheme: const AppBarTheme(
              foregroundColor:
                  Colors.black, // appbartheme안에 있는 모든 글자가 default black으로 지정됨
              backgroundColor:
                  Colors.white, // appbartheme의 배경색이 Default white로 지정됨
              elevation: 0,
              titleTextStyle: TextStyle(
                color: Colors.black,
                fontSize: Sizes.size16 + Sizes.size2,
                fontWeight: FontWeight.w600,
              )),
          scaffoldBackgroundColor:
              Colors.white, // 이걸 쓰면 모든 scaffold background color가 white로 지정됨
          primaryColor: const Color(0xFFE9435A)),
      // home: const SignUpScreen(),
      home: const MainNavigationScreen(),
    );
  }
}
