// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'question_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

QuestionModelJson _$QuestionModelFromJson(Map<String, dynamic> json) =>
    QuestionModelJson(
      answer: json['answer'] as String?,
      imageUrl: json['image_url'] as String?,
    );

Map<String, dynamic> _$QuestionModelToJson(QuestionModelJson instance) =>
    <String, dynamic>{
      'answer': instance.answer,
      'image_url': instance.imageUrl,
    };
