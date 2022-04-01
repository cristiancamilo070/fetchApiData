import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:test_flutter/models/data_model.dart';

// ignore: camel_case_types
class Home_page extends StatefulWidget {
  const Home_page({Key? key}) : super(key: key);

  @override
  State<Home_page> createState() => _Home_pageState();
}

// ignore: camel_case_types
class _Home_pageState extends State<Home_page> {
   //late Future<List<Response>> completeData;
  late Future<Post> post;
  @override
  void initState() {
    super.initState();
    post: fetchPost();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Icon(Icons.ac_unit_sharp),
        title: const Text('Imgapps')
        ),
      body: FutureBuilder<Post>(
  future: fetchPost(),
  builder: (context, snapshot) {
    if (snapshot.hasData) {
      return  Column(
              children: [
                Expanded(
                child: ListView.builder(
                 // itemCount: snapshot.data.length,
                  itemBuilder: (BuildContext context,int index) {
                    return ListTile(
                     // title: Text(snapshot.data!.maximo),
                     // subtitle: Text(snapshot.data![index]["Máximo"]),
                    );
                  },
                ))
              ],
            );
          }
     else if (snapshot.hasError) {
      return Text("${snapshot.error}");
    } else {
             return const Center(child: CircularProgressIndicator());
        }
      },
    )
  );



  }
}