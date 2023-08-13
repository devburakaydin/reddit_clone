import '../index.dart';

class ChildModel extends Equatable {
  final String? title;
  final String? selfText;
  final String? author;
  final String? url;

  const ChildModel({this.title, this.selfText, this.author, this.url});

  static String? getUrl(Map<String, dynamic> json) {
    try {
      var list = json['data']['preview']['images'] as List;
      var resolutions = list.first['resolutions'] as List;
      return resolutions.first['url'];
    } catch (e) {
      return null;
    }
  }

  ChildModel.fromJson(Map<String, dynamic> json)
      : title = json['data']['title'],
        selfText = json['data']['selftext'],
        author = json['data']['author'],
        url = getUrl(json);

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['title'] = title;
    data['selftext'] = selfText;
    data['author'] = author;
    data['url'] = url;
    return data;
  }

  @override
  List<Object?> get props => [title, selfText, url];
}
