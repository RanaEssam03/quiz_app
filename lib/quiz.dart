import 'package:flutter/material.dart';
import 'package:quiz_app/data/questions.dart';
import 'package:quiz_app/questions_screen.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz_app/results_screen.dart';

import 'home_screen.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});
  @override
  State<Quiz> createState() {
    return _QuizState();
  }
}

class _QuizState extends State<Quiz> {
  Widget? activeScreen;
  final List<String> chosenAns = [];

  @override
  void initState() {
    activeScreen = HomeScreen(
      startQuiz: switchScreen,
    );
    super.initState();
  }

  void addAns(String str) {
    chosenAns.add(str);
    print(chosenAns.length);
    if (chosenAns.length == questions.length) {
      setState(() {
        activeScreen = ResultsScreen(chosenAns);
      });
    }
  }

  void switchScreen() {
    setState(() {
      chosenAns.clear();
      activeScreen = QuestionsScreen(addAns);
    });
  }

  @override
  Widget build(context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: GoogleFonts.lato().fontFamily,
        colorScheme: const ColorScheme(
          primary: Color.fromARGB(255, 103, 65, 199),
          onPrimary: Color.fromARGB(255, 38, 21, 68),
          secondary: Color.fromARGB(255, 31, 30, 30),
          onSecondary: Colors.black,
          error: Colors.white,
          onError: Colors.white,
          background: Color.fromARGB(255, 38, 21, 68),
          onBackground: Colors.black,
          surface: Colors.black,
          onSurface: Colors.black,
          brightness: Brightness.dark,
        ),
      ),
      home: Scaffold(
        // backgroundColor:const Color.fromARGB(255, 103, 65, 199),
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color.fromARGB(255, 38, 21, 68),
                Color.fromARGB(255, 103, 65, 199),
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: activeScreen,
        ),
      ),
    );
  }
}
