import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:taskmate/constants/global_variables.dart';

class UpdateTaskScreen extends StatefulWidget {
  const UpdateTaskScreen({super.key});

  @override
  State<UpdateTaskScreen> createState() => _UpdateTaskScreenState();
}

class _UpdateTaskScreenState extends State<UpdateTaskScreen> {
  final taskStatus = ['Pending', 'Complted'];
  String? selectedTask;
  final CollectionReference task =
      FirebaseFirestore.instance.collection('Task');

  TextEditingController taskTitle = TextEditingController();
  TextEditingController taskDescription = TextEditingController();

  void updateTask(docId) {
    final data = {
      'title': taskTitle.text,
      'description': taskDescription.text,
      'status': selectedTask,
    };
    task.doc(docId).update(data).then((value) => Navigator.pop(context));
  }

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as Map;

    taskTitle.text = args['title'];
    taskDescription.text = args['description'];
    selectedTask = args['status'];
    final docId = args['id'];

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60),
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
                'Update Task',
                style: TextStyle(
                  color: Color.fromARGB(255, 13, 113, 16),
                  fontWeight: FontWeight.bold,
                ),
              ),
              Container(
                alignment: Alignment.topLeft,
                child: Image.asset(
                  'assets/images/logo.png',
                  width: 80,
                  height: 80,
                  //color: Colors.black,
                ),
              ),
            ],
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(6.0),
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.all(6.0),
              child: TextField(
                controller: taskTitle,
                keyboardType: TextInputType.text,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  label: Text(
                    'Title',
                    style: TextStyle(color: Color.fromARGB(255, 13, 113, 16)),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(6.0),
              child: TextField(
                controller: taskDescription,
                keyboardType: TextInputType.multiline,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  label: Text(
                    'Description',
                    style: TextStyle(color: Color.fromARGB(255, 13, 113, 16)),
                  ),
                ),
                maxLines: 4,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: DropdownButtonFormField(
                  value: selectedTask,
                  decoration: InputDecoration(
                    label: Text(
                      'Select status',
                      style: TextStyle(color: GlobalVariables.darkGreenColor),
                    ),
                  ),
                  items: taskStatus
                      .map((e) => DropdownMenuItem(
                            child: Text(e),
                            value: e,
                          ))
                      .toList(),
                  onChanged: (val) {
                    selectedTask = val as String?;
                  }),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 40),
              child: ElevatedButton(
                style: ButtonStyle(
                    minimumSize: MaterialStateProperty.all(
                        const Size(double.infinity, 50)),
                    backgroundColor: MaterialStateProperty.all(
                        GlobalVariables.darkGreenColor)),
                onPressed: () {
                  updateTask(docId);

                  //print(args);
                },
                child: const Text(
                  'Update',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
