import 'package:flutter/material.dart';
import 'package:titok_clone/constants/gaps.dart';
import 'package:titok_clone/constants/sizes.dart';
import 'package:titok_clone/features/authentication/password_screen.dart';
// import 'package:titok_clone/features/authentication/email_screen.dart';
import 'package:titok_clone/features/authentication/widgets/form_button.dart';

class EmailScreen extends StatefulWidget {
  const EmailScreen({super.key});

  @override
  State<EmailScreen> createState() => _EmailScreenState();
}

class _EmailScreenState extends State<EmailScreen> {
  final TextEditingController _emailController = TextEditingController();

  String _email = "";

  @override
  void initState() {
    super.initState(); // 시작은 super.initState()

    _emailController.addListener(() {
      setState(() {
        _email = _emailController.text;
      });
    });
  }

  @override
  void dispose() {
    // 컨트롤러 dispose(제거)
    // 제거하는 이유는 위에서 이벤트 리스너를 추가하기 때문
    // 위젯이 사라질 때 이 컨트롤러를 우리의 메모리에서 지우고 싶다 -> 수동 조작 필요
    // dispose(제거)하는 것을 잊어버려도 괜찮음 -> 걀극 메모리가 부족해서 앱이 crash날거기 때문에 알수 밖에 없음
    _emailController.dispose();
    super.dispose(); // 모든 것의 뒤에 super.dispose()를 선언하는 것이 가장 좋다
  }

  String? _isEmailValid() {
    if (_email.isEmpty) return null;
    final regExp = RegExp(
        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
    if (!regExp.hasMatch(_email)) {
      return "Email not valid";
    }
    return null;
  }

  void _onScaffoldTap() {
    FocusScope.of(context).unfocus();
  }

  void _onSubmit() {
    if (_email.isEmpty || _isEmailValid() != null) return;
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const PasswordScreen(),
      ),
    );
  }

  void _onNextTop() {
    if (_email.isEmpty) return;
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
                "What is your email?",
                style: TextStyle(
                  fontSize: Sizes.size24,
                  fontWeight: FontWeight.w700,
                ),
              ),
              Gaps.v16,
              TextField(
                controller: _emailController,
                autocorrect: false,
                keyboardType: TextInputType.emailAddress,
                onEditingComplete: _onSubmit,
                decoration: InputDecoration(
                  hintText: "Email",
                  errorText: _isEmailValid(),
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
              Gaps.v16,
              GestureDetector(
                onTap: _onSubmit,
                child: FormButton(
                    disabled: _email.isEmpty || _isEmailValid() != null),
              )
            ],
          ),
        ),
      ),
    );
  }
}
