import 'package:flutter/material.dart';
import 'package:the_movie_db/theme/app_button_style.dart';

class AuthWidget extends StatefulWidget {
  const AuthWidget({super.key});

  @override
  _AuthWidgetState createState() => _AuthWidgetState();
}

class _AuthWidgetState extends State<AuthWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "Войти в свою учетную запись",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: ListView(
        children: const [_HeaderWidget()],
      ),
    );
  }
}

class _HeaderWidget extends StatelessWidget {
  const _HeaderWidget({super.key});
  final textStyle = const TextStyle(fontSize: 16, color: Colors.black);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: [
          const SizedBox(height: 25),
          const _FormWidget(),
          const SizedBox(height: 25),
          Text(
            "Чтобы пользоваться правкой и возможностями рейтинга TMDB, а также получить персональные рекомендации, необходимо войти в свою учётную запись. Если у вас нет учётной записи, её регистрация является бесплатной и простой. Нажмите ниже, чтобы начать",
            style: textStyle,
          ),
          const SizedBox(height: 5),
          TextButton(
            style: AppButtonStyle.linkButton,
            onPressed: () {},
            child: const Text('Регистрация'),
          ),
          const SizedBox(height: 25),
          Text(
            'Если Вы зарегистрировались, но не получили письмо для подтверждения, нажмите, чтобы отправить письмо повторно',
            style: textStyle,
          ),
          const SizedBox(height: 10),
          TextButton(
            style: AppButtonStyle.linkButton,
            onPressed: () {},
            child: const Text('Отправить письмо'),
          ),
        ],
      ),
    );
  }
}

class _FormWidget extends StatefulWidget {
  const _FormWidget({super.key});

  @override
  State<_FormWidget> createState() => __FormWidgetState();
}

class __FormWidgetState extends State<_FormWidget> {
  final _loginTextController = TextEditingController(text: 'admin');
  final _passwordTextController = TextEditingController(text: 'admin');
  String? errorText = null;

  void _auth() {
    final login = _loginTextController.text;
    final password = _passwordTextController.text;
    if (login == "admin" && password == "admin") {
      errorText = null;

      Navigator.of(context).pushReplacementNamed('/main_screen');
    } else {
      errorText = "Не верный логин или пароль";
    }
    setState(() {});
  }

  void _resetPassword() {
    print('object');
  }

  @override
  Widget build(BuildContext context) {
    const textStyle = TextStyle(
      fontSize: 16,
      color: Color.fromRGBO(33, 37, 41, 1),
    );
    const textFieldDecorator = InputDecoration(
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.grey),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Color.fromRGBO(1, 180, 228, 1)),
      ),

      contentPadding: EdgeInsets.symmetric(horizontal: 10, vertical: 8),
      isCollapsed: true,
    );

    final errorText = this.errorText;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (errorText != null) ...[
          Text(
            errorText,
            style: const TextStyle(color: Colors.red, fontSize: 17),
          ),
          const SizedBox(height: 20),
        ],
        const Text('Имя пользователя', style: textStyle),
        TextField(
          controller: _loginTextController,
          decoration: textFieldDecorator,
          cursorColor: const Color.fromRGBO(33, 37, 41, 1),
        ),
        const SizedBox(
          height: 20,
        ),
        const Text('Пароль', style: textStyle),
        TextField(
          controller: _passwordTextController,
          decoration: textFieldDecorator,
          cursorColor: const Color.fromRGBO(33, 37, 41, 1),
          obscureText: true,
        ),
        const SizedBox(
          height: 30,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextButton(
              style: ButtonStyle(
                shape: WidgetStateProperty.all(
                  const RoundedRectangleBorder(
                    borderRadius: BorderRadiusGeometry.all(
                      Radius.circular(6),
                    ),
                  ),
                ),
                foregroundColor: WidgetStateProperty.all(Colors.black),
                backgroundColor: WidgetStateProperty.all(
                  const Color.fromRGBO(222, 226, 230, 1),
                ),
                textStyle: WidgetStateProperty.all(
                  const TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
                ),
                padding: WidgetStateProperty.all(
                  const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
                ),
              ),
              onPressed: _auth,
              child: const Text(
                "Войти",
              ),
            ),
            const SizedBox(
              width: 12,
            ),
            TextButton(
              style: AppButtonStyle.linkButton,
              onPressed: _resetPassword,
              child: const Text(
                "Сбросить пароль",
              ),
            ),
          ],
        ),
      ],
    );
  }
}
