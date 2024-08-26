import 'package:flutter/material.dart';
import 'package:quizz_app/dummydb.dart';

class OpntionCard extends StatelessWidget {
  OpntionCard({
    super.key,
    required this.questionIndex,
    required int this.optionIndex,
    this.onTap,
    this.borderColor = Colors.white,
  });

  final int questionIndex;
  final int optionIndex;
  final void Function()? onTap;
  Color borderColor;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10),
      child: InkWell(
        onTap: onTap,
        child: Container(
          width: double.infinity,
          height: 50,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: borderColor)),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  Dummydb.questions[questionIndex]['options'][optionIndex],
                  style: TextStyle(color: Colors.white),
                ),
                CircleAvatar(
                  backgroundColor: Colors.white,
                  radius: 10,
                  child: CircleAvatar(
                    backgroundColor: Colors.black,
                    radius: 8,
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
