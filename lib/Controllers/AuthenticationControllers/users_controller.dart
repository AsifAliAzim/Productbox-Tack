import 'package:productbox_flutter_exercise/Models/users_model.dart';

class UsersController {
  //[Note: As the json data in the api is a list we can just instantiate the
  //list of model just as below
  //If the json will be an map data we can instantiate the model my passing
  //some initial values here....

  //list of all users data
  static List<dynamic> registeredUsersList = [];

  //list of credentials model
  static List<UsersModel?>? credentialsList = [];

  static List<dynamic> filteredCredentials = [];
}
