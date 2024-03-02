class QuestionModel {
  final String? question;
  final String? answer;

  QuestionModel({
    required this.answer,
    required this.question,
  });

  static QuestionModel fromJson(Map data) {
    return QuestionModel(
      answer: data['a'],
      question: data['q'],
    );
  }
}
