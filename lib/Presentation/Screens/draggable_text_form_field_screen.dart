import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:resizable_textform_field_flutter/AppUtils/app_colors.dart';
import 'package:resizable_textform_field_flutter/AppUtils/app_strings.dart';
import 'package:resizable_textform_field_flutter/Presentation/Widgets/draggable_widget.dart';

/*
Title:  DraggableTextFormFieldScreen
Purpose:  DraggableTextFormFieldScreen
Created On : 29/09/2023
Last Updated On : 02/09/2023
Author: Kalpesh Khandla
*/

class DraggableTextFormFieldScreen extends StatefulWidget {
  @override
  State<DraggableTextFormFieldScreen> createState() =>
      _DraggableTextFormFieldScreenState();
}

class _DraggableTextFormFieldScreenState
    extends State<DraggableTextFormFieldScreen> {
  TextEditingController wordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarWidget(),
      body: SafeArea(
        child: DraggableWidget(),
      ),
    );
  }

  PreferredSizeWidget appBarWidget() {
    return AppBar(
      centerTitle: true,
      title: Text(
        AppStrings.resizableText,
      ),
    );
  }
}
