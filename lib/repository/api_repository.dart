import 'package:http/http.dart' as http;
import '../index.dart';

typedef HttpClient = http.Client;

const url = "https://www.reddit.com/r/flutterdev/top.json?count=20";

class ApiRepository {
  Future<List<ChildModel>> getDates() async {
    var response = await HttpClient().get(Uri.parse(url));

    if (response.statusCode == 200) {
      var json = jsonDecode(response.body);
      var list = json['data']['children'] as List;
      return list
          .map((e) => ChildModel.fromJson(e))
          .cast<ChildModel>()
          .toList();
    }
    throw Exception();
  }
}
