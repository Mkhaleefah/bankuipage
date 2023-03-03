import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_application_2/api_user.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_application_2/screen/add_post.dart';
import 'package:flutter_application_2/screen/post_details.dart';
import 'package:flutter_application_2/add/http_helper.dart';

class PostsList extends StatelessWidget {
  PostsList({Key? key}) : super(key: key);

  // Future<List<Map>> _futurePosts = HTTPHelper().fetchItems();
  List<Apiuser>? apilist;
 // List<Apiuser>? HTTPHelper;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(' Api Methods'),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.of(context)
                .push(MaterialPageRoute(builder: (context) => AddPost()));
          },
          child: const Icon(Icons.add),
        ),
        // body: FutureBuilder<List<Map>>(
        // //  future: _futurePosts,
        //   builder: (BuildContext context, AsyncSnapshot snapshot) {
        //     //Check for errors
        //     if (snapshot.hasError) {
        //       return Center(child: Text('Some error occurred ${snapshot.error}'));
        //     }
        //     //Has data arrived
        //     if (snapshot.hasData) {
        //       List<Map> posts = snapshot.data;

        //       return ListView.builder(
        //           itemCount: posts.length,
        //           itemBuilder: (context, index) {
        //             Map thisItem = posts[index];
        //             return ListTile(
        //               title: Text('${thisItem['title']}'),
        //               subtitle: Text('${thisItem['body']}'),
        //               onTap: () {
        //                 Navigator.of(context).push(MaterialPageRoute(
        //                     builder: (context) =>
        //                         PostDetails(thisItem['id'].toString())));
        //               },
        //             );
        //           });
        //     }

        //     //Display a loader
        //     return Center(child: CircularProgressIndicator());
        //   },
        // ),

        body: Column(
          children: [
            if (apilist != IndexError) getList(),
          ],
        )

// final List<String> entries = <String>['A', 'B', 'C'];
// final List<int> colorCodes = <int>[600, 500, 100];

// Widget build(BuildContext context) {
//   return ListView.builder(
//     padding: const EdgeInsets.all(8),
//     itemCount: entries.length,
//     itemBuilder: (BuildContext context, int index) {
//       return Container(
//         height: 50,
//         color: Colors.amber[colorCodes[index]],
//         child: Center(child: Text('Entry ${entries[index]}')),
//       );
//     }
//   );
// }

        );
  }

  Widget getList() {
    return Expanded(
      child: ListView.builder(
          itemCount: apilist?.length,
          itemBuilder: (BuildContext context, int index) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Card(
                  elevation: 5,
                  child: Container(
                    width: double.infinity,
                    padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                    // child: Text('${apilist?[index].status}'),
                    child: ListTile(
                      title:
                       Text('${apilist?[index].status}'),

                       ),
                  ),
                )
              ],
            );
          }),
    );
  }

  Future<void> getapidata() async {
    String url =
        'http://ec2-3-137-201-63.us-east-2.compute.amazonaws.com/api/khaleefa/fetch?token=N6%26Sy{4;Hq`uQxr_';
    var result = await http.get(Uri.parse(url));

    apilist = jsonDecode(result.body)
        .map((item) => apiuserFromJson(item))
        .toList()
        .cast<Apiuser>();
    //setState(() {});
  }
}
