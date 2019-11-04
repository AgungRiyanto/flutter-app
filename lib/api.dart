import 'dart:async';
import 'package:http/http.dart' as http;

const baseUrl = 'http://localhost:8000/api';

class API {
  static Future login() {
    var url = baseUrl + "/login";

    return http.post(url);
  } 
}