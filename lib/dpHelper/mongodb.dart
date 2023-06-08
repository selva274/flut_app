import 'dart:developer';

import 'package:flut_app/dpHelper/constant.dart';
import 'package:mongo_dart/mongo_dart.dart';

class MongodbDatabase {
  static var db, usercollection;
  static connect() async {
    db = await Db.create(MONGODB_URL);
    await db.open();
    print(db);
    usercollection = await db.collection(USER_COLLECTION);
  }

  static Future<List<Map<String, dynamic>>> getData() async {
    final arrdata = await usercollection.find().toList();
    return arrdata;
  }
}
