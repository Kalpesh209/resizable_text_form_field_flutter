import 'package:flutter/material.dart';
import 'package:resizable_textform_field_flutter/AppUtils/app_strings.dart';
import 'package:resizable_textform_field_flutter/Presentation/Screens/draggable_text_form_field_screen.dart';

/*
Title: Entry Point of a App
Purpose: Entry Point of a App
Created On : 02/9/2023
Last Updated On : 02/9/2023
Author : Kalpesh Khandla
*/

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: AppStrings.resizableText,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: DraggableTextFormFieldScreen(),
    );
  }
}
