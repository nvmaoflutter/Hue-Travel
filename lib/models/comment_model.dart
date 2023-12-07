class CommentModel {
  final String? name;
  final String? avatar;
  final int? star;
  final String? content;

  CommentModel({this.name, this.avatar, this.star, this.content});

  factory CommentModel.fromJson(Map<String, dynamic> json) {
    return CommentModel(
      name: json["name"] as String?,
      avatar: json["avatar"] as String?,
      star: json["star"] as int?,
      content: json["content"] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "name": name,
      "avatar": avatar,
      "star": star,
      "content": content,
    };
  }
}
