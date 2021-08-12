import 'package:http/http.dart' as http;
import 'package:user_info/models/user.dart';

class FetchUserInfo{
  static const url = "https://jsonplaceholder.typicode.com/users";
  static Future<List<User>?> fetch_info() async{
    try{
      final response = await http.get(Uri.parse(url));
      if(200 == response.statusCode){
        final List<User> users = userFromJson(response.body);
        return users;
      }else{
        return List.empty();
      }
    }catch(e){
      return List.empty();
    }
  }
}