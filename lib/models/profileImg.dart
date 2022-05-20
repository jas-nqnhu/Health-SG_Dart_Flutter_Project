import 'dart:convert';

ProfileImage profileImageFromJson(String str) => ProfileImage.fromJson(json.decode(str));

String profileImageToJson(ProfileImage data) => json.encode(data.toJson());

class ProfileImage {
    ProfileImage({
        this.name,
        this.uid,
        this.url,
    });

    String name;
    String uid;
    String url;

    factory ProfileImage.fromJson(Map<String, dynamic> json) => ProfileImage(
        name: json["name"],
        uid: json["uid"],
        url: json["url"],
    );

    Map<String, dynamic> toJson() => {
        "name": name,
        "uid": uid,
        "url": url,
    };
}
