import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:untitled5/controller/quiz-controller.dart';


class AnswerOptions  extends GetWidget {
  String text;
  int index, questionId;
  Function() onPress;
  AnswerOptions({required this.text,required this.index,required this.questionId,required this.onPress,});
  @override
  Widget build(BuildContext context) {
    return GetBuilder<QuizController>(
        init: QuizController(),
        builder: (controller)=>InkWell(
          onTap: controller.checkIsQuestionAnswered(questionId) ? null :onPress,
          child: Container(
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(25),
              border: Border.all(width: 3,color: controller.getColor(index)), 
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                RichText(
                    text: TextSpan(
                      text: '${index +1}',
                      style: Theme.of(context).textTheme.headline6,
                      children: [
                        TextSpan(
                          text: text,
                          style: Theme.of(context).textTheme.headline6,
                        )
                      ]
                    )
                ),
                if(controller.checkIsQuestionAnswered(questionId)&&
                controller.selectAnswer == index)
                  Container(
                    width: 30,
                    height: 30,
                    padding: EdgeInsets.zero,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: controller.getColor(index),
                      border: Border.all(
                        color: Colors.white,
                        width: 3
                      ),
                      shape: BoxShape.circle
                    ),
                    child: Icon(
                      color: Colors.white,
                      controller.getIcon(index),
                    ),
                  ),
              ],
            ),
          ),
        ));
  }
}
