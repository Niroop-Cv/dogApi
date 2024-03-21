import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:quizz_app/model.dart';

class JustApi extends StatefulWidget {
  JustApi({super.key});

  @override
  State<JustApi> createState() => _JustApiState();
}

class _JustApiState extends State<JustApi> {
  String mes =
      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS-S-3usroBngWIFb_HPtfEsAlCaVzcuRgixmS2EleNTQ&s";
  String url = "https://dog.ceo/api/breeds/image/random";

  Future<ApiDogResponse> getApi() async {
    final response = await http.get(Uri.parse(url));
    print("heyyyyyyyy${response.body}");
    // final abc = (response.body);
    final responseData = jsonDecode(response.body);
    final data = ApiDogResponse.fromJson(responseData);
    return data;
    // mes=abc["message"];
  }

  void initState() {
    getApi();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: FutureBuilder(
          future: getApi(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            } else if (snapshot.hasData) {
              return Image.network(snapshot.data!.message.toString());
            } else {
              return Center(
                child: Text(snapshot.error.toString()),
              );
            }
          },
        ),
        floatingActionButton: FloatingActionButton(onPressed: () {
          getApi();
          setState(() {});
        }),
      ),
    );
  }
}
