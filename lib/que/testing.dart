import 'package:det/que/homepage.dart';
import 'package:flutter/material.dart';

import '../home.dart';

class Testing extends StatefulWidget {
  @override
  _TestingState createState() => _TestingState();
}

class _TestingState extends State<Testing> {
  String? selectedOption;
  List<Option> options = [
    Option('FEMALE'),
    Option('MALE'),
  ];

  List<String> previousQuestions = [];
  List<String> previousSelections = [];

  int currentQuestionIndex = 0;
  List<Question> questions = [
    Question(
        'What is  your gender?',
        [
          Option('FEMALE'),
          Option('MALE'),
        ],
        'assets/images/bg1.jpg'),
    Question(
        "What's your age group?",
        [
          Option('18-24'),
          Option('25-40'),
          Option('40-55'),
          Option('55+'),
        ],
        'assets/images/bg2.jpg'),
    Question(
        'What is your skin type?',
        [
          Option('Normal'),
          Option('Dry'),
          Option('Oily'),
          Option('Sensitive'),
          Option("I don't know"),
        ],
        'assets/images/bg3.jpg'),
  ];

  late String backgroundImage;

  @override
  void initState() {
    super.initState();
    backgroundImage = questions[currentQuestionIndex].backgroundImage;
  }

  void submitSelection() {
    setState(() {

      //print('Selected option: $selectedOption');

      previousQuestions.add(questions[currentQuestionIndex].text);
      previousSelections.add(selectedOption!);


      if (currentQuestionIndex < questions.length-1) {
        currentQuestionIndex++;
        Question nextQuestion = questions[currentQuestionIndex];
        options = nextQuestion.options;
        backgroundImage = nextQuestion.backgroundImage;
        selectedOption = null;
      } else {

        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) =>HomePage()),
        );
      }
    });
  }

  void goBack() {
    setState(() {

      currentQuestionIndex--;
      selectedOption = previousSelections.removeLast();
      options = questions[currentQuestionIndex].options;
      backgroundImage = questions[currentQuestionIndex].backgroundImage;
    });
  } 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(backgroundImage),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          children: [
            const SizedBox(height: 350,),
            Center(
              child: Container(
                height: 300,
                width: 350,
                padding: const EdgeInsets.all(15.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16.0),
                  color: Colors.white.withOpacity(0.7),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      questions[currentQuestionIndex].text,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.red,
                      ),
                    ),
                    const SizedBox(height: 8.0),
                    Wrap(
                      spacing: 5.0,
                      runSpacing: 5.0,
                      children: options.map((option) {
                        bool isSelected = selectedOption == option.text;
                        return GestureDetector(
                          onTap: () {
                            setState(() {
                              if (isSelected) {
                                selectedOption = null;
                              } else {
                                selectedOption = option.text;
                              }
                            });
                          },
                          child: Container(
                            padding: const EdgeInsets.all(5.0),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8.0),
                              color: isSelected
                                  ? Colors.redAccent
                                  : Colors.transparent,
                              border: Border.all(
                                color: Colors.redAccent,
                                width: 1.0,
                              ),
                            ),
                            child: Center(
                              child: Text(option.text),
                            ),
                          ),
                        );
                      }).toList(),
                    ),
                    const SizedBox(height: 16.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.redAccent,
                            foregroundColor: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30),
                            ),
                            elevation: 2,
                          ),
                          onPressed:
                              previousQuestions.isNotEmpty ? goBack : null,
                          child: const Text('Back'),
                        ),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor:
                                Colors.redAccent, // Background color
                            foregroundColor: Colors.white, // Text color
                            shape: RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.circular(30), // Rounded corners
                            ),
                            elevation: 2, // Shadow elevation
                          ),
                          onPressed: submitSelection,
                          child: const Text('Submit'),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Option {
  final String text;

  Option(this.text);
}

class Question {
  final String text;
  final List<Option> options;
  final String backgroundImage;

  Question(this.text, this.options, this.backgroundImage);
}
