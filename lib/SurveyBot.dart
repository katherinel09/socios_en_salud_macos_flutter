import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:survey_kit/survey_kit.dart';

class SesSurvey extends StatefulWidget {
  @override
  _SesSurveyState createState() => _SesSurveyState();
}

class _SesSurveyState extends State<SesSurvey> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Container(
          color: Colors.white,
          child: Align(
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
                      Navigator.pushNamed(context, '/');
                    },
                    task: task,
                    showProgress: true,
                    localizations: {
                      'cancel': 'Cancel',
                      'next': 'Next',
                    },
                    themeData: Theme.of(context).copyWith(
                      primaryColor: Color.fromRGBO(233, 158, 82, 1),
                      appBarTheme: const AppBarTheme(
                        color: Colors.white,
                        iconTheme: IconThemeData(
                          color: Colors.orange,
                        ),
                        titleTextStyle: TextStyle(
                          color: Colors.orange,
                        ),
                      ),
                      iconTheme: const IconThemeData(
                        color: Colors.cyan,
                      ),
                      textSelectionTheme: TextSelectionThemeData(
                        cursorColor: Colors.orange,
                        selectionColor: Colors.orange,
                        selectionHandleColor: Colors.orange,
                      ),
                      outlinedButtonTheme: OutlinedButtonThemeData(
                        style: ButtonStyle(
                          minimumSize: MaterialStateProperty.all(
                            Size(150.0, 60.0),
                          ),
                          side: MaterialStateProperty.resolveWith(
                            (Set<MaterialState> state) {
                              if (state.contains(MaterialState.disabled)) {
                                return BorderSide(
                                  color: Colors.grey,
                                );
                              }
                              return BorderSide(
                                color: Colors.orange,
                              );
                            },
                          ),
                          shape: MaterialStateProperty.all(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                          ),
                          textStyle: MaterialStateProperty.resolveWith(
                            (Set<MaterialState> state) {
                              if (state.contains(MaterialState.disabled)) {
                                return Theme.of(context)
                                    .textTheme
                                    .labelLarge
                                    ?.copyWith(
                                      color: Colors.grey,
                                    );
                              }
                              return Theme.of(context)
                                  .textTheme
                                  .labelLarge
                                  ?.copyWith(
                                    color: Colors.orangeAccent,
                                  );
                            },
                          ),
                        ),
                      ),
                      textButtonTheme: TextButtonThemeData(
                        style: ButtonStyle(
                          textStyle: MaterialStateProperty.all(
                            Theme.of(context).textTheme.labelLarge?.copyWith(
                                  color: Colors.orange,
                                ),
                          ),
                        ),
                      ),
                      textTheme: TextTheme(
                        displayMedium: TextStyle(
                          fontSize: 28.0,
                          color: Colors.black,
                        ),
                        headlineSmall: TextStyle(
                          fontSize: 24.0,
                          color: Colors.black,
                        ),
                        bodyMedium: TextStyle(
                          fontSize: 18.0,
                          color: Colors.black,
                        ),
                        titleMedium: TextStyle(
                          fontSize: 18.0,
                          color: Colors.black,
                        ),
                      ),
                      inputDecorationTheme: InputDecorationTheme(
                        labelStyle: TextStyle(
                          color: Colors.black,
                        ),
                      ),
                      colorScheme: ColorScheme.fromSwatch(
                        primarySwatch: Colors.cyan,
                      )
                          .copyWith(
                            onPrimary: Colors.white,
                          )
                          .copyWith(background: Colors.white),
                    ),
                    surveyProgressbarConfiguration: SurveyProgressConfiguration(
                      backgroundColor: Colors.white,
                    ),
                  );
                }
                return CircularProgressIndicator.adaptive();
              },
            ),
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
          title: 'Hola',
          text: 'Soy el ChatBot para Socios en Salud. Mucho gusto 😊',
          buttonText: 'Comienza',
        ),
        QuestionStep(
          title: 'Cuantos años tienes?',
          isOptional: false,
          answerFormat: ScaleAnswerFormat(
            step: 1,
            minimumValue: 0,
            maximumValue: 100,
            defaultValue: 30,
            minimumValueDescription: '0',
            maximumValueDescription: '100',
          ),
        ),
        QuestionStep(
          title: 'Tuberculosis',
          text: '¿Usted recibió tratamiento para tuberculosis?',
          isOptional: false,
          answerFormat: BooleanAnswerFormat(
            positiveAnswer: 'Yes',
            negativeAnswer: 'No',
            result: BooleanResult.POSITIVE,
          ),
        ),
        QuestionStep(
          title: 'Tuberculosis',
          text:
              '¿Usted tiene menos de tres meses o tres meses de haber salido de ALTA de tratamiento TB?',
          isOptional: false,
          answerFormat: BooleanAnswerFormat(
            positiveAnswer: 'Yes',
            negativeAnswer: 'No',
            result: BooleanResult.POSITIVE,
          ),
        ),
        QuestionStep(
          text:
              'Cuál es el mes de inicio de su último tratamiento para Tuberculosis',
          isOptional: false,
          answerFormat: MultipleChoiceAnswerFormat(
            textChoices: [
              TextChoice(text: 'enero', value: 'enero'),
              TextChoice(text: 'febrero', value: 'febrero'),
              TextChoice(text: 'marzo', value: 'marzo'),
              TextChoice(text: 'abril', value: 'abril'),
              TextChoice(text: 'mayo', value: 'mayo'),
              TextChoice(text: 'junio', value: 'junio'),
              TextChoice(text: 'julio', value: 'julio'),
              TextChoice(text: 'agosoto', value: 'agosoto'),
              TextChoice(text: 'septiembre', value: 'septiembre'),
              TextChoice(text: 'octubre', value: 'octubre'),
              TextChoice(text: 'noviembre', value: 'noviembre'),
              TextChoice(text: 'diciembre', value: 'diciembre'),
            ],
          ),
        ),
        QuestionStep(
          text:
              '¿Cuál es el año de inicio de su último tratamiento para Tuberculosis?',
          isOptional: false,
          answerFormat: ScaleAnswerFormat(
            step: 1,
            minimumValue: 1950,
            maximumValue: 2050,
            defaultValue: 2000,
            minimumValueDescription: '1950',
            maximumValueDescription: '2050',
          ),
        ),
        QuestionStep(
          title:
              '¿Cuál es el mes de inicio de su último tratamiento para Tuberculosis?',
          isOptional: false,
          answerFormat: MultipleChoiceAnswerFormat(
            textChoices: [
              TextChoice(text: 'enero', value: 'enero'),
              TextChoice(text: 'febrero', value: 'febrero'),
              TextChoice(text: 'marzo', value: 'marzo'),
              TextChoice(text: 'abril', value: 'abril'),
              TextChoice(text: 'mayo', value: 'mayo'),
              TextChoice(text: 'junio', value: 'junio'),
              TextChoice(text: 'julio', value: 'julio'),
              TextChoice(text: 'agosoto', value: 'agosoto'),
              TextChoice(text: 'septiembre', value: 'septiembre'),
              TextChoice(text: 'octubre', value: 'octubre'),
              TextChoice(text: 'noviembre', value: 'noviembre'),
              TextChoice(text: 'diciembre', value: 'diciembre'),
            ],
          ),
        ),
        QuestionStep(
          title:
              '¿Cuál es el año de inicio de su último tratamiento para Tuberculosis?',
          isOptional: false,
          answerFormat: ScaleAnswerFormat(
            step: 1,
            minimumValue: 1950,
            maximumValue: 2050,
            defaultValue: 2000,
            minimumValueDescription: '1950',
            maximumValueDescription: '2050',
          ),
        ),
        QuestionStep(
          title: 'COVID',
          text:
              '¿Usted tiene un resultado POSITIVO de prueba para COVID-19 en los últimos 20 días?',
          isOptional: false,
          answerFormat: SingleChoiceAnswerFormat(
            textChoices: [
              TextChoice(text: 'Sí', value: 'Sí'),
              TextChoice(text: 'No', value: 'No'),
            ],
            defaultSelection: TextChoice(text: 'No', value: 'No'),
          ),
        ),
        QuestionStep(
          text:
              'Marque una de las siguientes alternativas para poder valorar si presenta sensación de falta de aire:',
          isOptional: false,
          answerFormat: SingleChoiceAnswerFormat(
            textChoices: [
              TextChoice(
                  text:
                      'Tan solo me falta el aire al realizar ejercicio intenso.',
                  value: 'grado_0_de_mMRC'),
              TextChoice(
                  text:
                      'Me falta el aire al andar de prisa en llano, o al subir una pendiente poco pronunciada.',
                  value: 'grado_1_de_mMRC'),
              TextChoice(
                  text:
                      'No puedo mantener el paso de otras personas de mi misma edad en llano o tengo que detenerme para respirar al andar en llano a mi propio paso.',
                  value: 'grado_2_de_mMRC'),
              TextChoice(
                  text:
                      'Me detengo para respirar después de andar unos 100 metros o después de andar pocos minutos en llano.',
                  value: 'grado_3_de_mMRC'),
              TextChoice(
                  text:
                      'Tengo demasiada dificultad respiratoria para salir de casa o me cuesta respirar al vertirme o desvestirme.',
                  value: 'grado_4_de_mMRC'),
            ],
            defaultSelection: TextChoice(
                text:
                    'No puedo mantener el paso de otras personas de mi misma edad en llano o tengo que detenerme para respirar al andar en llano a mi propio paso.',
                value: 'grado_2_de_mMRC'),
          ),
        ),
        CompletionStep(
          stepIdentifier: StepIdentifier(id: '321'),
          text:
              'Agradecemos por su participación, lo invitamos a nuestra web de SES. \n https://sociosensalud.org.pe/',
          title: 'Termina',
          buttonText: 'Enviar encuesta',
        ),
      ],
    );
    task.addNavigationRule(
      forTriggerStepIdentifier: task.steps[6].stepIdentifier,
      navigationRule: ConditionalNavigationRule(
        resultToStepIdentifierMapper: (input) {
          switch (input) {
            case "Yes":
              return task.steps[0].stepIdentifier;
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
    final taskJson = await rootBundle.loadString('assets/example_json.json');
    final taskMap = json.decode(taskJson);

    return Task.fromJson(taskMap);
  }
}
