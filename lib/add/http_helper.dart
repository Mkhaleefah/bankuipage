import 'dart:convert';

import 'package:flutter_application_2/add/logger.dart';
import 'package:http/http.dart' as http;
import 'package:logger/logger.dart';

class HTTPHelper {
  Future<List<Map>> fetchItems() async {
    List<Map> items = [];
    // Map data = {"token": "N6&Sy{4;Hq`uQxr_"};
    http.Response response = await http.get(Uri.parse(
        'http://ec2-3-137-201-63.us-east-2.compute.amazonaws.com/api/khaleefa/fetch?token=N6%26Sy{4;Hq`uQxr_'));
    logger.d(response);
    logger.d("response data");
    logger.d(response.body.toString());
    if (response.statusCode == 200) {
      String jsonString = response.body;
        items = jsonDecode(jsonString);
      // List data = jsonDecode(jsonString);
      // items = data.cast<Map>();
    }
    return items;
  }

  Future<Map> getItem(Id) async {
    Map item = {};

    //Get the item from the API
    http.Response response = await http.get(
      Uri.parse(
        'http://ec2-3-137-201-63.us-east-2.compute.amazonaws.com/api/khaleefa/fetch?token=N6%26Sy{4;Hq`uQxr_&id=3'));

    if (response.statusCode == 200) {
      //get the data from the response
      String jsonString = response.body;
      //Convert to List<Map>
      item = jsonDecode(jsonString);
    }

    return item;
  }

  Future<bool> addItem(Map data) async {
    bool status = false;

    //Add the item to the database, call the API
    Map data = {
      "booking_status": "done",
      "address": "vijayawada",
      "notes": "booking accepted",
      "employee": "rajiv",
      "booking_at": "15-feb-2023",
      "start_at": "15-feb-2023 12:30",
      "end_at": "15-feb-2023 2:30",
      "token": "N6&Sy{4;Hq`uQxr_"
    };
    http.Response response = await http.post(
      Uri.parse(
          'http://ec2-3-137-201-63.us-east-2.compute.amazonaws.com/api/khaleefa/create'),
      body: jsonEncode(data),
      headers: {'Content-type': 'application/json'},
    );
    logger.d(response);
    logger.d("response data");
    logger.d(response.body.toString());
    // Map body = {
    //   "booking_status": "done",
    //   "address": "vijayawada",
    //   "notes": "booking accepted",
    //   "employee": "rajiv",
    //   "booking_at": "15-feb-2023",
    //   "start_at": "15-feb-2023 12:30",
    //   "end_at": "15-feb-2023 2:30",
    //   "token": "N6&Sy{4;Hq`uQxr_"
    // };
    if (response.statusCode == 201) {
      status = response.body.isNotEmpty;
    }

    return status;
  }

  Future<bool> updateItem(Map data, String itemId) async {
    bool status = true;
    Map data = {
      "booking_status": "done1",
      "address": "vijayawada1",
      "notes": "booking accepted1",
      "employee": "rajiv1",
      "booking_at": "16-feb-2023",
      "start_at": "16-feb-2023 12:30",
      "end_at": "16-feb-2023 2:30",
      "token": "N6&Sy{4;Hq`uQxr_"
    };
    //Update the item, call the API
    http.Response response = await http.post(
        Uri.parse(
            'http://ec2-3-137-201-63.us-east-2.compute.amazonaws.com/api/khaleefa/update/5'),
        body: jsonEncode(data),
        headers: {'Content-type': 'application/json'});
    logger.d(response);
    logger.d("response data");
    logger.d(response.body.toString());
    if (response.statusCode == 200) {
      status = response.body.isNotEmpty;
    }

    return status;
  }

  Future<bool> deleteItem(String itemId) async {
    bool status = false;

    //Delete the item from the Database
    http.Response response = await http.post(
      Uri.parse(
          'http://ec2-3-137-201-63.us-east-2.compute.amazonaws.com/api/khaleefa/delete/4?token=N6%26Sy{4;Hq`uQxr_'),
    );

    if (response.statusCode == 200) {
      status = true;
    }

    return status;
  }
}

// import 'package:http/http.dart' as http;
// import 'dart:convert';

// class HTTPHelper {
//   //--Fetching all items
//   Future<List<Map>> fetchItems() async {
//     List<Map> items = [];

//     //--Get the data from the API
//     http.Response response =
//         await http.get(Uri.parse('https://jsonplaceholder.typicode.com/posts'));

//     if (response.statusCode == 200) {
//       //get the data from the response
//       String jsonString = response.body;
//       //Convert to List<Map>
//       List data = jsonDecode(jsonString);
//       items= data.cast<Map>();
//     }

//     return items;
//   }

//   //--Fetch details of one item
//   Future<Map> getItem(itemId) async {
//     Map item = {};

//     //Get the item from the API
//     http.Response response = await http
//         .get(Uri.parse('https://jsonplaceholder.typicode.com/posts/$itemId'));

//     if (response.statusCode == 200) {
//       //get the data from the response
//       String jsonString = response.body;
//       //Convert to List<Map>
//       item = jsonDecode(jsonString);
//     }

//     return item;
//   }

//   //-- Add a new item
//   Future<bool> addItem(Map data) async {
//     bool status = false;

//     //Add the item to the database, call the API
//     http.Response response = await http
//         .post(
//         Uri.parse('https://jsonplaceholder.typicode.com/posts'),
//         body: jsonEncode(data),
//         headers: {
//           'Content-type':'application/json'
//         }
//     );

//     if(response.statusCode==201)
//       {
//         status=response.body.isNotEmpty;
//       }

//     return status;
//   }

// //-- Update an item
//   Future<bool> updateItem(Map data, String itemId) async {
//     bool status = false;

//     //Update the item, call the API
//     http.Response response = await http
//         .put(
//         Uri.parse('https://jsonplaceholder.typicode.com/posts/$itemId'),
//         body: jsonEncode(data),
//         headers: {
//           'Content-type':'application/json'
//         }
//     );

//     if(response.statusCode==200)
//     {
//       status=response.body.isNotEmpty;
//     }

//     return status;
//   }

//   //--Delete an item
//   Future<bool> deleteItem(String itemId) async {
//     bool status = false;

//     //Delete the item from the Database
//     http.Response response=await http.delete(Uri.parse('https://jsonplaceholder.typicode.com/posts/$itemId'),);

//     if(response.statusCode==200)
//       {
//         status=true;
//       }

//     return status;
//   }
// }