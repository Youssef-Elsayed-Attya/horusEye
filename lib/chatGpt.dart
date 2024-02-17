import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:horus_eye/presentation/home/homeScreen.dart';
import 'package:http/http.dart' as http;

class GPT {
  GPT({required this.text,required this.fullText});

  final text;
  final fullText;

  Future chatGpt() async {
     final response =
        await http.post(Uri.parse('https://api.openai.com/v1/chat/completions'),
            headers: {
              'Content-Type': 'application/json',
              'Authorization':
                  'Bearer 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'
            },
            body: jsonEncode({
              "model": "gpt-3.5-turbo",
              "messages": [
                
                {
                  "role": "system",
                  "content":
                      "$fullText"
                },
                {"role": "user", "content": text}
              ]
            }));
    Map body = jsonDecode(response.body);
    var choises = body['choices'][0];
    var message = choises['message'];
    var output = message['content'];
    return output;
  }
  Future horusGPT() async{
     final response =
        await http.post(Uri.parse('https://api.openai.com/v1/chat/completions'),
            headers: {
              'Content-Type': 'application/json',
              'Authorization':
                  'Bearer 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'
            },
            body: jsonEncode({
              "model": "gpt-3.5-turbo",
              "messages": [

                {
                  "role": "system",
                  "content":
                      "You are Horus Eye, the tour guide at the Grand Egyptian Museum."
                },
                {"role": "user", "content": text}
              ]
            }));
    Map body = jsonDecode(response.body);
    var choises = body['choices'][0];
    var message = choises['message'];
    var output = message['content'];
    return output;

  }
}
