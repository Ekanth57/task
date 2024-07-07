import 'package:http/http.dart' as http;
import 'package:task/services/posts.dart';

class RemoteService {
  Future<List<Post>?> getPosts() async {
    var client = http.Client();

    var uri = Uri.parse('https://fakestoreapi.com/products/');
    var response = await client.get(uri);
    if (response.statusCode == 200) {
      var json = response.body;
      return postFromJson(json);
    } else {
      throw ('error');
    }
  }
}