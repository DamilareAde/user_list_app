
import 'package:http/http.dart' as http;
import 'user_model.dart';

class ApiService {
  static const String apiUrl = 'http://localhost:3000/api/users';

  Future<List<User>> fetchUsers() async {
    final response = await http.get(Uri.parse(apiUrl));

    if (response.statusCode == 200) {
      var json;
      List jsonResponse = json.decode(response.body);
      return jsonResponse.map((user) => User.fromJson(user)).toList();
    } else {
      throw Exception('Failed to load users');
    }
  }
}
