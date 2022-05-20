import 'dart:convert';

HealthArticles healthArticlesFromJson(String str) => HealthArticles.fromJson(json.decode(str));

String healthArticlesToJson(HealthArticles data) => json.encode(data.toJson());

class HealthArticles {
    HealthArticles({
        this.status,
        this.totalResults,
        this.articles,
    });

    String status;
    int totalResults;
    List<Article> articles;

    factory HealthArticles.fromJson(Map<String, dynamic> json) => HealthArticles(
        status: json["status"],
        totalResults: json["totalResults"],
        articles: List<Article>.from(json["articles"].map((x) => Article.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "totalResults": totalResults,
        "articles": List<dynamic>.from(articles.map((x) => x.toJson())),
    };
}

class Article {
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

    Source source;
    String author;
    String title;
    String description;
    String url;
    String urlToImage;
    DateTime publishedAt;
    String content;

    factory Article.fromJson(Map<String, dynamic> json) => Article(
        source: Source.fromJson(json["source"]),
        author: json["author"],
        title: json["title"],
        description: json["description"],
        url: json["url"],
        urlToImage: json["urlToImage"],
        publishedAt: DateTime.parse(json["publishedAt"]),
        content: json["content"],
    );

    Map<String, dynamic> toJson() => {
        "source": source.toJson(),
        "author": author,
        "title": title,
        "description": description,
        "url": url,
        "urlToImage": urlToImage,
        "publishedAt": publishedAt.toIso8601String(),
        "content": content,
    };

    static List<Article>filterList(List<Article> vl, String filterString){
      List<Article> _v = vl
      .where((u) => (u.publishedAt.toString().split('.').last.toLowerCase().contains(filterString.toLowerCase()))).toList();
      return _v;
    }
}

class Source {
    Source({
        this.id,
        this.name,
    });

    Id id;
    Name name;

    factory Source.fromJson(Map<String, dynamic> json) => Source(
        id: json["id"] == null ? null : idValues.map[json["id"]],
        name: nameValues.map[json["name"]],
    );

    Map<String, dynamic> toJson() => {
        "id": id == null ? null : idValues.reverse[id],
        "name": nameValues.reverse[name],
    };
}

enum Id { ENGADGET, WIRED }

final idValues = EnumValues({
    "engadget": Id.ENGADGET,
    "wired": Id.WIRED
});

enum Name { LIFEHACKER_COM, ENGADGET, WIRED }

final nameValues = EnumValues({
    "Engadget": Name.ENGADGET,
    "Lifehacker.com": Name.LIFEHACKER_COM,
    "Wired": Name.WIRED
});

class EnumValues<T> {
    Map<String, T> map;
    Map<T, String> reverseMap;

    EnumValues(this.map);

    Map<T, String> get reverse {
        if (reverseMap == null) {
            reverseMap = map.map((k, v) => new MapEntry(v, k));
        }
        return reverseMap;
    }
}
