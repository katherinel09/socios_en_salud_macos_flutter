import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:survey_kit/survey_kit.dart';

class CustomStep extends StatelessWidget {
  final String label;
  final String content;
  final int index;
  final int currentStep;
  final VoidCallback onFinishedClicked;
  final VoidCallback onStepCancelClicked;
  final VoidCallback onStepContinueClicked;

  const CustomStep({
    super.key,
    required this.label,
    required this.content,
    required this.index,
    required this.currentStep,
    required this.onFinishedClicked,
    required this.onStepCancelClicked,
    required this.onStepContinueClicked,
  });

  @override
  Widget build(BuildContext context) {
    // IntrinsicHeight will make sure we don't have render drawing issues when infinite height is available.
    return IntrinsicHeight(
      child: Row(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CircleAvatar(
                    radius: 15,
                    backgroundColor: currentStep >= index
                        ? Colors.orange
                        : Colors.grey.shade300,
                    child: currentStep <= index
                        ? Text(
                            '${index + 1}',
                            style: const TextStyle(color: Colors.black),
                          )
                        : const Icon(
                            Icons.check,
                          ),
                  ),
                  // Last Index hence the Extended Line Wont Appear.
                  index == 2
                      ? Container()
                      : Expanded(
                          child: Container(
                            height: 35,
                            width: 2.5,
                            color: Colors.orange,
                          ),
                        )
                ],
              ),
            ],
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.only(
                  bottom: currentStep > 1 == true ? 0 : 32, left: 10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 5,
                  ),
                  Text(
                    label,
                    style: const TextStyle(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  // Hide Everything except Heading when we are not on same Index.
                  if (currentStep == index)
                    const SizedBox(
                      height: 20,
                    ),
                  if (currentStep == index)
                    Text(
                      content,
                    ),
                  if (currentStep == index)
                    Padding(
                      padding: const EdgeInsets.only(top: 16.0),
                      child: Row(
                        children: [
                          ElevatedButton(
                            onPressed: currentStep == 2
                                ? onFinishedClicked
                                : onStepContinueClicked,
                            child: currentStep < 2
                                ? const Text('Continue')
                                : const Text('Finish'),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          TextButton(
                            onPressed:
                                currentStep == 0 ? null : onStepCancelClicked,
                            child: Text(
                              'Back',
                              style: TextStyle(
                                  color: currentStep == 0
                                      ? Colors.grey
                                      : Colors.blue),
                            ),
                          )
                        ],
                      ),
                    ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

class SesSurvey extends StatefulWidget {
  const SesSurvey({Key? key}) : super(key: key);

  @override
  _SesSurveyState createState() => _SesSurveyState();
}

class _SesSurveyState extends State<SesSurvey> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        colorScheme:
            ColorScheme.fromSeed(seedColor: Color.fromRGBO(233, 158, 82, 1)),
        useMaterial3: true,
      ),
      home: Scaffold(
        body: Container(
          alignment: Alignment.center,
          child: FutureBuilder<Task>(
            future: getJsonTask(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done &&
                  snapshot.hasData &&
                  snapshot.data != null) {
                final task = snapshot.data!;
                return SurveyKit(
                  onResult: (SurveyResult result) {
                    print(result.finishReason);
                    final jsonResult =
                        result.toJson(); // print the json-formatted results
                    print(jsonResult);
                    Navigator.pushNamed(context, '/');
                  },
                  task: task,
                  showProgress: true,
                  localizations: {
                    'cancel': 'Cancel',
                    'next': 'Next',
                  },
                );
              }
              return CircularProgressIndicator.adaptive();
            },
          ),
        ),
      ),
    );
  }

  Future<Task> getSampleTask() {
    var task = NavigableTask(
      id: TaskIdentifier(),
      steps: [
        InstructionStep(
          title: 'Hola, soy el ChatBot para Socios en Salud. ',
          text: '¡Mucho gusto! 😊',
          buttonText: 'Lista',
        ),
        QuestionStep(
            title: 'Antes de continuar, ingrese su fecha de nacimiento.',
            answerFormat: DateAnswerFormat(
                maxDate: DateTime.now(), minDate: DateTime(1900, 1))),
        QuestionStep(
          title: 'Tuberculosis',
          text: '¿Usted recibió tratamiento para tuberculosis?',
          answerFormat: BooleanAnswerFormat(
            positiveAnswer: 'Sí',
            negativeAnswer: 'No',
            result: BooleanResult.POSITIVE,
          ),
        ),
        QuestionStep(
          title: 'Inicio de tratamiento',
          text:
              '¿Cuál es el mes y año de inicio de su último tratamiento para Tuberculosis?',
          answerFormat: DateAnswerFormat(
              maxDate: DateTime.now(), minDate: DateTime(1900, 1)),
        ),
        QuestionStep(
            title: 'Fin de tratamiento',
            text:
                '¿Cuál es el mes y año de inicio de su último tratamiento para Tuberculosis?',
            answerFormat: DateAnswerFormat(
                maxDate: DateTime.now(), minDate: DateTime(1900, 1))),
        QuestionStep(
            title: 'COVID',
            text:
                '¿Usted tiene un resultado POSITIVO de prueba para COVID-19 en los últimos 20 días?',
            answerFormat: BooleanAnswerFormat(
              positiveAnswer: 'Sí',
              negativeAnswer: 'No',
              result: BooleanResult.POSITIVE,
            )),
        CompletionStep(
            stepIdentifier: StepIdentifier(id: DateTime.now().toString()),
            title: 'Termina',
            text:
                'Agradecemos por su participación, lo invitamos a nuestra web de SES. \n https://sociosensalud.org.pe/')
      ],
    );
    task.addNavigationRule(
      forTriggerStepIdentifier: task.steps[2].stepIdentifier,
      navigationRule: ConditionalNavigationRule(
        resultToStepIdentifierMapper: (input) {
          switch (input) {
            case "Sí":
              return task.steps[3].stepIdentifier;
            case "No":
              return task.steps[7].stepIdentifier;
            default:
              return null;
          }
        },
      ),
    );
    task.addNavigationRule(
      forTriggerStepIdentifier: task.steps[3].stepIdentifier,
      navigationRule: ConditionalNavigationRule(
        resultToStepIdentifierMapper: (input) {
          switch (input) {
            case "Sí":
              return task.steps[4].stepIdentifier;
            case "No":
              return task.steps[7].stepIdentifier;
            default:
              return null;
          }
        },
      ),
    );
    return Future.value(task);
  }

  Future<Task> getJsonTask() async {
    final taskJson = await rootBundle.loadString('assets/ses_survey.json');
    final taskMap = json.decode(taskJson);
    return Task.fromJson(taskMap);
  }
}
