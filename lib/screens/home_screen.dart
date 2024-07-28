import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:student_management_getx/controller/student_controller.dart';
import 'package:student_management_getx/model/student_model.dart';
import 'package:student_management_getx/screens/edit_screen.dart';
import 'package:student_management_getx/screens/full_view.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final StudentController studentController = Get.find();
    final TextEditingController searchController = TextEditingController();
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(140),
        child: AppBar(
          foregroundColor: Colors.black,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(30),
                bottomRight: Radius.circular(30)),
          ),
          backgroundColor: const Color.fromARGB(255, 160, 122, 122),
          title: const Text(
            "Student Details",
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
          flexibleSpace: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 6),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              // Align column to bottom

              children: [
                const SizedBox(
                  height: 60,
                ),
                SizedBox(
                  width: double.infinity,
                  child: TextFormField(
                      decoration: InputDecoration(
                        hintText: 'Search...',
                        contentPadding:
                            const EdgeInsets.fromLTRB(15.0, 5.0, 15.0, 5.0),
                        prefixIcon: const Icon(Icons.search),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide: const BorderSide(
                              color: Colors
                                  .black), // Set the border color to black
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide: const BorderSide(
                              color: Colors
                                  .black), // Set the border color to black for enabled state
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide: const BorderSide(
                              color: Colors
                                  .black), // Set the border color to black for focused state
                        ),
                      ),
                      onChanged: (value) {
                        studentController.searchStudent(value);
                        Get.back();
                      }),
                )
              ],
            ),
          ),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(6.0),
          child: Column(
            children: [
              Expanded(
                child: ListView.builder(
                  itemCount: studentController.studentList.length,
                  itemBuilder: (context, index) {
                    final StudentModel student =
                        studentController.studentList[index];
                    return SizedBox(
                      height: 90,
                      child: Card(
                        color: const Color.fromARGB(255, 219, 190, 190),
                        child: ListTile(
                          onTap: () {
                            Get.to(FullViewScreen(student: student));
                          },
                          title: Text(
                            student.studentName ?? '',
                            style: const TextStyle(fontWeight: FontWeight.bold),
                          ),
                          subtitle: Text(
                            student.registerNumber ?? '',
                            style: const TextStyle(color: Colors.black),
                          ),
                          leading: CircleAvatar(
                            radius: 25,
                            backgroundImage:
                                student.photo == null || student.photo!.isEmpty
                                    ? const AssetImage('assets/download.png')
                                    : FileImage(File(student.photo!))
                                        as ImageProvider,
                            child:
                                student.photo == null || student.photo!.isEmpty
                                    ? const Icon(Icons.person, size: 25)
                                    : null,
                          ),
                          trailing: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              IconButton(
                                onPressed: () {
                                  Get.to(EditStudentDetails(student: student));
                                },
                                icon: const Icon(
                                  Icons.edit,
                                  color: Colors.black,
                                ),
                              ),
                              IconButton(
                                onPressed: () {
                                  Get.dialog(AlertDialog(
                                    title: const Text("Delete"),
                                    content: const Text(
                                        "Are you sure you want delete this student details"),
                                    actions: [
                                      TextButton(
                                          onPressed: () {
                                            Get.back();
                                          },
                                          child: const Text("Cancel")),
                                      TextButton(
                                          onPressed: () {
                                            studentController
                                                .deleteStudent(student);
                                            Get.back();
                                          },
                                          child: const Text("Delete"))
                                    ],
                                  ));
                                },
                                icon: const Icon(
                                  Icons.delete,
                                  color: Colors.red,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
