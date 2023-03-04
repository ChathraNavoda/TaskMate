import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:taskmate/constants/global_variables.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:taskmate/screens/auth/login.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final CollectionReference task =
      FirebaseFirestore.instance.collection('Task');

  void deleteTask(docId) {
    task.doc(docId).delete();
  }

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
            // mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              const Text(
                'TaskMate',
                style: TextStyle(
                  color: Color.fromARGB(255, 13, 113, 16),
                  fontWeight: FontWeight.bold,
                ),
              ),
              Container(
                alignment: Alignment.center,
                child: Image.asset(
                  'assets/images/logo.png',
                  width: 87,
                  height: 87,
                ),
              ),
              const SizedBox(
                width: 120,
              ),
              IconButton(
                  onPressed: () async => {
                        await FirebaseAuth.instance.signOut(),
                        Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(
                              builder: (context) => Login(),
                            ),
                            (route) => false)
                      },
                  icon: const Icon(Icons.logout))
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, '/add');
        },
        backgroundColor: GlobalVariables.lightGreenColor,
        child: const Icon(Icons.add_outlined),
      ),
      floatingActionButtonLocation:
          FloatingActionButtonLocation.miniCenterFloat,
      body: StreamBuilder(
          stream: task.orderBy('title').snapshots(),
          builder: (context, AsyncSnapshot snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                  itemCount: snapshot.data!.docs.length,
                  itemBuilder: (context, index) {
                    final DocumentSnapshot taskSnap = snapshot.data.docs[index];
                    return Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 20, horizontal: 10),
                      child: Container(
                        height: 80,
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: GlobalVariables.lightGreenColor,
                            width: 0.1,
                          ),
                          borderRadius: BorderRadius.circular(50),
                          boxShadow: [
                            BoxShadow(
                              color: GlobalVariables.containerGreenColor,
                              blurRadius: 10,
                              spreadRadius: 7,
                            ),
                          ],
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            CircleAvatar(
                              backgroundColor: GlobalVariables.lightGreenColor,
                              radius: 40,
                              child: Text(
                                taskSnap['status'],
                                style: const TextStyle(
                                    fontSize: 16,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w600),
                              ),
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  taskSnap['title'],
                                  style: const TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  taskSnap['description'],
                                  style: const TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                IconButton(
                                  onPressed: () {
                                    Navigator.pushNamed(context, '/update',
                                        arguments: {
                                          'title': taskSnap['title'],
                                          'description':
                                              taskSnap['description'],
                                          'status': taskSnap['status'],
                                          'id': taskSnap.id,
                                        });
                                  },
                                  icon: const Icon(
                                    Icons.edit_note,
                                    color: Color.fromARGB(255, 248, 192, 7),
                                    size: 35,
                                  ),
                                ),
                                IconButton(
                                  onPressed: () {
                                    deleteTask(taskSnap.id);
                                  },
                                  icon: const Icon(
                                    Icons.delete,
                                    color: Color.fromARGB(255, 159, 12, 12),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    );
                  });
            }
            return Container();
          }),
    );
  }
}
