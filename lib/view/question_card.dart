import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:untitled5/controller/quiz-controller.dart';
import 'package:untitled5/model/question-model.dart';
import 'package:get/get.dart';

import 'answer.dart';

class QuestionCard extends StatelessWidget {

  final QuestionModel questionModel;
  const QuestionCard({Key? key,
  required this.questionModel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        height: 450,
        margin: const EdgeInsets.symmetric(horizontal: 20),
        decoration: BoxDecoration(
          color: Colors.grey,
          borderRadius: BorderRadius.circular(25),
        ),
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(questionModel.question,
                style: Theme.of(context).textTheme.headline6,
              ),
              const Spacer(flex: 1,),
              ...List.generate(questionModel.options.length, (index) =>
              Column(
                children: [
                  AnswerOptions(
                    questionId: questionModel.id,
                    index: index,
                    text: questionModel.options[index],
                    onPress: () => Get.find<QuizController>()
                      .checkAnswer(questionModel, index)
                  ),
                  const SizedBox(height: 15,),
                ],
              )
              ),
              const Spacer(flex: 1,)
            ],
          ),
        ),
      ),
    );
  }
}
