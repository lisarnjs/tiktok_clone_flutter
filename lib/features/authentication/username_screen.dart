import 'package:flutter/material.dart';
import 'package:titok_clone/constants/gaps.dart';
import 'package:titok_clone/constants/sizes.dart';
import 'package:titok_clone/features/authentication/email_screen.dart';
import 'package:titok_clone/features/authentication/widgets/form_button.dart';

class UsernameScreen extends StatefulWidget {
  const UsernameScreen({super.key});

  @override
  State<UsernameScreen> createState() => _UsernameScreenState();
}

class _UsernameScreenState extends State<UsernameScreen> {
  final TextEditingController _usernameController = TextEditingController();

  String _username = "";

  @override
  void initState() {
    super.initState(); // 시작은 super.initState()

    _usernameController.addListener(() {
      setState(() {
        _username = _usernameController.text;
      });
    });
  }

  @override
  void dispose() {
    // 컨트롤러 dispose(제거)
    // 제거하는 이유는 위에서 이벤트 리스너를 추가하기 때문
    // 위젯이 사라질 때 이 컨트롤러를 우리의 메모리에서 지우고 싶다 -> 수동 조작 필요
    // dispose(제거)하는 것을 잊어버려도 괜찮음 -> 걀극 메모리가 부족해서 앱이 crash날거기 때문에 알수 밖에 없음
    _usernameController.dispose();
    super.dispose(); // 모든 것의 뒤에 super.dispose()를 선언하는 것이 가장 좋다
  }

  void _onNextTop() {
    if (_username.isEmpty) return;
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => const EmailScreen(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
              "Create username",
              style: TextStyle(
                fontSize: Sizes.size24,
                fontWeight: FontWeight.w700,
              ),
            ),
            Gaps.v10,
            const Text(
              "You can always change this later.",
              style: TextStyle(
                fontSize: Sizes.size16,
                fontWeight: FontWeight.w600,
                color: Colors.black54,
              ),
            ),
            Gaps.v16,
            TextField(
              controller: _usernameController,
              decoration: InputDecoration(
                hintText: "Username",
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
              onTap: _onNextTop,
              child: FormButton(disabled: _username.isEmpty),
            )
          ],
        ),
      ),
    );
  }
}
