import 'package:hive/hive.dart';

part 'artical_model.g.dart';

@HiveType(typeId: 0)
class Article extends HiveObject {
  @HiveField(0)
  final Source? source;

  @HiveField(1)
  final String? author;

  @HiveField(2)
  final String? title;

  @HiveField(3)
  final String? description;

  @HiveField(4)
  final String? url;

  @HiveField(5)
  final String? urlToImage;

  @HiveField(6)
  final DateTime? publishedAt;

  @HiveField(7)
  final String? content;

  Article({
    this.source,
    this.author,
    this.title,
    this.description,
    this.url,
    this.urlToImage,
    this.publishedAt,
    this.content,
  });

  factory Article.fromJson(Map<String, dynamic> json) {
    return Article(
      source: json['source'] != null ? Source.fromJson(json['source']) : null,
      author: json['author'],
      title: json['title'],
      description: json['description'],
      url: json['url'],
      urlToImage: json['urlToImage'],
      publishedAt: json['publishedAt'] != null
          ? DateTime.parse(json['publishedAt'])
          : null,
      content: json['content'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'source': source?.toJson(),
      'author': author,
      'title': title,
      'description': description,
      'url': url,
      'urlToImage': urlToImage,
      'publishedAt': publishedAt?.toIso8601String(),
      'content': content,
    };
  }
}

@HiveType(typeId: 1)
class Source extends HiveObject {
  @HiveField(0)
  final String? id;

  @HiveField(1)
  final String? name;

  Source({
    this.id,
    this.name,
  });

  factory Source.fromJson(Map<String, dynamic> json) {
    return Source(
      id: json['id'],
      name: json['name'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
    };
  }
}




// class Article {
//   final Source? source;
//   final String? author;
//   final String? title;
//   final String? description;
//   final String? url;
//   final String? urlToImage;
//   final DateTime? publishedAt;
//   final String? content;

//   Article({
//     this.source,
//     this.author,
//     this.title,
//     this.description,
//     this.url,
//     this.urlToImage,
//     this.publishedAt,
//     this.content,
//   });

//   factory Article.fromJson(Map<String, dynamic> json) {
//     return Article(
//       source: Source.fromJson(json['source']),
//       author: json['author'],
//       title: json['title'],
//       description: json['description'],
//       url: json['url'],
//       urlToImage: json['urlToImage'],
//       publishedAt: DateTime.parse(json['publishedAt']),
//       content: json['content'],
//     );
//   }
// }

// class Source {
//   final String? id;
//   final String? name;

//   Source({
//     this.id,
//     this.name,
//   });

//   factory Source.fromJson(Map<String, dynamic> json) {
//     return Source(
//       id: json['id'],
//       name: json['name'],
//     );
//   }
// }
