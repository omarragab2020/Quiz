import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:untitled5/constant.dart';
import 'package:untitled5/controller/quiz-controller.dart';
import 'package:get/get.dart';

class ProgressTimer extends StatelessWidget {
   ProgressTimer({Key? key}) : super(key: key);

  final controller = Get.find<QuizController>();
  @override
  Widget build(BuildContext context) {
    return Obx(() =>
    SizedBox(
      width: 50,
      height: 50,
      child: Stack(
        alignment: Alignment.center,
        fit: StackFit.expand,
        children: [
          CircularProgressIndicator(
            value: 1 -(controller.sec.value /15),
            color: PrimaryColor,
            backgroundColor: Colors.grey,
            strokeWidth: 8,
          ),
          Center(
            child: Text(
              '${controller.sec.value}',
              style: Theme.of(context).textTheme.headline6!.copyWith(color: PrimaryColor),
            ),
          )
        ],
      ),
    )
    );
  }
}
