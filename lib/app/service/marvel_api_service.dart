// services/marvel_api_service.dart
import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:crypto/crypto.dart';
import 'dart:convert';

class MarvelApiService {
  final String baseUrl = 'https://gateway.marvel.com/v1/public/';
  final String publicKey = dotenv.env['PUBLIC_KEY']!;
  final String privateKey = dotenv.env['PRIVATE_KEY']!;

  String _generateHash(String timestamp) {
    return md5.convert(utf8.encode('$timestamp$privateKey$publicKey')).toString();
  }

  Future<Response> getCharacters() async {
    final timestamp = DateTime.now().millisecondsSinceEpoch.toString();
    final hash = _generateHash(timestamp);
    final response = await Dio().get('${baseUrl}characters', queryParameters: {
      'ts': timestamp,
      'apikey': publicKey,
      'hash': hash,
    });
    return response;
  }
}
