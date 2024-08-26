import 'package:flutter/material.dart';
import 'package:quizz_app/dummydb.dart';
import 'package:quizz_app/view/home_screen/widgets/optionCard.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int? selectedAnswerIndex;
  int questionIndex = 0;
  @override
  Widget build(BuildContext context) {
    int listLength = Dummydb.questions.length;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        actions: [
          Text(
            '1/$listLength',
            style: TextStyle(
              color: Colors.blue,
            ),
          ),
          SizedBox(
            width: 10,
          )
        ],
      ),
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
          child: Column(
            children: [
              Expanded(
                child: _questionCard(),
              ),
              SizedBox(
                height: 16,
              ),
              Column(
                children: List.generate(
                  4,
                  (index) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: OpntionCard(
                        questionIndex: questionIndex,
                        optionIndex: index,
                        borderColor: _getColor(index),
                        onTap: () {
                          if (selectedAnswerIndex == null) {
                            selectedAnswerIndex = index;
                            setState(() {});
                          }
                        },
                      ),
                    );
                  },
                ),
              ),
              SizedBox(
                height: 16,
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: InkWell(
        onTap: () {
          if (questionIndex < Dummydb.questions.length - 1) {
            setState(() {
              selectedAnswerIndex = null;
              questionIndex++;
            });
          } else {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content: Text('Thanks'),
              backgroundColor: Colors.red,
            ));
          }
        },
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          height: 50,
          width: double.infinity,
          decoration: BoxDecoration(
              color: Colors.blue, borderRadius: BorderRadius.circular(16)),
          child: Center(
            child: Text(
              'Next',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
            ),
          ),
        ),
      ),
    );
  }

  Container _questionCard() {
    return Container(
      padding: EdgeInsets.all(10),
      width: double.infinity,
      height: 200,
      decoration: BoxDecoration(
          color: Colors.grey, borderRadius: BorderRadius.circular(16)),
      child: Center(
        child: Text(
          Dummydb.questions[questionIndex]['question'],
          style: TextStyle(fontSize: 20, color: Colors.white),
        ),
      ),
    );
  }

  Color _getColor(int index) {
    if (selectedAnswerIndex != null) {
      if (index == Dummydb.questions[questionIndex]['answer']) {
        return Colors.green;
      }
      if (selectedAnswerIndex == Dummydb.questions[questionIndex]['answer'] &&
          selectedAnswerIndex == index) {
        return Colors.green;
      } else if (selectedAnswerIndex !=
              Dummydb.questions[questionIndex]['answer'] &&
          selectedAnswerIndex == index) {
        return Colors.red;
      }
    }

    return Colors.grey;
  }
}
