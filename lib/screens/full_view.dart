import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:student_management_getx/controller/student_controller.dart';
import 'package:student_management_getx/model/student_model.dart';
import 'package:student_management_getx/screens/edit_screen.dart';

class FullViewScreen extends StatelessWidget {
  final StudentModel student;
  final StudentController studentController = Get.find();

  FullViewScreen({super.key, required this.student});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 160, 122, 122),
        title: const Text(
          "Student Details",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: Obx(() {
        final updatedStudent = studentController.studentRxList
            .firstWhere((element) => element.key == student.key);
        return SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 50),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Stack(
                  clipBehavior: Clip.none,
                  children: [
                    const Card(
                      color: Color.fromARGB(255, 160, 122, 122),
                      child: SizedBox(
                        height: 400,
                        width: double.infinity,
                      ),
                    ),
                    Positioned(
                      top: -30,
                      left: (MediaQuery.of(context).size.width / 2) - 80,
                      child: CircleAvatar(
                        backgroundImage: updatedStudent.photo != null &&
                                updatedStudent.photo!.isNotEmpty
                            ? FileImage(File(updatedStudent.photo!))
                            : const AssetImage("assets/download.png")
                                as ImageProvider,
                        radius: 80,
                        backgroundColor: const Color.fromARGB(255, 6, 1, 20),
                      ),
                    ),
                    Positioned(
                      top: 100,
                      left: 20,
                      right: 20,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(height: 40),
                          Text(
                            'Name : ${updatedStudent.studentName}',
                            style: const TextStyle(
                              color: Color.fromARGB(255, 0, 0, 0),
                              fontWeight: FontWeight.w900,
                            ),
                          ),
                          const SizedBox(height: 15),
                          Text(
                            'Age : ${updatedStudent.age}',
                            style: const TextStyle(
                              color: Color.fromARGB(255, 0, 0, 0),
                              fontWeight: FontWeight.w900,
                            ),
                          ),
                          const SizedBox(height: 15),
                          Text(
                            'Reg no : ${updatedStudent.registerNumber}',
                            style: const TextStyle(
                              color: Color.fromARGB(255, 0, 0, 0),
                              fontWeight: FontWeight.w900,
                            ),
                          ),
                          const SizedBox(height: 15),
                          Text(
                            'Phone No : ${updatedStudent.phoneNumber}',
                            style: const TextStyle(
                              color: Color.fromARGB(255, 0, 0, 0),
                              fontWeight: FontWeight.w900,
                            ),
                          ),
                          const SizedBox(
                            height: 40,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              ElevatedButton(
                                  onPressed: () {
                                    Get.to(
                                        EditStudentDetails(student: student));
                                  },
                                  child: const Text(
                                    "EDIT",
                                    style: TextStyle(color: Colors.black),
                                  )),
                              const SizedBox(
                                width: 20,
                              ),
                              ElevatedButton(
                                  onPressed: () {
                                    Get.dialog(AlertDialog(
                                      title: const Text("Delete"),
                                      content: const Text(
                                          "Are you sure you want to delete this student details?"),
                                      actions: [
                                        TextButton(
                                          onPressed: () {
                                            Get.back();
                                          },
                                          child: const Text("Cancel"),
                                        ),
                                        TextButton(
                                          onPressed: () {
                                            studentController
                                                .deleteStudent(student);
                                            Get.back();
                                            Get.back();
                                          },
                                          child: const Text("Delete"),
                                        ),
                                      ],
                                    ));
                                  },
                                  child: const Text(
                                    "DELETE",
                                    style: TextStyle(color: Colors.black),
                                  )),
                            ],
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      }),
    );
  }
}
