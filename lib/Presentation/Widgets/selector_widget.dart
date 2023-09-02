import 'package:flutter/material.dart';
import 'package:resizable_textform_field_flutter/AppUtils/app_colors.dart';

/*
Title:  SelectorWidget
Purpose:  SelectorWidget
Created On : 02/09/2023
Last Updated On : 02/09/2023
Author: Kalpesh Khandla
*/

class SelectorWidget extends StatefulWidget {
  final Function onDrag;
  const SelectorWidget({
    super.key,
    required this.onDrag,
  });

  @override
  State<SelectorWidget> createState() => _SelectorWidgetState();
}

class _SelectorWidgetState extends State<SelectorWidget> {
  late double initX;
  late double initY;

  _handleDrag(details) {
    setState(() {
      initX = details.globalPosition.dx;
      initY = details.globalPosition.dy;
    });
  }

  _handleUpdate(details) {
    var dx = details.globalPosition.dx - initX;
    var dy = details.globalPosition.dy - initY;
    initX = details.globalPosition.dx;
    initY = details.globalPosition.dy;
    widget.onDrag(dx, dy);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onPanStart: _handleDrag,
      onPanUpdate: _handleUpdate,
      child: Container(
        height: 10,
        width: 10,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(2),
          color: AppColors.whiteColor,
          border: Border.all(
            width: 1.5,
            color: AppColors.textfieldBorderColor.withOpacity(0.9),
          ),
        ),
      ),
    );
  }
}
