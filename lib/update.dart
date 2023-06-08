import 'package:flut_app/MongoDbModel.dart';
import 'package:flut_app/display.dart';
import 'package:flut_app/dpHelper/mongodb.dart';
import 'package:flutter/material.dart';

class MongodbUpdate extends StatefulWidget {
  const MongodbUpdate({Key? key}) : super(key: key);

  @override
  State<MongodbUpdate> createState() => _MongodbInsertState();
}

class _MongodbInsertState extends State<MongodbUpdate> {
  Future load() async {}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white70,
      appBar: AppBar(
        title: Text("Auth_admin"),
        leading: IconButton(
          icon: Icon(Icons.home),
          onPressed: () {},
        ),
        actions: <Widget>[
          IconButton(onPressed: () {}, icon: Icon(Icons.person))
        ],
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
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 0,
        fixedColor: Colors.green,
        items: [
          BottomNavigationBarItem(
            label: "Home",
            icon: Icon(Icons.home),
          ),
          BottomNavigationBarItem(
            label: "Profile",
            icon: Icon(Icons.person),
          ),
        ],
        onTap: (int index) {
          print(index.toString());
        },
      ),
    );
  }

  Widget displaycard(User data) {
    return Card(
      child: Padding(
        padding: EdgeInsets.all(10),
        child: Column(
          children: [
            Text(
              "${data.email}",
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              "Password: ${data.password}",
              style: TextStyle(fontSize: 15),
            ),
            IconButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (BuildContext context) {
                            return MongodbInsert();
                          },
                          settings: RouteSettings(arguments: data)));
                },
                icon: Icon(Icons.edit))
          ],
        ),
      ),
    );
  }
}
