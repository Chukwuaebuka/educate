import 'package:flutter/material.dart';
import 'presentation/screens/home_screen.dart';
import 'presentation/screens/practice_screen.dart';
import 'presentation/screens/question_screen.dart';

void main() {
  runApp(Educate());
}

class Educate extends StatelessWidget {
  const Educate({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Educate',
      theme: ThemeData(
        primaryColor: Colors.teal,
        brightness: Brightness.light,
        scaffoldBackgroundColor: Colors.greenAccent,
        fontFamily: 'Outfit',
      ),
      darkTheme: ThemeData.dark(),
      initialRoute: '/',
      routes: {
        '/': (context) => HomeScreen(),
        '/practice': (context) => PracticeScreen(),
        '/question': (context) => QuestionScreen(),
      },
    );
  }
}
