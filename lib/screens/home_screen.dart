import 'package:flutter/material.dart';
import 'package:taskmate/constants/global_variables.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final CollectionReference task =
      FirebaseFirestore.instance.collection('Task');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(80),
        child: AppBar(
          flexibleSpace: Container(
            decoration: const BoxDecoration(
              gradient: GlobalVariables.appBarGradient,
            ),
          ),
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'TaskMate',
                style: TextStyle(
                  color: Color.fromARGB(255, 13, 113, 16),
                  fontWeight: FontWeight.bold,
                ),
              ),
              Container(
                alignment: Alignment.topLeft,
                child: Image.asset(
                  'assets/images/logo.png',
                  width: 87,
                  height: 87,
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, '/add');
        },
        backgroundColor: GlobalVariables.darkGreenColor,
        child: const Icon(Icons.add_outlined),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      body: StreamBuilder(
          stream: task.snapshots(),
          builder: (context, AsyncSnapshot snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                  itemCount: snapshot.data!.docs.length,
                  itemBuilder: (context, index) {
                    final DocumentSnapshot taskSnap = snapshot.data.docs[index];
                    return Container(
                      height: 80,
                      color: Colors.white,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            child: CircleAvatar(
                              backgroundColor: GlobalVariables.darkGreenColor,
                              radius: 40,
                              child: Text(
                                taskSnap['status'],
                                style: TextStyle(fontSize: 16),
                              ),
                            ),
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                taskSnap['title'],
                                style: const TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.bold),
                              ),
                              Text(
                                taskSnap['description'],
                                style: const TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.w500),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              IconButton(
                                onPressed: () {},
                                icon: const Icon(
                                  Icons.edit_note,
                                  color: Color.fromARGB(255, 239, 209, 15),
                                  size: 35,
                                ),
                              ),
                              IconButton(
                                onPressed: () {},
                                icon: const Icon(
                                  Icons.delete,
                                  color: Color.fromARGB(255, 159, 12, 12),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    );
                  });
            }
            return Container();
          }),
    );
  }
}
