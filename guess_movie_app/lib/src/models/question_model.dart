import 'package:json_annotation/json_annotation.dart';
part 'question_model.g.dart';

// This is the model class for the question
@JsonSerializable(fieldRename: FieldRename.snake)
class QuestionModelJson {
  String? answer;
  String? imageUrl;

  QuestionModelJson({this.answer, this.imageUrl});

  factory QuestionModelJson.fromJson(json) => _$QuestionModelFromJson(json);

  toJson() => _$QuestionModelToJson(this);

  static List<QuestionModelJson> fromJsonList(List? json) {
    return json?.map((e) => QuestionModelJson.fromJson(e)).toList() ??
        List.empty();
  }
}
