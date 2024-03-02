import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_interview_helper/values/models/question_model.dart';

class FireDb {
  static late CollectionReference _questions;
  static late FirebaseFirestore _db;

  static init() {
    _db = FirebaseFirestore.instance;
    _questions = _db.collection('interview_questions');
  }

  Future<List<QuestionModel>> getQuestions() async {
    try {
      List<QuestionModel> list = [];
      await _questions.get().then((QuerySnapshot querySnapshot) {
        for (var doc in querySnapshot.docs) {
          list.add(QuestionModel.fromJson(doc.data() as Map<String, dynamic>));
        }
      });
      return list;
    } catch (e) {
      print(e);
      return [];
    }
  }

}
