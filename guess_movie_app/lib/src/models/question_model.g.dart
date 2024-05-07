// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'question_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

QuestionModel _$QuestionModelFromJson(Map<String, dynamic> json) =>
    QuestionModel(
      question: json['question'] as String?,
      answer: json['answer'] as String?,
      imageUrl: json['image_url'] as String?,
    );

Map<String, dynamic> _$QuestionModelToJson(QuestionModel instance) =>
    <String, dynamic>{
      'question': instance.question,
      'answer': instance.answer,
      'image_url': instance.imageUrl,
    };
