// To parse this JSON data, do
//
//     final postResponseModel = postResponseModelFromJson(jsonString);

import 'dart:convert';

List<PostResponseModel> postResponseModelFromJson(String str) => List<PostResponseModel>.from(json.decode(str).map((x) => PostResponseModel.fromJson(x)));

String postResponseModelToJson(List<PostResponseModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class PostResponseModel {
    final int? userId;
    final int? id;
    final String? title;
    final String? body;

    PostResponseModel({
        this.userId,
        this.id,
        this.title,
        this.body,
    });

    factory PostResponseModel.fromJson(Map<String, dynamic> json) => PostResponseModel(
        userId: json["userId"],
        id: json["id"],
        title: json["title"],
        body: json["body"],
    );

    Map<String, dynamic> toJson() => {
        "userId": userId,
        "id": id,
        "title": title,
        "body": body,
    };
}
