import 'package:survey_app/models/question.dart';
import 'package:json_annotation/json_annotation.dart';
part 'answer.g.dart';

@JsonSerializable()
class Answer {
  int? id;
  int? questionId;
  String? content;
  var status;
  Question? question;
  Answer(this.id, this.content, this.status, this.questionId, this.question);
  factory Answer.fromJson(Map<String, dynamic> json) => _$AnswerFromJson(json);
  Map<String, dynamic> toJson() => _$AnswerToJson(this);
}
