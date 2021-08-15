import 'package:survey_app/models/question.dart';

import 'package:json_annotation/json_annotation.dart';
part 'survey.g.dart';

@JsonSerializable()
class Survey {
  int? id;
  String? name;
  String? desc;
  List<Question>? questions;
  Survey(this.id, this.name, this.desc, this.questions);
  factory Survey.fromJson(Map<String, dynamic> json) => _$SurveyFromJson(json);
  Map<String, dynamic> toJson() => _$SurveyToJson(this);
}
