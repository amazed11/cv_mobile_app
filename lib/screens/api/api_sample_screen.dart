import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../../models/post/post_response_model.dart';

class ApiSampleScren extends StatefulWidget {
  const ApiSampleScren({super.key});

  @override
  State<ApiSampleScren> createState() => _ApiSampleScrenState();
}

class _ApiSampleScrenState extends State<ApiSampleScren> {
  @override
  void initState() {
    getPosts();
    super.initState();
  }

  //get
  //post
  //delete
  //put ra patch
  bool isLoading = true;
  List<PostResponseModel>? data;

  void getPosts() async {
    try {
      setState(() {
        isLoading = true;
      });
      await Future.delayed(const Duration(seconds: 3));
      var response = await http
          .get(Uri.parse("https://jsonplaceholder.typicode.com/posts"));
      if (response.statusCode == 200) {
        setState(() {
          data = postResponseModelFromJson(response.body);
          isLoading = false;
        });
      } else {
        if (response.statusCode == 401) {}
      }
    } catch (e) {
      print(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Api Sample"),
      ),
      body: isLoading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : RefreshIndicator(
              onRefresh: () async {
                getPosts();
              },
              child: ListView.builder(
                padding: const EdgeInsets.all(20),
                itemCount: data?.length ?? 0,
                itemBuilder: (context, index) {
                  return Card(
                    child: ListTile(
                      isThreeLine: true,
                      leading: CircleAvatar(
                        child: Text(
                          data?[index].id.toString() ?? '',
                          maxLines: 1,
                          style: const TextStyle(
                            fontSize: 16,
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      title: Text(
                        data?[index].title ?? 'No title',
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      trailing: IconButton.filledTonal(
                        onPressed: () {},
                        icon: const Icon(Icons.keyboard_arrow_right_rounded),
                      ),
                      subtitle: Text(
                        data?[index].body ?? 'No body',
                        maxLines: 1,
                        style: const TextStyle(
                          fontSize: 13,
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  );
                },
              ),
            ),
    );
  }
}
