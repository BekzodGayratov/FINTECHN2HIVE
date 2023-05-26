import 'package:database/db/db_service.dart';
import 'package:database/models/user_model.dart';
import 'package:database/service/user_service.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("WORK WITH API")),
      body: RefreshIndicator(
        onRefresh: DBService().checkBox,
        child: FutureBuilder(
            future: DBService().checkBox(),
            builder: (context, AsyncSnapshot snapshot) {
              if (!snapshot.hasData) {
                return const Center(
                    child: CircularProgressIndicator.adaptive());
              } else if (snapshot.data is String) {
                return Center(child: Text(snapshot.data));
              } else {
                List data = snapshot.data as List;
                return ListView.builder(
                    itemCount: data.length,
                    itemBuilder: (context, index) => ListTile(
                          title: Text(data[index]['name'].toString()),
                          subtitle: Text(data[index]['email'].toString()),
                        ));
              }
            }),
      ),
    );
  }
}
