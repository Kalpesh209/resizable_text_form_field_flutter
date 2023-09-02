import 'package:flutter/material.dart';
import 'package:resizable_textform_field_flutter/AppUtils/app_colors.dart';
import 'package:resizable_textform_field_flutter/AppUtils/app_strings.dart';
import 'package:resizable_textform_field_flutter/Presentation/Widgets/selector_widget.dart';
import 'package:resizable_textform_field_flutter/Presentation/Widgets/text_form_field_widget.dart';

/*
Title:  DraggableWidget
Purpose:  DraggableWidget
Created On : 20/09/2023
Last Updated On : 02/09/2023
Author: Kalpesh Khandla
*/

class DraggableWidget extends StatefulWidget {
  const DraggableWidget({super.key});

  @override
  State<DraggableWidget> createState() => _DraggableWidgetState();
}

class _DraggableWidgetState extends State<DraggableWidget> {
  TextEditingController wordController = TextEditingController();
  var ballDiameter = 7.5;
  double height = 70;
  double width = 250;

  double topPosition = 250;
  double leftPosition = 70;

  void onDrag(double dx, double dy) {
    var newHeight = height + dy;
    var newWidth = width + dx;

    setState(() {
      height = newHeight > 0 ? newHeight : 0;
      width = newWidth > 0 ? newWidth : 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SafeArea(
        child: GestureDetector(
          onPanUpdate: (details) {
            setState(() {
              topPosition += details.delta.dy;
              leftPosition += details.delta.dx;
            });
          },
          child: Stack(
            children: <Widget>[
              Positioned(
                top: topPosition,
                left: leftPosition,
                child: Container(
                  height: height,
                  width: width,
                  decoration: BoxDecoration(
                    color: AppColors.whiteColor,
                    border: Border.all(
                      color: AppColors.textfieldBorderColor.withOpacity(0.7),
                    ),
                  ),
                  child: Center(
                    child: TextFormFieldWidget(
                      controllerName: wordController,
                      hintTxt: AppStrings.textfieldHintTxt,
                      keyboardType: TextInputType.text,
                      cursorColor: AppColors.textfieldBorderColor,
                      contentPadding: 25,
                      onChange: (p0) {},
                      onSaved: (p0) {},
                      validatorData: (p0) {
                        return null;
                      },
                    ),
                  ),
                ),
              ),
              // top left
              Positioned(
                top: topPosition - ballDiameter / 2,
                left: leftPosition - ballDiameter / 2,
                child: SelectorWidget(
                  onDrag: (dx, dy) {
                    var mid = (dx + dy) / 2;
                    var newHeight = height - 2 * mid;
                    var newWidth = width - 2 * mid;

                    setState(() {
                      height = newHeight > 0 ? newHeight : 0;
                      width = newWidth > 0 ? newWidth : 0;
                      topPosition = topPosition + mid;
                      leftPosition = leftPosition + mid;
                    });
                  },
                ),
              ),
              // top middle
              Positioned(
                top: topPosition - ballDiameter / 2,
                left: leftPosition + width / 2 - ballDiameter / 2,
                child: SelectorWidget(
                  onDrag: (dx, dy) {
                    var newHeight = height - dy;

                    setState(() {
                      height = newHeight > 0 ? newHeight : 0;
                      topPosition = topPosition + dy;
                    });
                  },
                ),
              ),
              // top right
              Positioned(
                top: topPosition - ballDiameter / 2,
                left: leftPosition + width - ballDiameter / 2,
                child: SelectorWidget(
                  onDrag: (dx, dy) {
                    var mid = (dx + (dy * -1)) / 2;

                    var newHeight = height + 2 * mid;
                    var newWidth = width + 2 * mid;

                    setState(() {
                      height = newHeight > 0 ? newHeight : 0;
                      width = newWidth > 0 ? newWidth : 0;
                      topPosition = topPosition - mid;
                      leftPosition = leftPosition - mid;
                    });
                  },
                ),
              ),
              // center right
              Positioned(
                top: topPosition + height / 2 - ballDiameter / 2,
                left: leftPosition + width - ballDiameter / 2,
                child: SelectorWidget(
                  onDrag: (dx, dy) {
                    var newWidth = width + dx;

                    setState(() {
                      width = newWidth > 0 ? newWidth : 0;
                    });
                  },
                ),
              ),
              // bottom right
              Positioned(
                top: topPosition + height - ballDiameter / 2,
                left: leftPosition + width - ballDiameter / 2,
                child: SelectorWidget(
                  onDrag: (dx, dy) {
                    var mid = (dx + dy) / 2;

                    var newHeight = height + 2 * mid;
                    var newWidth = width + 2 * mid;

                    setState(() {
                      height = newHeight > 0 ? newHeight : 0;
                      width = newWidth > 0 ? newWidth : 0;
                      topPosition = topPosition - mid;
                      leftPosition = leftPosition - mid;
                    });
                  },
                ),
              ),
              // bottom center
              Positioned(
                top: topPosition + height - ballDiameter / 2,
                left: leftPosition + width / 2 - ballDiameter / 2,
                child: SelectorWidget(
                  onDrag: (dx, dy) {
                    var newHeight = height + dy;

                    setState(() {
                      height = newHeight > 0 ? newHeight : 0;
                    });
                  },
                ),
              ),
              // bottom left
              Positioned(
                top: topPosition + height - ballDiameter / 2,
                left: leftPosition - ballDiameter / 2,
                child: SelectorWidget(
                  onDrag: (dx, dy) {
                    var mid = ((dx * -1) + dy) / 2;

                    var newHeight = height + 2 * mid;
                    var newWidth = width + 2 * mid;

                    setState(() {
                      height = newHeight > 0 ? newHeight : 0;
                      width = newWidth > 0 ? newWidth : 0;
                      topPosition = topPosition - mid;
                      leftPosition = leftPosition - mid;
                    });
                  },
                ),
              ),
              //left center
              Positioned(
                top: topPosition + height / 2 - ballDiameter / 2,
                left: leftPosition - ballDiameter / 2,
                child: SelectorWidget(
                  onDrag: (dx, dy) {
                    var newWidth = width - dx;

                    setState(() {
                      width = newWidth > 0 ? newWidth : 0;
                      leftPosition = leftPosition + dx;
                    });
                  },
                ),
              ),
              //  center center
            ],
          ),
        ),
      ),
    );
  }
}
