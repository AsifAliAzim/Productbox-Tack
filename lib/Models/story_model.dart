import 'dart:convert';

class StoryModel {
  factory StoryModel.fromRawJson(String str) =>
      StoryModel.fromJson(json.decode(str));

  final String? userName;
  final String? profileImage;
  final String? feedImage;

  StoryModel({
    this.userName,
    this.feedImage,
    this.profileImage,
  });

  factory StoryModel.fromJson(Map<String, dynamic> json) {
    return StoryModel(
      userName: json['user_name'],
      profileImage: json['profileImage'],
      feedImage: json['feedImage'],
    );
  }
}
