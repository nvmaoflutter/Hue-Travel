class NewsModel {
  final String? id;
  final String? title;
  final String? titleEn;
  final String? content;
  final String? contentEn;
  final String? url;

  NewsModel(
      {this.id,
      this.title,
      this.titleEn,
      this.content,
      this.contentEn,
      this.url});

  factory NewsModel.fromJson(Map<String, dynamic> json) {
    return NewsModel(
      id: json["id"] as String?,
      title: json["title"] as String?,
      content: json["content"] as String?,
      titleEn: json["titleEn"] as String?,
      contentEn: json["contentEn"] as String?,
      url: json["url"] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "title": title,
      "content": content,
      "titleEn": titleEn,
      "contentEn": contentEn,
      "url": url,
    };
  }
}
