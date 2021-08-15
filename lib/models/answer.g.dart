// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'answer.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Answer _$AnswerFromJson(Map<String, dynamic> json) {
  return Answer(
    json['id'] as int?,
    json['content'] as String?,
    json['status'],
    json['questionId'] as int?,
    json['question'] == null
        ? null
        : Question.fromJson(json['question'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$AnswerToJson(Answer instance) => <String, dynamic>{
      'id': instance.id,
      'questionId': instance.questionId,
      'content': instance.content,
      'status': instance.status,
      'question': instance.question,
    };
