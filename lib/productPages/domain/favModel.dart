import 'package:freezed_annotation/freezed_annotation.dart';
part 'favModel.g.dart';

@JsonSerializable(explicitToJson: true)
class FavObject {
  List<String>? fav;

  FavObject(
      {
        required this.fav,

      });
  Map<String, dynamic> toJson() => _$FavObjectToJson(this);
  factory FavObject.fromJson(Map<String, dynamic> json) =>
      _$FavObjectFromJson(json);
}