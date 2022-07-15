// CRIAR UMA FUNÇÃO DE LOGIN
// VALIDAR O E-MAIL
// VALIDAR SENHA
// VALIDAR NO BACKEND , API SE OS DADOS ESTÃO CERTOS
// DIRECIONAR PARA A TELA DE HOME

// ignore_for_file: prefer_is_empty

import 'package:flutter/material.dart';
import 'package:login_dart/pages/home_page.dart';
import 'package:login_dart/pages/login_page.dart';

void main() {
  runApp(
    MaterialApp(
      initialRoute: '/login',
      routes: {
        '/login': (context) => const LoginPage(),
        '/home': (context) => const HomePage()
      },
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xffFCEC5F)),
        primaryColor: const Color(0xffFCEC5F),
        focusColor: const Color(0xffFCEC5F),
        iconTheme: const IconThemeData(color: Color(0xffFCEC5F)),
        primaryIconTheme: const IconThemeData(color: Color(0xffFCEC5F)),
      ),
    ),
  );
}
