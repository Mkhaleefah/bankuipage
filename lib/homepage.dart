import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_application_2/add/add_file.dart';
import 'package:http/http.dart' as http;

// class HomePage extends StatelessWidget {
//   const HomePage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text('Login Data')),
//       floatingActionButton: FloatingActionButton.extended(
//         onPressed: navigateToAddPage,
//         label: Text('Add Todo'),
//         backgroundColor: Colors.green,
//       ),
//     );
//   }
class ToDo extends StatefulWidget {
  // const ToDo({super.key});
  // final Map? todo;
  // const ToDo({
  //   super.key,
  //   this.todo,
  // });

  @override
  State<ToDo> createState() => _ToDoState();
}

class _ToDoState extends State<ToDo> {
  bool isLoading = true;
  List items = [];

  //var isLoading;
  @override
  void initState() {
    super.initState();
    //  fetchHomePage();
    fetchHompage();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Login Data')),
      // body: ListView.builder(
      //   itemCount: items.length,
      //   itemBuilder: (context, index) {
      //     final item = items[index] as Map;
      //     return ListTile(
      //       leading: Text('$items+1'),
      //       title: Text(item['employee']),
      //       subtitle: Text(item['bookingat']),
      //     );
          //     }),
          body: Visibility(
            visible: isLoading,
            child: Center(
              child: CircularProgressIndicator(),
            ),
            replacement: RefreshIndicator(
              // onRefresh: fetchHomePage,
              onRefresh: fetchHompage,
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: items.length,
                itemBuilder: (context, index) {
                  final item = items[index] as Map;
                  return ListTile(
                    leading: CircleAvatar(
                      child: Text('${index + 1}'),
                    ),
                    title: Text(item['employee']),
                    subtitle: Text(item['bookingat']),
                    trailing: PopupMenuButton(
                      onSelected: ((value) {
                        if (value == 'edit') {
                            //EditPage(item);
                          } else if (value == 'delete') {
                           // deleteById(id);
                          }
                      }),
                      itemBuilder: (context) {
                        return const [
                          PopupMenuItem(child: Text('edit'), value: 'edit'),
                          PopupMenuItem(
                            child: Text('delete'),
                            value: 'delete',
                          )
                        ];
                      },
                    ),
                  );
        },
      ),
         ),
       ),

      floatingActionButton: FloatingActionButton.extended(
        onPressed: navigateToAddPage,
        label: Text('Add Todo'),
        backgroundColor: Colors.green,
      ),
    );
  }

  void navigateToAddPage() {
    final route = MaterialPageRoute(
      builder: (context) => AddFile(
        todo: {},
      ),
    );
    Navigator.push(context, route);
  }

  Future<void> fetchHompage() async {
    var headers = {'Content-Type': 'application/json'};
    final url = 
    //Uri.parse('http://ec2-3-137-201-63.us-east-2.compute.amazonaws.com/api/khaleefa/fetch');
    'http://ec2-3-137-201-63.us-east-2.compute.amazonaws.com/api/khaleefa/fetch?token=N6%26Sy{4;Hq`uQxr_&id=3';
    
    // log(response.body.toString());
     final uri = Uri.parse(url);
    final response = await http.get(uri);
    // print(response.statusCode);
    // print(response.body);
    if (response.statusCode == 200) {
      final json = jsonDecode(response.body) as Map<String, dynamic>;
      final result = json['items'] as List;
      setState(() {
        items = result;
      });
    }
    setState(() {
      isLoading = false;
    });

    //      String url = "http://ec2-3-137-201-63.us-east-2.compute.amazonaws.com/api/khaleefa/fetch";
    //   final response = await http.get(Uri.parse(url));

    //   var responseData = json.decode(response.body);

    //   //Creating a list to store input data;
    //  // List<User> users = [];
    //   List<Card> cards = [];
    //   for (var singleCard in responseData) {
    //   //  User user = User(
    //       Card card = Card(
    //         // id: singleUser["id"],
    //         // userId: singleUser["userId"],
    //         // title: singleUser["title"],
    //         // body: singleUser["body"]
    //         //  id: singleCard ["1"],
    //         //   booking_status:singleCard ["done"],
    //         //   address: ["vijayawada"],
    //         //   notes: "booking accepted",
    //         //   employee: "rajiv",
    //         //   booking_at: "15-feb-2023",
    //         //   start_at: "15-feb-2023 12:30",
    //         //   end_at: "15-feb-2023 2:30",
    //         //   created_at: "2023-01-30 05:31:43"
    //         id: json["id"],
    //       bookingStatus: json["booking_status"],
    //       address: json["address"],
    //       notes: json["notes"],
    //       employee: json["employee"],
    //       bookingAt: json["booking_at"],
    //       startAt: json["start_at"],
    //       endAt: json["end_at"],
    //         );

    //     //Adding user to the list.
    //    // users.add(user);
    //    cards.add(card);
    //   }
    //  // return users;
    //  return cards;
    //   }

//   Future<void> fetchHomePage() async {
//     var url = Uri.parse(
//         'http://ec2-3-137-201-63.us-east-2.compute.amazonaws.com/api/khaleefa/fetch');
//     try {
//       final respnse = await http.get(url);
//       final extractedData = json.decode(respnse.body) as Map<String, dynamic>;
//       final List<Card> loadedProducts = [];
//        extractedData.forEach((key,value) {
// loadedProducts.add(Card(
//             // id: key,
//             // title: value['title'],
//             // description: value['description'],
//             // price: value['price'],
//             // isFavorite: value['isFavorite'],
//             // imageUrl: value['imageUrl']
//             //  id: key,
//             // "booking_status":value ["done"],
//             // "address": "vijayawada",
//             // "notes": "booking accepted",
//             // "employee": "rajiv",
//             // "booking_at": "15-feb-2023",
//             // "start_at": "15-feb-2023 12:30",
//             // "end_at": "15-feb-2023 2:30",
//             // "created_at": "2023-01-30 05:31:43"
            
//             ));
//        });
//     } catch (error) {
//       print(error);
//       throw error;
//     }
//   }

    Future<void> EditPage(Map item) async {
      final route =
          MaterialPageRoute(builder: (context) => AddFile(todo: item));
      await Navigator.push(context, route);
      setState(() {
        //  isLoading = true;
      });
      fetchHompage();
    }
  }
}
