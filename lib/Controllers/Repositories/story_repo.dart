import 'package:productbox_flutter_exercise/Models/story_model.dart';

class StoryRepo {
  static List<StoryModel> getUserData() {
    final List<Map<String, dynamic>> data = [
      {
        "user_name": "Asif Ali",
        "feedImage": "assets/images/laptop.jpg",
        'profileImage': 'assets/images/1.jpeg'
      },
      {
        "user_name": "Syed Shabir",
        "feedImage": "assets/images/laptop2.jpg",
        "profileImage": "assets/images/2.jpeg"
      },
      {
        "user_name": "Fahad Ali",
        "feedImage": "assets/images/laptop3.jpg",
        "profileImage": "assets/images/3.jpeg"
      },
      {
        "user_name": "Ali Bukhari",
        "feedImage": "assets/images/laptop4.jpg",
        "profileImage": "assets/images/4.jpeg"
      },
      {
        "user_name": "Ammar Khan",
        "feedImage": "assets/images/laptop5.jpg",
        "profileImage": "assets/images/5.jpeg"
      },
      {
        "user_name": "Sikandar Shah",
        "feedImage": "assets/images/laptop6.jpg",
        "profileImage": "assets/images/person.jpeg"
      },
      {
        "user_name": "Noreen Fatima",
        "feedImage": "assets/images/laptop7.jpg",
        "profileImage": "assets/images/women.jpeg"
      },
      {
        "user_name": "Hamza Khan",
        "feedImage": "assets/images/laptop8.jpg",
        "profileImage": "assets/images/person2.jpeg"
      },
      {
        "user_name": "Faizan Badshah",
        "feedImage": "assets/images/laptop9.jpg",
        'profileImage': 'assets/images/pic.jpeg'
      },
    ];
    List<StoryModel> list = [];
    for (var i = 0; i < data.length; i++) {
      StoryModel model = StoryModel.fromJson(data[i]);
      list.add(model);
    }
    return list;
  }
}
