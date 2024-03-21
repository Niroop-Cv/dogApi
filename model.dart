// To parse this JSON data, do
//
//     final apiDogResponse = apiDogResponseFromJson(jsonString);

import 'dart:convert';

ApiDogResponse apiDogResponseFromJson(String str) => ApiDogResponse.fromJson(json.decode(str));

String apiDogResponseToJson(ApiDogResponse data) => json.encode(data.toJson());

class ApiDogResponse {
    String? message;
    String? status;

    ApiDogResponse({
        this.message,
        this.status,
    });

    factory ApiDogResponse.fromJson(Map<String, dynamic> json) => ApiDogResponse(
        message: json["message"],
        status: json["status"],
    );

    Map<String, dynamic> toJson() => {
        "message": message,
        "status": status,
    };
}
