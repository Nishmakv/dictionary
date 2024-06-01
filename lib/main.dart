import 'package:dictionary/bloc/dictionary_bloc.dart';
import 'package:dictionary/screens/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(BlocProvider(
    create: (context) => DictionaryBloc(),
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        textTheme: GoogleFonts.ptSerifTextTheme(),
      ),
      
      home: HomeScreen(),
    );
  }
}
