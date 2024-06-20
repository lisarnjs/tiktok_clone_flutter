import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:titok_clone/constants/gaps.dart';
import 'package:titok_clone/constants/sizes.dart';
import 'package:titok_clone/features/authentication/email_screen.dart';
import 'package:titok_clone/features/authentication/widgets/form_button.dart';
import 'package:titok_clone/features/onboarding/interests_screen.dart';

class BirthdayScreen extends StatefulWidget {
  const BirthdayScreen({super.key});

  @override
  State<BirthdayScreen> createState() => _BirthdayScreenState();
}

class _BirthdayScreenState extends State<BirthdayScreen> {
  final TextEditingController _birthdayController = TextEditingController();

  // DateTime initialDate = DateTime.now();
  late DateTime initialDate;

  @override
  void initState() {
    super.initState(); // 시작은 super.initState()

    DateTime now = DateTime.now();
    initialDate = DateTime(now.year - 12);

    _setTextFieldDate(initialDate);

    // _birthdayController.addListener(() {
    //   setState(() {
    //     _username = _birthdayController.text;
    //   });
    // });
  }

  @override
  void dispose() {
    // 컨트롤러 dispose(제거)
    // 제거하는 이유는 위에서 이벤트 리스너를 추가하기 때문
    // 위젯이 사라질 때 이 컨트롤러를 우리의 메모리에서 지우고 싶다 -> 수동 조작 필요
    // dispose(제거)하는 것을 잊어버려도 괜찮음 -> 걀극 메모리가 부족해서 앱이 crash날거기 때문에 알수 밖에 없음
    _birthdayController.dispose();
    super.dispose(); // 모든 것의 뒤에 super.dispose()를 선언하는 것이 가장 좋다
  }

  void _onNextTop() {
    // if (_username.isEmpty) return;
    Navigator.of(context).pushAndRemoveUntil(
      MaterialPageRoute(
        builder: (context) => const InterestsScreen(),
      ),
      (route) => false,
    );
  }

  void _setTextFieldDate(DateTime date) {
    final textDate = date.toString().split(" ").first;
    _birthdayController.value = TextEditingValue(text: textDate);
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
              "When's your birthday?",
              style: TextStyle(
                fontSize: Sizes.size24,
                fontWeight: FontWeight.w700,
              ),
            ),
            Gaps.v10,
            const Text(
              "Your birthday won't be shown publicly.",
              style: TextStyle(
                fontSize: Sizes.size16,
                fontWeight: FontWeight.w600,
                color: Colors.black54,
              ),
            ),
            Gaps.v16,
            TextField(
              enabled: false,
              controller: _birthdayController,
              decoration: InputDecoration(
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
              child: const FormButton(disabled: false),
            )
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        height: 300,
        child: CupertinoDatePicker(
          mode: CupertinoDatePickerMode.date,
          maximumDate: initialDate,
          initialDateTime: initialDate,
          onDateTimeChanged: _setTextFieldDate, // 메모 : 유저가 날짜나 시간을 바꿀 때  호출될거임
        ),
      ),
    );
  }
}
