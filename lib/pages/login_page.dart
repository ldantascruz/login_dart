import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String? username = '';
  String? password = '';
  var isLoading = false;
  var isLogged = false;

  final formKey = GlobalKey<FormState>();

  void login({
    required String username,
    required String password,
  }) async {
    isLoading = true;
    setState(() {});
    final response = await apiLogin(username: username, password: password);
    isLoading = false;
    setState(() {});
    if (response) {
      Navigator.pushNamed(context, '/home');
    }
  }

  bool validate() {
    final form = formKey.currentState!;
    if (form.validate()) {
      form.save();
      return true;
    } else {
      return false;
    }
  }

  String? validateUsername(String? username) {
    return username != null && username.isNotEmpty
        ? null
        : 'O usuário não pode estar vazio';
  }

  String? validatePassword(String? password) {
    return password != null && password.length >= 6
        ? null
        : 'A senha precisa ter no mínimo 6 caracteres';
  }

  Future<bool> apiLogin({
    required String username,
    required String password,
  }) async {
    await Future.delayed(const Duration(seconds: 3));
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xeef0f0f0),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(30),
              child: Container(
                height: 500,
                width: 400,
                color: const Color(0xffffffff),
                child: Padding(
                  padding: const EdgeInsets.only(left: 10, right: 20),
                  child: Form(
                    key: formKey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Padding(
                          padding: EdgeInsets.only(bottom: 50),
                          child: Image(
                            image: AssetImage(
                              'assets/images/bitcoin2.png',
                            ),
                            height: 100,
                          ),
                        ),
                        TextFormField(
                          validator: ((value) => validateUsername(value)),
                          onSaved: (value) => username = value,
                          keyboardType: TextInputType.emailAddress,
                          decoration: const InputDecoration(
                            focusColor: Color(0xffFCEC5F),
                            icon: Icon(
                              Icons.person,
                            ),
                            hintText: 'Email',
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: Color(0xffFCEC5F),
                                width: 2,
                              ),
                            ),
                          ),
                          style: const TextStyle(
                            color: Colors.black,
                          ),
                        ),
                        const SizedBox(height: 10),
                        TextFormField(
                          validator: ((value) => validatePassword(value)),
                          onSaved: (value) => password = value,
                          obscureText: true,
                          keyboardType: TextInputType.visiblePassword,
                          decoration: const InputDecoration(
                            focusColor: Color(0xffFCEC5F),
                            icon: Icon(
                              Icons.lock_outline,
                              //color: Color(0xffFCEC5F),
                            ),
                            hintStyle: TextStyle(),
                            hintText: 'Senha',
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: Color(0xffFCEC5F),
                                width: 2,
                              ),
                            ),
                          ),
                          style: const TextStyle(
                            color: Colors.black,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 15),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              TextButton(
                                style: const ButtonStyle(),
                                onPressed: () {},
                                child: const Text(
                                  'Esqueceu sua senha?',
                                  style: TextStyle(color: Color(0x660f0f0f)),
                                ),
                              ),
                            ],
                          ),
                        ),
                        if (isLoading)
                          const CircularProgressIndicator()
                        else
                          TextButton(
                            style: TextButton.styleFrom(
                              backgroundColor: const Color(0xffFCEC5F),
                              fixedSize: const Size(200, 60),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(200),
                              ),
                            ),
                            onPressed: () {
                              if (validate()) {
                                login(username: username!, password: password!);
                              }
                            },
                            child: const Text(
                              'Login',
                              style: TextStyle(
                                color: Color(0xff000000),
                                fontSize: 20,
                              ),
                            ),
                          ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
