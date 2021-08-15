// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'question.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Question _$QuestionFromJson(Map<String, dynamic> json) {
  return Question(
    json['id'] as int?,
    json['content'] as String?,
    (json['answers'] as List<dynamic>?)
        ?.map((e) => Answer.fromJson(e as Map<String, dynamic>))
        .toList(),
    json['surveyId'] as int?,
  );
}

Map<String, dynamic> _$QuestionToJson(Question instance) => <String, dynamic>{
      'id': instance.id,
      'surveyId': instance.surveyId,
      'content': instance.content,
      'answers': instance.answers,
    };
