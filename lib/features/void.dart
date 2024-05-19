import 'package:flutter/material.dart';
import '/core/database/db/sqflite.dart';

class VoidTest extends StatelessWidget {
  const VoidTest({
    super.key,
    this.sqfliteDataBase,
  });

  final SqfliteDataBase? sqfliteDataBase;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(),
      body: Column(
        children: [
          Expanded(
            child: FutureBuilder(
              future: readData(),
              builder: (BuildContext context,
                  AsyncSnapshot<List<Map<String, dynamic>>> snapshot) {
                if (snapshot.hasData) {
                  return ListView.builder(
                    itemCount: snapshot.data!.length,
                    itemBuilder: (context, index) {
                      return Center(
                          child: Row(
                        children: [
                          Text("${snapshot.data![index]["id"]}"),
                          SizedBox(
                            width: 10,
                          ),
                          Text("${snapshot.data![index]["todo"]}")
                        ],
                      ));
                    },
                  );
                } else {
                  return Center(child: Text("data"));
                }
              },
            ),
          ),
        ],
      ),
    );
  }

  Future<List<Map<String, dynamic>>> readData() async {
    List<Map<String, dynamic>> allData =
        await sqfliteDataBase!.readDatabase("SELECT * FROM 'notes'");
    print("================database has been read==================");
    print(allData);
    return allData;
  }
}
