import 'package:flutter/material.dart';
import 'package:home_project_1/theme/app_button_style.dart';
import 'package:home_project_1/widgets/main_screen/main_screen_widget.dart';

class AuthWidget extends StatefulWidget {
  const AuthWidget({Key? key}) : super(key: key);

  @override
  State<AuthWidget> createState() => _AuthWidgetState();
}

class _AuthWidgetState extends State<AuthWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Войдите в свой аккаунт'),
      ),
      body: ListView(
        children: [_HeaderWidget()],
      ),
    );
  }
}

class _HeaderWidget extends StatelessWidget {
  const _HeaderWidget({Key? key}) : super(key: key);

  final textStyle = const TextStyle(fontSize: 16, color: Colors.black);

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 25),
            _FormWidget(),
            SizedBox(height: 25),
            Text(
              'Тут вы найдете самые свежие чарты Jeppesen, составление маршрутов для виртуальных полетов,'
                  ' различные руководства, и другие полезные «плюшки» в помощь виртуальным пилотам.',
              style: textStyle,
            ),
            SizedBox(height: 5),
            TextButton(
                style: AppButtonStyle.linkButton,
                onPressed: () {},
                child: Text('Регистрация')),
            SizedBox(height: 25),
            Text(
              'Если вы зарегистрировались, но не получили электронное письмо с подтверждением.',
              style: textStyle,
            ),
            SizedBox(height: 5),
            TextButton(
                style: AppButtonStyle.linkButton,
                onPressed: () {},
                child: Text('Подтвердить е-мейл'))
          ],
        ));
  }
}

class _FormWidget extends StatefulWidget {
  const _FormWidget({Key? key}) : super(key: key);

  @override
  State<_FormWidget> createState() => _FormWidgetState();
}

class _FormWidgetState extends State<_FormWidget> {
  final _loginTextController = TextEditingController(text: 'admin');//потом убрать
  TextEditingController _passwordTextController = TextEditingController(text: 'admin');//потом убрать
  String? errorText = null;

  void _auth() {
    final login = _loginTextController.text;
    final password = _passwordTextController.text;
    if (login == 'admin' && password == 'admin') {
      errorText = null;
      Navigator.of(context).pushReplacementNamed('/main_screen');
    }
    else {
      errorText = 'Неверный логин или пароль';
    }
    setState(() {});
  }

  void _resetPassword() {
    _passwordTextController = TextEditingController(text: '');
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final textStyle = const TextStyle(fontSize: 16, color: Color(0xFF212529));
    final color = Color(0xFF01B4E4);
    final textFieldDecorator = const InputDecoration(
        border: OutlineInputBorder(),
        contentPadding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        isCollapsed: true);
    final errorText = this.errorText;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (errorText != null)...[
          Text(
            errorText,
            style: TextStyle(color: Colors.red,
                fontSize: 17
            ),
          ),
          SizedBox(height: 20),
        ],
        Text('Username',
        ),
        SizedBox(height: 5),
        TextField(
            controller: _loginTextController,
            decoration: textFieldDecorator),
        Text('Password', style: textStyle),
        SizedBox(height: 5),
        TextField(
            controller: _passwordTextController,
            decoration: textFieldDecorator,
            obscureText: true),
        SizedBox(
          height: 25,
        ),
        Row(
          children: [
            ElevatedButton(
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(color),
                    foregroundColor: MaterialStateProperty.all(Colors.white),
                    textStyle: MaterialStateProperty.all(
                        TextStyle(fontSize: 16, fontWeight: FontWeight.w700)),
                    padding: MaterialStateProperty.all(
                        EdgeInsets.symmetric(horizontal: 15, vertical: 8))),
                onPressed: () {
                  _auth();
                },
                child: Text('Логин')),
            SizedBox(
              height: 30,
            ),
            TextButton(
                style: AppButtonStyle.linkButton,
                onPressed: () {
                  _resetPassword();
                },
                child: Text('Сброс пароля'))
          ],
        )
      ],
    );
  }
}
