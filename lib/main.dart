import 'package:flutter/material.dart';
import 'Sqfdb.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  Sqfdb sqfdb = Sqfdb();

  @override
  State<StatefulWidget> createState() {
    throw UnimplementedError();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Crud SQL')),
      body: Container(
        child: Row(children: [
          MaterialButton(
            color: Colors.red,
            textColor: Colors.white,
            onPressed: () async {
              await sqfdb
                  .insertData("Insert into 'Fruit' ('name') values ('Apple')");
            },
            child: Text("Inser data"),
          ),
          MaterialButton(
              color: Colors.red,
              textColor: Colors.white,
              onPressed: () async {
                List<Map> data = await sqfdb.readData("Select * from 'Fruit'");
              },
              child: Text("Get data")),
          MaterialButton(
              color: Colors.red,
              textColor: Colors.white,
              onPressed: () async {
                await sqfdb.insertData(
                    "Insert into 'Fruit' ('name') values ('Apple')");
              },
              child: Text("Inser data")),
          MaterialButton(
              color: Colors.red,
              textColor: Colors.white,
              onPressed: () async {
                await sqfdb.updateData("update 'Fruit' se 'name' = 'Orange'");
              },
              child: Text("Update data")),
          MaterialButton(
              color: Colors.red,
              textColor: Colors.white,
              onPressed: () async {
                await sqfdb.delatetData(
                    "delete * from 'Fruit' where 'name' = 'Orange'");
              },
              child: Text("Delete data")),
        ]),
      ),
    );
  }
}
