import 'package:hive/hive.dart';

@HiveType(typeId: 0)
class ArticleModel extends HiveObject {
  @HiveField(0)
  String? title;
  @HiveField(1)
  String? image;
  @HiveField(2)
  String? date;
  @HiveField(3)
  String? content;
  @HiveField(4)
  String? type;

  ArticleModel({required this.title, required this.image, required this.date,required this.content,required this.type});
   ArticleModel.fromJson(Map<String, dynamic> json,String types) {
    title = json['title'];
    image = json['urlToImage'];
    date = json['publishedAt'];
    content = json['content'];
    type =  types;
  }
}
