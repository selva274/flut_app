import 'package:flut_app/MongoDbModel.dart';
import 'package:flut_app/dpHelper/mongodb.dart';
import 'package:flutter/material.dart';

class MongodbInsert extends StatefulWidget {
  const MongodbInsert({Key? key}) : super(key: key);

  @override
  State<MongodbInsert> createState() => _MongodbInsertState();
}

class _MongodbInsertState extends State<MongodbInsert> {
  Future load() async {}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("MongoDb"),
      ),
      body: RefreshIndicator(
        onRefresh: load,
        child: SafeArea(
            child: FutureBuilder(
          future: MongodbDatabase.getData(),
          builder: (context, AsyncSnapshot snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                child: CircularProgressIndicator(),
              );
            } else {
              if (snapshot.hasData) {
                var totaldata = snapshot.data.length;
                print(totaldata.toString());
                return ListView.builder(
                    itemCount: snapshot.data.length,
                    itemBuilder: (context, index) {
                      return displaycard(User.fromJson(snapshot.data[index]));
                    });
              } else {
                return Center(
                  child: Text("No data found"),
                );
              }
            }
          },
        )),
      ),
    );
  }

  Widget displaycard(User data) {
    return Card(
      child: Padding(
        padding: EdgeInsets.all(10),
        child: Column(
          children: [
            Text("${data.email}"),
            SizedBox(
              height: 10,
            ),
            Text("${data.password}"),
          ],
        ),
      ),
    );
  }
}
