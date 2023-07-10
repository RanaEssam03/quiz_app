import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({required this.startQuiz,super.key});
  final void Function() startQuiz;

  @override
  Widget build(context) {
    final mediaQuery = MediaQuery.of(context);
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            'assets/images/quiz-logo.png',
            height: mediaQuery.size.height * 0.4,
            color: const Color.fromARGB(150, 255, 255, 255),
          ),
          //   Opacity(
          //   opacity: 0.6,
          //   child: Image.asset(
          //     'assets/images/quiz-logo.png',
          //     height: mediaQuery.size.height * 0.4,
          //   ),
          // ),
          SizedBox(
            height: mediaQuery.size.height * 0.08,
          ),
          const Text(
            "Learn Flutter the fun way!",
            style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.w700,
            ),
          ),
          SizedBox(
            height: mediaQuery.size.height * 0.05,
          ),
          OutlinedButton.icon(
            onPressed: startQuiz,
            style: OutlinedButton.styleFrom(
              foregroundColor: Theme.of(context).colorScheme.error,
              textStyle: TextStyle(
                fontSize: 20,
                fontFamily: GoogleFonts.lato().fontFamily,
                fontWeight: FontWeight.w700,
              ),
            ),
            icon: const Icon(
              Icons.arrow_forward,
            ),
            label: SizedBox(
              width: mediaQuery.size.width * 0.3,
              child: const Text(
                ' Strat Quiz',
              ),
            ),
          ),
        ],
      ),
    );
  }
}
