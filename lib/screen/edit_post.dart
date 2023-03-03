import 'package:flutter/material.dart';

import 'package:flutter_application_2/add/http_helper.dart';
class EditPost extends StatefulWidget {
  EditPost(this.post, {Key? key}) : super(key: key);
  Map post;

  @override
  State<EditPost> createState() => _EditPostState();
}

class _EditPostState extends State<EditPost> {
  TextEditingController _controllerName = TextEditingController();
  TextEditingController _controllerBody = TextEditingController();

  initState() {
    super.initState();
    _controllerName.text = widget.post['title'];
    _controllerBody.text = widget.post['body'];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit Post'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          child: Column(
            children: [
              TextFormField(
                controller: _controllerName,
              ),
              TextFormField(
                controller: _controllerBody,
                maxLines: 5,
              ),
              ElevatedButton(
                  onPressed: () async {
                    Map<String, String> dataToUpdate = {
                      'title': _controllerName.text,
                      'body': _controllerBody.text,
                    };

                    bool status = await HTTPHelper()
                        .updateItem(dataToUpdate, widget.post['booking'].toString());

                    if (status) {
                      ScaffoldMessenger.of(context)
                          .showSnackBar(SnackBar(content: Text('Post updated')));
                    }
                    else
                      {
                        ScaffoldMessenger.of(context)
                            .showSnackBar(SnackBar(content: Text('Failed to update the post')));
                      }
                  },
                  child: Text('Submit'))
            ],
          ),
        ),
      ),
    );
  }
}