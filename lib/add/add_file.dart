import 'dart:convert';
//import 'dart:html';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_application_2/add/logger.dart';
import 'package:http/http.dart' as http;
//import 'package:get/get.dart';

class AddFile extends StatefulWidget {
  const AddFile({super.key, required Map todo});

  @override
  State<AddFile> createState() => _AddFileState();
}

class _AddFileState extends State<AddFile> {
  // bool _isLoading = false;
  // submit(String employee, String bookingat) async {
  //   String url =
  //       "http://ec2-3-137-201-63.us-east-2.compute.amazonaws.com/api/khaleefa/fetch";
  //   String token;

  //   final SharedPreferences prefs = await SharedPreferences.getInstance();
  //   // SharedPreferences sharedpreferences = await SharedPreferences.getInstance();
  //   Map body = {"token": "N6&Sy{4;Hq`uQxr_"};
  //   var jsonResponse;
  //   var res = await http.post(url, body: body);
  //   if (res.statusCode == 200) {
  //     jsonResponse = json.decode(res.body);
  //     print('Response status: ${res.statusCode}');
  //     print('Response status: ${res.body}');
  //     if (jsonResponse != null) {
  //       setState(() {
  //         _isLoading = false;
  //       });
  //       sharedpreferences.setString("token", jsonResponse['token']);
  //     }
  //   }
  // }

  TextEditingController employeeController = TextEditingController();
  TextEditingController bookingatController = TextEditingController();
  //TextEditingController startatController = TextEditingController();
  // TextEditingController endsatController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('ToDo App')),
      body: ListView(padding: EdgeInsets.all(8.0), children: [
        TextField(
          controller: employeeController,
          decoration: InputDecoration(labelText: 'Name', hintText: 'Employee'),
        ),
        SizedBox(
          height: 10,
        ),
        TextField(
          controller: bookingatController,
          keyboardType: TextInputType.multiline,
          decoration: InputDecoration(hintText: 'BookingAt'),
          maxLines: 3,
          minLines: 1,
        ),
        SizedBox(
          height: 20,
        ),
        // TextField(
        //   controller: startatController,
        //   keyboardType: TextInputType.multiline,
        //   decoration: InputDecoration(hintText: ''),
        //   maxLines: 3,
        //   minLines: 1,
        // ),
        // SizedBox(
        //   height: 20,
        // ),
        // TextField(
        //   controller: endsatController,
        //   keyboardType: TextInputType.multiline,
        //   decoration: InputDecoration(hintText: ''),
        //   maxLines: 3,
        //   minLines: 1,
        // ),
        // SizedBox(
        //   height: 20,
        // ),
        ElevatedButton(onPressed: SubmitData, child: Text('submit hh'))
      ]),
    );
  }

  // Future<void> Update() async {
  //   final item = widget.todo;
  //   if (item == null) {
  //     print('you can not call updated without todo data');
  //     return;
  //   }
  //   final id = item['_id'];
  //   final employee = employeeController.text;
  //   final bookingat = bookingatController.text;
  //   final body = {"status": employee, "data": 1, "message": "bookingat"};
  //   final url =
  //   'http://ec2-3-137-201-63.us-east-2.compute.amazonaws.com/api/khaleefa/update/5';
  //   final uri = Uri.parse(url);
  //   final response = await http.put(
  //     uri,
  //     body: jsonEncode(body),
  //     headers: {'Content-Type': 'application/json'},
  //   );
  //   if (response.statusCode == 200) {

  //     showSuccessMessage('Updation Success');
  //   } else {

  //     showErrorMessage('Updation Failed');
  //     // print(response.body);
  //   }
  // }

  Future<void> SubmitData() async {
    final employee = employeeController.text;
    final bookingat = bookingatController.text;
    // final startat = startatController.text;
    // final endsat = endsatController.text;
    Map body = {
      // "title": "string",
      // "description": "string",
      // "is_completed": false
      // "status": employee,
      // "data": false,
      // "message": "bookingat",
      "booking_status": "done",
      "address": "vijayawada",
      "notes": "booking accepted",
      "employee": "rajiv",
      "booking_at": "15-feb-2023",
      "start_at": "15-feb-2023 12:30",
      "end_at": "15-feb-2023 2:30",
      "token": "N6&Sy{4;Hq`uQxr_"
    };
    // final Url = 'http://api.nstack.in/v1/todos ';
    final Url =
        'http://ec2-3-137-201-63.us-east-2.compute.amazonaws.com/api/khaleefa/create';
    final uri = Uri.parse(Url);
    final response = await http.post(
      uri,
      body: jsonEncode(body),
      headers: {'Content-Type': 'application/json'},
    );
    logger.d(response);
    logger.d("response data");
    logger.d(response.body.toString());
    // if (response.statusCode == 201) {
    //   print('Creation Success');
    //    showSuccessMessage('')
    // } else {
    // //  print('Creation Error');
    //   showSuccessMessage('Creation Failed');
    // //  print(response.body);
    // }

    if (response.statusCode == 201) {
      // employeeController.text = '';
      // bookingatController.text = '';

      // print('Creation Success');
      // print("Title: _titleController");
      showSuccessMessage('Creation Success');
    } else {
      //  print('Creation Failed');
      // print("Description: _descriptionController");
      showSuccessMessage('Creation Failed');
      print(response.body);
      print(response.statusCode);
    }
  }

  void showSuccessMessage(String message) {
    final snackBar = SnackBar(
      content: Text(
        message,
        style: TextStyle(color: Colors.white),
      ),
      backgroundColor: Colors.green,
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  void showErrorMessage(String message) {
    final snackBar = SnackBar(
      content: Text(message, style: TextStyle(color: Colors.white)),
      backgroundColor: Colors.green,
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}
