import 'package:survey_app/models/answer.dart';

import 'package:json_annotation/json_annotation.dart';
part 'question.g.dart';

@JsonSerializable()
class Question {
  int? id;
  int? surveyId;
  String? content;
  List<Answer>? answers;
  Question(this.id, this.content, this.answers, this.surveyId);
  factory Question.fromJson(Map<String, dynamic> json) =>
      _$QuestionFromJson(json);
  Map<String, dynamic> toJson() => _$QuestionToJson(this);
}
