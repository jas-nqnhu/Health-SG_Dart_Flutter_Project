import 'dart:convert';

User userFromJson(String str) => User.fromJson(json.decode(str));

String userToJson(User data) => json.encode(data.toJson());

class User {
    User({
        this.id,
        this.userName,
        this.userEmail,
        this.userPhone,
        this.address,
        this.birthday,
        this.height,
        this.weight,
        this.lastscreening,
        this.bloodpresure,
        this.chototal,
        this.choldl,
        this.chohdl,
        this.bloodglucose,
    });

    String id;
    String userName;
    String userEmail;
    String userPhone;
    String address;
    String birthday;
    String height;
    String weight;
    String lastscreening;
    String bloodpresure;
    String chototal;
    String choldl;
    String chohdl;
    String bloodglucose;

    factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["id"],
        userName: json["userName"],
        userEmail: json["userEmail"],
        userPhone: json["userPhone"],
        address: json["address"],
        birthday: json["birthday"],
        height: json["height"],
        weight: json["weight"],
        lastscreening: json["lastscreening"],
        bloodpresure: json["bloodpresure"],
        chototal: json["chototal"],
        choldl: json["choldl"],
        chohdl: json["chohdl"],
        bloodglucose: json["bloodglucose"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "userName": userName,
        "userEmail": userEmail,
        "userPhone": userPhone,
        "address": address,
        "birthday": birthday,
        "height": height,
        "weight": weight,
        "lastscreening": lastscreening,
        "bloodpresure": bloodpresure,
        "chototal": chototal,
        "choldl": choldl,
        "chohdl": chohdl,
        "bloodglucose": bloodglucose,
        
    };
}

