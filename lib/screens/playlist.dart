

import 'dart:convert';

Playlist playlistFromJson(String str) => Playlist.fromJson(json.decode(str));

String playlistToJson(Playlist data) => json.encode(data.toJson());

class Playlist {
    String msg;
    List<Datum> data;

    Playlist({
        required this.msg,
        required this.data,
    });

    factory Playlist.fromJson(Map<String, dynamic> json) => Playlist(
        msg: json["msg"],
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "msg": msg,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
    };
}

class Datum {
    String avatar;
    String nameplaylist;
    int cantidad;
    bool favorites;
    String idplaylist;

    Datum({
        required this.avatar,
        required this.nameplaylist,
        required this.cantidad,
        required this.favorites,
        required this.idplaylist,
    });

    factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        avatar: json["avatar"],
        nameplaylist: json["nameplaylist"],
        cantidad: json["cantidad"],
        favorites: json["favorites"],
        idplaylist: json["idplaylist"],
    );

    Map<String, dynamic> toJson() => {
        "avatar": avatar,
        "nameplaylist": nameplaylist,
        "cantidad": cantidad,
        "favorites": favorites,
        "idplaylist": idplaylist,
    };
}
