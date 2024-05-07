import 'package:json_annotation/json_annotation.dart';
part 'question_model.g.dart';

// This is the model class for the question
@JsonSerializable(fieldRename: FieldRename.snake)
class QuestionModel {
  String? question;
  String? answer;
  String? imageUrl;

  QuestionModel({this.question, this.answer, this.imageUrl});

  factory QuestionModel.fromJson(json) => _$QuestionModelFromJson(json);

  toJson() => _$QuestionModelToJson(this);

  static List<QuestionModel> fromJsonList(List? json) {
    return json?.map((e) => QuestionModel.fromJson(e)).toList() ?? List.empty();
  }
}
