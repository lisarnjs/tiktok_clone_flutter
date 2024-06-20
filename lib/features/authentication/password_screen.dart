import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:titok_clone/constants/gaps.dart';
import 'package:titok_clone/constants/sizes.dart';
import 'package:titok_clone/features/authentication/birthday_screen.dart';
import 'package:titok_clone/features/authentication/password_screen.dart';
// import 'package:titok_clone/features/authentication/password_screen.dart';
import 'package:titok_clone/features/authentication/widgets/form_button.dart';

class PasswordScreen extends StatefulWidget {
  const PasswordScreen({super.key});

  @override
  State<PasswordScreen> createState() => _PasswordScreenState();
}

class _PasswordScreenState extends State<PasswordScreen> {
  final TextEditingController _passwordController = TextEditingController();

  String _password = "";

  bool _obscureText = true;

  @override
  void initState() {
    super.initState(); // 시작은 super.initState()

    _passwordController.addListener(() {
      setState(() {
        _password = _passwordController.text;
      });
    });
  }

  @override
  void dispose() {
    // 컨트롤러 dispose(제거)
    // 제거하는 이유는 위에서 이벤트 리스너를 추가하기 때문
    // 위젯이 사라질 때 이 컨트롤러를 우리의 메모리에서 지우고 싶다 -> 수동 조작 필요
    // dispose(제거)하는 것을 잊어버려도 괜찮음 -> 걀극 메모리가 부족해서 앱이 crash날거기 때문에 알수 밖에 없음
    _passwordController.dispose();
    super.dispose(); // 모든 것의 뒤에 super.dispose()를 선언하는 것이 가장 좋다
  }

  bool _isPasswordValid() {
    return _password.isNotEmpty && _password.length > 8;
  }

  void _onScaffoldTap() {
    FocusScope.of(context).unfocus();
  }

  void _onSubmit() {
    if (!_isPasswordValid()) return;
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const BirthdayScreen(),
      ),
    );
  }

  void _onNextTop() {
    if (_password.isEmpty) return;
  }

  void _onClearTap() {
    _passwordController.clear();
  }

  void _toggleObscureText() {
    _obscureText = !_obscureText; // 변수 값 변경 후
    setState(() {}); // 빈 setState 호출 -> setState를 호출하면 다시 빌드하니까
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _onScaffoldTap,
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          foregroundColor: Colors.black, // 화면의 모든 글자를 검은색으로
          backgroundColor: Colors.white,
          elevation: 0,
          title: const Text(
            'Sign up',
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: Sizes.size36,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Gaps.v40,
              const Text(
                "Password",
                style: TextStyle(
                  fontSize: Sizes.size24,
                  fontWeight: FontWeight.w700,
                ),
              ),
              Gaps.v16,
              TextField(
                controller: _passwordController,
                obscureText: _obscureText, // 비밀번호처럼 숨김처리 여부
                autocorrect: false, // 자동완성 기능 킬건지 여부
                onEditingComplete: _onSubmit,
                decoration: InputDecoration(
                  suffix: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      GestureDetector(
                        onTap: _onClearTap,
                        child: FaIcon(
                          FontAwesomeIcons.solidCircleXmark,
                          color: Colors.grey.shade400,
                          size: Sizes.size20,
                        ),
                      ),
                      Gaps.h10,
                      GestureDetector(
                        onTap: _toggleObscureText,
                        child: FaIcon(
                          _obscureText
                              ? FontAwesomeIcons.eye
                              : FontAwesomeIcons.eyeSlash,
                          color: Colors.grey.shade400,
                          size: Sizes.size20,
                        ),
                      ),
                    ],
                  ),
                  hintText: "Make it strong!",
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.grey.shade400,
                    ),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.grey.shade300,
                    ),
                  ),
                ),
                cursorColor: Theme.of(context).primaryColor,
              ),
              Gaps.v10,
              Row(
                children: [
                  FaIcon(
                    FontAwesomeIcons.circleCheck,
                    size: Sizes.size20,
                    color: _isPasswordValid()
                        ? Colors.green
                        : Colors.grey.shade400,
                  ),
                  Gaps.h5,
                  const Text('8 to 20 characters'),
                ],
              ),
              Gaps.v28,
              GestureDetector(
                onTap: _onSubmit,
                child: FormButton(
                  disabled: !_isPasswordValid(),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
