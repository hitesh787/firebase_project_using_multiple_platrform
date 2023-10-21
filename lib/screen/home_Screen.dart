import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_project_using_multiple_platrform/model/data_model.dart';
import 'package:firebase_project_using_multiple_platrform/screen/add_dilog_box.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final CollectionReference _customData = FirebaseFirestore.instance.collection("custom_data");

  bool dataText = false;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text("Firebase Firestorm"),
        ),
        floatingActionButton: FloatingActionButton(
            onPressed: () {
              showDialog(
                  context: (context),
                  builder: (_) {
                    return AddDataDilogBox(
                      userRef: _customData,
                    );
                  });
            },
            child: const Icon(Icons.add)),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Column(
            children: [
             StreamBuilder(
                  stream: _customData.snapshots(),
                  builder: (context, AsyncSnapshot<QuerySnapshot> streamSnapshot) {
                    if (streamSnapshot.hasData) {
                      return Expanded(
                        child: ListView.builder(
                            itemCount: streamSnapshot.data!.docs.length,
                            itemBuilder: (context, index) {
                              final DocumentSnapshot<Map<String, dynamic>> userData = streamSnapshot.data!.docs[index] as DocumentSnapshot<Map<String, dynamic>>;
                              final CustomData userModelData = CustomData.fromFireStore(userData);
                              return Padding(
                                padding: const EdgeInsets.only(bottom: 15),
                                child: Card(
                                  child: Padding(
                                    padding: const EdgeInsets.all(10),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Expanded(
                                          child: Row(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              GestureDetector(
                                                  onTap:(){
                                                    print("selectes Pic");
                                                  },
                                                  child: const CircleAvatar(radius: 28)),
                                              const SizedBox(width: 15),
                                              Expanded(
                                                child: Column(
                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                  children: [
                                                    Text("${userModelData.name}"),
                                                    Text("${userModelData.phoneNumber}"),
                                                    Text("${userModelData.address}"),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Column(
                                          children: [
                                            IconButton(
                                                onPressed: () async {
                                                  showDialog(
                                                      context: (context),
                                                      builder: (_) {
                                                        return AddDataDilogBox(
                                                          userRef: _customData,
                                                          customModel: userModelData,
                                                        );
                                                      });
                                                },
                                                icon: const Icon(
                                                  Icons.edit,
                                                  color: Colors.green,
                                                )),

                                            IconButton(
                                                onPressed: () async {
                                                  await _customData.doc(userModelData.uid).delete();
                                                  showMsg(context, 'Delete Successfully !', isError: true,);
                                                },
                                                icon: const Icon(
                                                  Icons.delete,
                                                  color: Colors.redAccent,
                                                )),
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              );
                            }),
                      );
                    }
                    return const Expanded(child: Center(child: CupertinoActivityIndicator(radius: 20)));
                  })
            ],
          ),
        ));
  }
}
