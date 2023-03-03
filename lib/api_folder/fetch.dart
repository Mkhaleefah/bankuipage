
import 'dart:convert';

import 'package:flutter_application_2/api_folder/carddetails.dart';
import 'package:http/http.dart' as http;

Future<CardDetails> fetchCardDetails() async {
  final response = await http.get(Uri.parse(
      ' http://ec2-3-137-201-63.us-east-2.compute.amazonaws.com/api/khaleefa/getdata'));
  if (response.statusCode == 200) {
    return CardDetails.fromJson(jsonDecode(response.body));
  }else{
    throw Exception('Failed to load card details');
  }
}
