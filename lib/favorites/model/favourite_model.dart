import 'package:hive_flutter/hive_flutter.dart';
part 'favourite_model.g.dart';

@HiveType(typeId: 2)
class FavoriteDbModel extends HiveObject {
  @HiveField(0)
  bool? isFav;

  @HiveField(1)
  int? id;

  @HiveField(2)
  String? uri;

  @HiveField(3)
  String? artist;

  @HiveField(4)
  String? title;

  @HiveField(5)
  int? image;

  FavoriteDbModel({
    required this.title,
    this.isFav,
    this.id,
    this.uri,
    this.artist,
    this.image,
  });
}
